#!/bin/bash

cd /root/
apt update
yes|apt install ruby ruby-dev libcurl4-openssl-dev libldns-dev vim xdg-utils iceweasel screen aptitude make zlib1g-dev git gcc g++ make libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev libpcap-dev iftop nano wget curl zlib* openssl libssl-dev libsqlite3-dev build-essential libssl-dev libcurl4-openssl-dev libffi-dev python-dev parallel tmux aria2
echo 'set -g prefix C-a'>>/root/.tmux.conf ; echo 'unbind C-b'>>/root/.tmux.conf
wget https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz
tar xzvf ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-11.0.2-x86_64-unknown-linux-musl/rg  /usr/local/bin/
rm ripgrep-11.0.2-x86_64-unknown-linux-musl.tar.gz

yes|apt install ruby
yes|apt install ruby-dev
var=$(ruby -v|grep -oP ".\..\..")
cd /etc/alternatives
ln -sf /usr/bin/ruby$var ruby

# cd /root
# var=$(curl -L golang.org/dl/|grep -oP "(?<=\<a\ class\=\"download\ downloadBox\"\ href\=\").*?(?=linux\-amd64\.tar\.gz\"\>)") ; last=linux-amd64.tar.gz ; var=$var$last ; wget $var
# load=${var//https\:\/\/dl\.google\.com\/go\//} ; tar -xzf $load -C /usr/local ; rm $load
# echo 'export EDITOR=nano'>>/root/.profile
# echo 'export GOROOT=/usr/local/go'>>/root/.profile
# mkdir /root/GOPATH
# echo 'export GOPATH=/root/GOPATH'>>/root/.profile
# echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'>>/root/.profile
# source /root/.profile

# wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
# tar zxvf Python-3.6.9.tgz && rm -rf Python-3.6.9.tgz
# cd Python-3.6.9
# ./configure --enable-loadable-sqlite-extensions ; make ;  make install
# apt install -q -y python3-pip
# rm -rf /usr/bin/python3
# rm -rf /usr/bin/pip3
# ln -s /usr/local/bin/python3.6 /usr/bin/python3
# ln -s /usr/local/bin/pip3.6 /usr/bin/pip3

# yes|apt install python-pip
# rm /usr/bin/lsb_release
# python3 -m pip install --upgrade pip
# python -m pip install --upgrade pip
#wget https://bootstrap.pypa.io/get-pip.py
#python get-pip.py
#rm -r get-pip.py

cd /root/
#git clone https://github.com/RebootEx/xunfeng ; sh xunfeng/xunfeng.sh ; rm -r /root/xunfeng


mkdir /root/script

#cd /root/
#python3 -m pip install --upgrade urlwatch
#urlwatch
#git clone https://github.com/RebootEx/txt
#cd txt
#> /root/.config/urlwatch/urlwatch.yaml
#cat 1.txt >/root/.config/urlwatch/urlwatch.yaml
#cd /root/ ; rm -r /root/txt
#echo '1' > /root/.config/urlwatch/urls.yaml
#> /root/.config/urlwatch/urls.yaml

mkdir /root/script/git
cd /root/script/git
git clone https://github.com/RebootEx/github_dis
pip install truffleHog

mkdir /root/script/0_subdomain
cd /root/
go get github.com/subfinder/subfinder
pip install py-altdns
cd /root/script/0_subdomain
git clone https://github.com/infosec-au/altdns
cd altdns/
python setup.py install
cd /root/script/0_subdomain
git clone https://github.com/nsonaniya2010/SubDomainizer.git
cd SubDomainizer
python3 -m pip install -r requirements.txt
cd /root/script/0_subdomain
git clone https://github.com/blechschmidt/massdns
cd massdns ; make ; make install
cd /root/script/0_subdomain/massdns/scripts ; bash get-resolvers.sh

pip3 install awscli --upgrade --user
mkdir /root/script/1_aws
cd /root/script/1_aws
git clone https://github.com/RebootEx/AWSBucketDump && cd AWSBucketDump && python3 -m pip install -r requirements.txt
cd /root/script/1_aws
git clone https://github.com/initstring/cloud_enum ; cd cloud_enum && python3 -m pip install -r requirements.txt

mkdir /root/script/2_subjack
cd /root/script/2_subjack
cd /root/
go get github.com/haccer/subjack
go get -u github.com/rverton/webanalyze/...

mkdir /root/script/3_httprobe
cd /root/script/3_httprobe
cd /root/
go get -u github.com/tomnomnom/httprobe
cd /root/script/3_httprobe
git clone https://github.com/verovaleros/webcrawler ; mv webcrawler/crawler.py crawler.py ; rm -r webcrawler
cd /root/script/3_httprobe
git clone https://github.com/s0md3v/Arjun
cd /root/script/3_httprobe
git clone https://github.com/RebootEx/XSStrike ; cd /root/script/3_httprobe/XSStrike ; pip3 install -r requirements.txt
cd /root/script/3_httprobe
#git clone https://github.com/Threezh1/JSFinder
git clone https://github.com/GerbenJavado/LinkFinder ; cd LinkFinder ; pip3 install -r requirements.txt ; python3 setup.py install
cd /root/script/3_httprobe
git clone https://github.com/anouarbensaad/vulnx.git
cd vulnx
sed "s,sudo ,,g" install.sh > 1.sh ; mv 1.sh install.sh
bash install.sh

cd /root/
go get github.com/tomnomnom/waybackurls

mkdir /root/script/4_getjs
cd /root/script/4_getjs
git clone https://github.com/FortyNorthSecurity/EyeWitness
cd EyeWitness/setup ; bash setup.sh ; bash setup.sh ; pip3 install --upgrade pyasn1-modules
cd /root/
go get github.com/003random/getJS
pip install vl


mkdir /root/script/5_dir
cd /root/script/5_dir
git clone https://github.com/maurosoria/dirsearch
echo "home/template/wxserver.asmx" >> /root/script/5_dir/dirsearch/db/dicc.txt

mkdir /root/script/6_port
cd /root/script/6_port
git clone https://github.com/gm09519/host2ip
cd host2ip
sed "s,ip=\"N\/A\",continue,g" host2ip.py host2ip.py > 1.py ; mv 1.py host2ip.py
cd /root/
yes|apt install nmap
cd /root/script/6_port
git clone https://github.com/lanpan999/Check_Unauth
cd Check_Unauth
python3 -m pip install -r requirements.txt
python3 -m pip install pymongo
cd /root/script/6_port
git clone https://github.com/RebootEx/masscan_to_nmap-1
cd masscan_to_nmap-1
pip install prettytable
pip install -r requirements.txt
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make -j


echo "Done ...:)"

# cd /root
# mkdir /root/sh
# rm -r /root/sh
# git clone https://github.com/RebootEx/sh ; chmod 777 sh/*

# screen -dmS $"ex_db"
# cmd=$"bash /root/sh/exploit.sh"
# screen -x -S ex_db -X stuff "$cmd"
# screen -x -S ex_db -X stuff $'\n'

# bash sh/one.sh
# cd /root ; rm -r sh


# while true
# do
# cd /root
# mkdir /root/sh
# rm -r /root/sh
# git clone https://github.com/RebootEx/sh ; chmod 777 sh/*
# bash sh/one.sh
# cd /root ; rm -r sh
# done
