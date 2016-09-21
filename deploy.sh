set -euo pipefail
set -x

[ ! -z "${DEVSHELL_GCLOUD_CONFIG:-}" ] && {
	[ -z "${PROJECT_ID:-}" ] && {
		PROJECT_ID=${DEVSHELL_PROJECT_ID}
	}
}

PROJECT_NAME='hello-world'
IMAGE="gcr.io/$PROJECT_ID/${PROJECT_NAME}:v1"

kubectl run ${PROJECT_NAME} --image=${IMAGE} --port=8080
kubectl get deployments
kubectl get pods
kubectl expose deployment ${PROJECT_NAME} --type="LoadBalancer"
