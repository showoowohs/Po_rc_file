has_path() { eval "case :\$${2-PATH}: in *:$1:*) return 0;; *) return 1;; esac"; }
no_path() { eval "case :\$${2-PATH}: in *:$1:*) return 1;; *) return 0;; esac"; }
add_path () { [ -d ${1:-.} ] && no_path $* && eval ${2:-PATH}="\$${2:-PATH}:$1"; }
pre_path () { [ -d ${1:-.} ] && no_path $* && eval ${2:-PATH}="$1:\$${2:-PATH}"; }
del_path () { no_path $* || eval ${2:-PATH}=`eval echo :'$'${2:-PATH}: | sed -e "s;:$1:;:;g" -e "s;^:;;" -e "s;:\$;;"`; }
alias git-tree='git log --graph --all --oneline --decorate'
alias wget='axel -a -n6'
uusb() {
  cd
  DEVs="`dmesg | grep "sd.: sd" | tail -n 1 | sed -e 's/.*sd.: //g' | sed -e 's/ <.*//g'`"
  C=1
  for i in $DEVs; do
    sudo umount $HOME/usb$C && rmdir  $HOME/usb$C
    C=$(( C + 1 ))
  done
}
musb() {
  DEVs="`dmesg | grep "sd.: sd" | tail -n 1 | sed -e 's/.*sd.: //g' | sed -e 's/ <.*//g'`"
  C=1
  for i in $DEVs; do
    DEV="/dev/$i"
    mkdir -p $HOME/usb$C
    echo mount $DEV $HOME/usb$C ...
    sudo mount $DEV $HOME/usb$C
    C=$(( C + 1 ))
  done
}
lusb() {
  USB="`dmesg | grep "sd.: sd" | tail -n 1 | sed -e 's/.*sd.: //g'`"
  echo $USB
}
