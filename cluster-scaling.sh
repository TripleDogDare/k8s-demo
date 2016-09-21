set -euo pipefail
set -x

ZONE="us-west1-a"
# CLUSTER_NAME="k8s-demo-cluster"
CLUSTER_NAME="cluster-1"

CMD="${1:-}"
MIN_NODES=${2:-1}
MAX_NODES=${3:-10}

case "$CMD" in
create)
	>&2 echo $CMD
	gcloud --project ${PROJECT_ID} container clusters create ${CLUSTER_NAME} --zone ${ZONE} --num-nodes=3 --enable-autoscaling --min-nodes=${MIN_NODES} --max-nodes=${MAX_NODES}
	;;
enable)
	>&2 echo $CMD
	gcloud --project ${PROJECT_ID} container clusters update ${CLUSTER_NAME} --zone ${ZONE} --enable-autoscaling --min-nodes=${MIN_NODES} --max-nodes=${MAX_NODES}
	;;
disable)
	>&2 echo $CMD
	gcloud --project ${PROJECT_ID} container clusters update ${CLUSTER_NAME} --zone ${ZONE} --no-enable-autoscaling
	;;
*)
	>&2 echo "bad command '${CMD}'"
	;;
esac
