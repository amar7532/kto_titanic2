export MLFLOW_S3_ENDPOINT_URL=http://minio-api-balba-dev.apps.sandbox-m3.666.p1.openshiftapps.com # <--- mettez ici votre endpoint minio
export AWS_ACCESS_KEY_ID=minio
export AWS_SECRET_ACCESS_KEY=minio123
uv run ./src/titanic/training/main.py --input_data_path "all_titanic.csv" --n_estimators 100 --max_depth 10 --random_state 42