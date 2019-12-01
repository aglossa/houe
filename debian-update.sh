!/bin/bash
# File brought by github.com/aglossa/houe

pause(){
 read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
}

apt-get update
pause
apt-get dist-upgrade
pause

if ! [ -x "$(command -v checkrestart)" ]; then
  apt-get install debian-goodies
fi

echo sudo checkrestart
checkrestart