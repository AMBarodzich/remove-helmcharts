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

`image.repository` — URI ECR **без тега** (как в `terraform output` / консоли AWS). Тег образа — `image.tag` (например SHA коммита или `latest`).

Проверка без установки:

```bash
helm template demo ./remove-app --set image.repository=123.dkr.ecr.us-east-1.amazonaws.com/lesson23-app
```
