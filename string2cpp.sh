#!/bin/bash

# 이 스크립트는 "string" 을 #define PREFIX_STRING "string" 형태로 변환하는 역할을 수행
# 참고 : grep -Po '"[^"]+"' uhdp_config_temp.json 이렇게 하면 "" 사이의 문자열을 추출 할 수 있음
#        설명 : [^ ] 대괄호 안에서 ^ 뒤에 있는 문자들을 제외, + 앞 문자가 1회 이상 매치
# grep -Po '"[^"]+"' uhdp_config_temp.json | sort | uniq > string_table.txt

#1. 이중 따옴표를 제거
#    sed 's/ /_/g'
#2. 특수문자를 언더바로 변경
#    sed 's/\( \|[[:punct:]]\)/_/g'
#3. 전체 대문자로 변경
#    sed 's/\(.*\)/\U\1/'
#4. 문자열 앞에 내용 추가
#    sed 's/\(.*\)/#define STR_&/'
#5. 컬럼 합치기
#    paste -d ' ' - text.txt

PREFIX=STR_

cat $1 | sed -e 's/"//g' -e 's/\( \|[[:punct:]]\)/_/g' -e 's/\(.*\)/\U\1/' -e "s/\(.*\)/#define $PREFIX&/" | paste -d ' ' - $1 | sort
