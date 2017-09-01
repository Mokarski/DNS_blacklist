#iptables -A INPUT  -d 172.16.22.116 -m string --string "vkontakte" --algo kmp --to 65535 -j DROP
#iptables -A INPUT  -p udp --dport 53 -m string --string "sex" --algo bm --to 1 --icase -j DROP

#sed cut dots of the end of string
#sed 's/\(.*\)./\1 /' /etc/hosts

#sed 's/127.0.0.1/31.211.71.203/' /etc/hosts > hosts

wget http://api.antizapret.info/all.php?type=csv -O zapret.txt
cat zapret.txt | cut -f 3 -d ";" | cut -f 3 -d "/" | uniq | grep . > zapret_dns
cat zapret.txt | cut -f 2 -d ";" | cut -f 3 -d "/" | uniq | grep . >> zapret_dns

#wget hl.yoyo.org/adservers/serverlist.php?hostformat=hosts;showintro=0 hosts.txt