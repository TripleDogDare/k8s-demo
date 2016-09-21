set -euo pipefail
set -x

[ ! -z "${DEVSHELL_GCLOUD_CONFIG:-}" ] && {
	[ -z "${PROJECT_ID:-}" ] && {
		PROJECT_ID=${DEVSHELL_PROJECT_ID}
	}
}

PROJECT_NAME='hello-world'
IMAGE="gcr.io/$PROJECT_ID/${PROJECT_NAME}:v1"

CONTAINER_NAME="${PROJECT_NAME}-test"

docker run -d -p 8080:8080 --name ${CONTAINER_NAME} ${IMAGE}
