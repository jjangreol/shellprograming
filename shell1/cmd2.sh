#!/bin/bash

if [ $# -eq 0]; then
    echo "Usage: $0 <CND OPTIONS ARGS>"
fi
CMD="$*"

SERVERLIST=/root/shell/server.txt

cat << EOF > $SERVERLIST
172.16.6.250
172.16.6.204
172.16.6.220
EOF

for i in $(cat $SERVERLIST)
do
    echo "--------$i----------"
    ssh "$i" "$CMD"
done

