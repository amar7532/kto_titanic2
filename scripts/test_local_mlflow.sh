export KUBE_MLFLOW_TRACKING_URI=https://mlflow-mamar77-dev.apps.rm1.0a51.p1.openshiftapps.com # <--- mettez ici l'url de votre service mlflow
export MLFLOW_TRACKING_URI=https://mlflow-mamar77-dev.apps.rm1.0a51.p1.openshiftapps.com # <--- mettez ici l'url de votre service mlflow
export MLFLOW_S3_ENDPOINT_URL=https://minio-api-mamar77-dev.apps.rm1.0a51.p1.openshiftapps.com # <--- mettez ici l'url de votre service minio
export AWS_ACCESS_KEY_ID=minio # <--- mettez ici le user minio
export AWS_SECRET_ACCESS_KEY=minio123 # <--- mettez ici le password minio

uv run mlflow run ./src/titanic/training -e main --env-manager=local -P path=all_titanic.csv --experiment-name kto-titanic
