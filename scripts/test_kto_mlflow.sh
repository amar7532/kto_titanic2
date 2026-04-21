docker login -u='mamar77+titanic' -p='YKKRL3PCYCB38IAQDXNE53LKC8T43M6YJ5VLO6SNM5DEK9ONA4XETVGENRYUB8QR' quay.io # <--- mettez ici les informations de votre robot quay.io
kubectl config set-cluster openshift-cluster --server=https://api.rm1.0a51.p1.openshiftapps.com:6443 # <--- mettez ici l'url de votre cluster OpenShift
kubectl config set-credentials openshift-credentials sha256~6DwiudaPAPyc8IdLLZIdQAx5brHm2KdDkKimgvffShI # <--- mettez ici le token d'accès à votre cluster OpenShift
kubectl config set-context openshift-context --cluster=openshift-cluster --user=openshift-credentials --namespace=vars.mamar77-dev # <--- mettez ici votre namespace OpenShift
kubectl config use openshift-context

export KUBE_MLFLOW_TRACKING_URI=https://mlflow-mamar77-dev.apps.rm1.0a51.p1.openshiftapps.com  # <--- mettez ici l'url de votre service mlflow
export MLFLOW_TRACKING_URI=https://mlflow-mamar77-dev.apps.rm1.0a51.p1.openshiftapps.com  # <--- mettez ici l'url de votre service mlflow
export MLFLOW_S3_ENDPOINT_URL=https://minio-api-mamar77-dev.apps.rm1.0a51.p1.openshiftapps.com # <--- mettez ici l'url de votre service minio
export AWS_ACCESS_KEY_ID=minio
export AWS_SECRET_ACCESS_KEY=minio123

# Renseignez bien dans la ligne ci-dessous le tag de l'image que vous souhaitez construire (repository quay.io créé au préalable)
docker build -f ./k8s/experiment/Dockerfile -t quay.io/mamar77/titanic/experiment:latest --build-arg MLFLOW_S3_ENDPOINT_URL=$MLFLOW_S3_ENDPOINT_URL --build-arg AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID --build-arg AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY .
docker push quay.io/mamar77/titanic/experiment:latest

uv run mlflow run ../src/titanic/training -P path=all_titanic.csv --experiment-name kto-titanic --backend kubernetes --backend-config ./k8s/experiment/kubernetes_config.json
