alias k='rlwrap $SERVER_BIN/k/linux64/k'
alias kps='ps -eo pid,args | grep adb | grep -v -e grep -e rlwrap | awk '\''{print $1" "$4" "$7}'\'' | sort -k2,3 | column -t'
