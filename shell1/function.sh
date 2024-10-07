
PkgInstall() {
    PKGLIST="$*"
    yum -q -y install $PKGLIST
    [ $? -eq 0 ] \
        && echo "[ OK ] "\
            || echo "[ FAIL ]"
} 

RandomIndex() {
    INDEXFILE="$1"
    MESSAGES="$2"
    FILE1=/root/shell/boxlist
    MAX=$(wc -l < $FILE1) #MAX=72

    RANDNUM=$((RANDOM% $MAX+1))
    echo $RANDNUM

    BOXSTR=$(sed -n "${RANDNUM}p" "$FILE1")
    cat << EOF > $INDEXFILE
<pre>
$(echo "$MESSAGES" | boxes -d "$BOXSTR")
</pre>
EOF
}

ServiceStart() {
    SVC="$1"
    systemctl restart "$SVC" > /dev/null 2>&1
    RET=$( systemctl is-active "$SVC" )
    if [ "$RET" = 'active' ]; then
        echo "[ OK ]"
        systemctl enable "$SVC" > /dev/null 2>&1
    else 
        echo "[ FAIL ]" 
    fi 
}

FWRule() {
    RULES="$*"       # http https
    FWCMD='firewall-cmd --permanent'
    for i in $RULES
    do 
        FWCMD="$FWCMD --add-service=${i}"
    done
    $FWCMD
    firewall-cmd --reload > /dev/null 2>&1    
    echo "[ OK ]"
}


function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}