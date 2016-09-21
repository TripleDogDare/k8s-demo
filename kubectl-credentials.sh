set -euo pipefail
set -x

ZONE=${ZONE:-us-west1-a}
CLUSTER_NAME=${CLUSTER_NAME:-cluster-1}

gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${ZONE}
