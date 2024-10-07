#!/bin/bash
# makescripts.sh tools.sh
# -> /root/scripts/tools.sh
#    #!/bin/bash
# -> chmod 700 /root/scripts/tools.sh


if [ $# -ne 1 ]; then
    echo "Usage: $0 <scriptfile>"
    exit 1
fi
SCRIPTFILE=$1
scripts=/root/shell

cat <<EOF > /root/shell/$SCRIPTFILE
#!/bin/bash

EOF
chmod 700 $scripts/$SCRIPTFILE