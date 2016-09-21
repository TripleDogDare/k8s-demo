set -euo pipefail
set -x

kubectl autoscale deployment hello-world --cpu-percent=50 --min=1 --max=10
