#!/bin/bash


PASSWD=/etc/passwd


Menu() {
    cat << EOF


(관리 목록)
------------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
------------------------------------
EOF
}

UserVerify() {
        cat << EOF

사용자 확인)
------------------------------------
$(awk -F: '$3 >=1000 && 3 <=60000 {print $1}' "$PASSWD" | nl)
------------------------------------
EOF
}
UserAdd() {
    echo
    echo "(useradd)"
    echo -n "add name : "
    read UNAME

    useradd -r $UNAME
    [ $? -eq 0 ] \
        && echo "[ OK ] " \
        || echo "[ FAIL ]"
    echo $UNAM | passwd --stdin $UNAME > /dev/null 2>&1
}
UserDel() {
    echo
    echo "(userdel)"
    echo -n "del name : "
    read UNAME

    userdel -r $UNAME
    [ $? -eq 0 ] \
        && echo "[ OK ] " \
        || echo "[ FAIL ]"

}

while true
do
    Menu
    echo -n "choice num? (1|2|3|4) : "
    read NUM

    case $NUM in
        1) UserAdd ;;
        2) UserVerify  ;;
        3) UserDel ;;
        4) break ;;
        *) echo "[ WARN ]" bad ;;
    esac
done

