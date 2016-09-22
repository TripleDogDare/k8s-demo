set -euo pipefail
set -x

ZONE=${ZONE:-us-west1-a}
CLUSTER_NAME=${CLUSTER_NAME:-cluster-2}

gcloud --project ${PROJECT_ID} container clusters get-credentials ${CLUSTER_NAME} --zone ${ZONE}
