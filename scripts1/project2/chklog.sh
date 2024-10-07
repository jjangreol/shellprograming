#!/bin/bash

#Variables definition
LOGFILE=/var/log/messages              #모니터링 대상 로그 파일 이름
TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3
TIMEINTERVA=10                          #비교시간

egrep -i 'warn|fail|error|crit|alert|emerg' $LOGFILE > $TMP1

while true
do
    # 
    sleep "$TIMEINTERVA"

    egrep -i 'warn|fail|error|crit|alert|emerg' $LOGFILE > $TMP2

    diff $TMP1 $TMP2 > $TMP3 && continue

    mailx -s '[ WARN ]' root < $TMP3

    egrep -i 'warn|fail|error|crit|alert|emerg' $LOGFILE > $TMP1
done
