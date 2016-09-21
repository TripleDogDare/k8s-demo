set -euo pipefail
set -x

[ ! -z "${DEVSHELL_GCLOUD_CONFIG:-}" ] && {
	[ -z "${PROJECT_ID:-}" ] && {
		PROJECT_ID=${DEVSHELL_PROJECT_ID}
	}
}

PROJECT_NAME='hello-world'
IMAGE="gcr.io/$PROJECT_ID/${PROJECT_NAME}:v1"

CGO_ENABLED=0 GOOS=linux go build hello.go
docker build -t ${IMAGE} .
gcloud docker push ${IMAGE}
