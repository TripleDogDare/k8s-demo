set -euo pipefail
set -x

kubectl run -i --tty --image=busybox /bin/sh
# while true; do wget -q -O- http://hello-world.default.svc.cluster.local; done
# while true; do wget -q -O- http://php-apache.default.svc.cluster.local; done
