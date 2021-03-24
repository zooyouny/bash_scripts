# bash_scripts
my bash script collection

## string2cpp.sh

실행 예
<pre>
"setting"
"global"
"setup"
"av input"
"transmission bitrate"
</pre>

<pre>
#define STR_SETTING "setting"
#define STR_GLOBAL "global"
#define STR_SETUP "setup"
#define STR_AV_INPUT "av input"
#define STR_TRANSMISSION_BITRATE "transmission bitrate"
</pre>

참고 : json 에서 "" 안에 문자열을 따로 모으려면 다음 커맨드 사용

<pre>
grep -Po '".*?"' hfr_config_temp.json
</pre>

중복 제거하려면 다음과 같이

<pre>
grep -Po '".*?"' hfr_config_temp.json | sort -u
</pre>

