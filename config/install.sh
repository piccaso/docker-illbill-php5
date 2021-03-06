sed s/precise/karmic/g /etc/apt/sources.list > /etc/apt/sources.list.d/karmic.list
sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list.d/karmic.list
mkdir -p /etc/apt/preferences.d/
for PACKAGE in $PKGS
do
  echo "Package: $PACKAGE
  Pin: release a=karmic
  Pin-Priority: 991
  " | tee -a /etc/apt/preferences.d/php
done
apt-get update
apt-get install -y libapache2-mod-php5=5.2.10.dfsg.1-2ubuntu6.10 php5-cli=5.2.10.dfsg.1-2ubuntu6.10 php5-common=5.2.10.dfsg.1-2ubuntu6.10 php5-curl=5.2.10.dfsg.1-2ubuntu6.10 php5-dev=5.2.10.dfsg.1-2ubuntu6.10 php5-gd=5.2.10.dfsg.1-2ubuntu6.10 php5-mysql=5.2.10.dfsg.1-2ubuntu6.10 php5-sqlite=5.2.10.dfsg.1-2ubuntu6.10 libxrender1 libxext6
apt-get install -y libc6-i386 libxrender1:i386 libfontconfig1:i386 libxext6:i386 libstdc++6:i386

apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
