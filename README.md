# remove-helmcharts

Helm-чарты для проекта lesson23.

## remove-app

Статическое SPA (serve на порту **3000**). В шаблоне: **Deployment** + **Service** (ClusterIP, 80 → 3000).

```bash
helm upgrade --install remove-app ./remove-app \
  --namespace default \
  --set image.repository=<AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/lesson23-app \
  --set image.tag=latest
```

`image.repository` — URI ECR **без тега** (подставляет Argo CD Application из Terraform). Тег `image.tag` после каждой сборки **remove-app** обновляет GitHub Actions (commit SHA) — Argo CD подхватывает изменение и делает sync.

Проверка без установки:

```bash
helm template demo ./remove-app --set image.repository=123.dkr.ecr.us-east-1.amazonaws.com/lesson23-app
```
