{{/*
Имя чарта (с учётом nameOverride).
*/}}
{{- define "remove-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Полное имя релиза.
*/}}
{{- define "remove-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Метка chart (версия чарта).
*/}}
{{- define "remove-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Общие labels.
*/}}
{{- define "remove-app.labels" -}}
helm.sh/chart: {{ include "remove-app.chart" . }}
{{ include "remove-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Селекторы пода / сервиса.
*/}}
{{- define "remove-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "remove-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
