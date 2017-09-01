#Section1 dns dump base black-filter
pdnsd-ctl dump > /etc/blacklist/dns_dump
cat /etc/blacklist/dns_dump | cut -f 2 -d " " > /etc/blacklist/url_list
#cat url_list | grep -o 'http://ex[a-zA-Z.-]*/[a-zA-Z.-]*/[a-zA-Z.,-]*'
#cat url_list | grep -o 'ex[a-zA-Z.-]*/[a-zA-Z.-]*/[a-zA-Z.,-]*'
#cat url_list | cut -f 2 -d "." -s
# anti 18+ EROS section
cat url_list | grep sex >> black_dns
cat url_list | grep porn >> black_dns
cat url_list | grep xxx >> black_dns
cat url_list | grep condom >> black_dns
cat url_list | grep adult >> black_dns
cat url_list | grep girl >> black_dns
cat url_list | grep babe >> black_dns
cat url_list | grep erot >> black_dns
cat url_list | grep erox >> black_dns
cat url_list | grep eros >> black_dns
cat url_list | grep nudist >> black_dns
cat url_list | grep prostit >> black_dns
cat url_list | grep swallow >> black_dns
cat url_list | grep throat >> black_dns
cat url_list | grep runetki >> black_dns
cat url_list | grep bonga >> black_dns
cat url_list | grep chat >> black_dns
cat url_list | grep cams >> black_dns
cat url_list | grep cum >> black_dns
cat url_list | grep cunt >> black_dns
cat url_list | grep slut >> black_dns
cat url_list | grep dildo >> black_dns
cat url_list | grep elda >> black_dns
cat url_list | grep pron >> black_dns
cat url_list | grep pizda >> black_dns
cat url_list | grep eblan >> black_dns
cat url_list | grep orgasm >> black_dns
cat url_list | grep orgazm >> black_dns
cat url_list | grep trah >> black_dns
cat url_list | grep kiss >> black_dns
cat url_list | grep porevo >> black_dns
cat url_list | grep porka >> black_dns
cat url_list | grep perdos >> black_dns
cat url_list | grep perdak >> black_dns
cat url_list | grep xpic >> black_dns
cat url_list | grep siski >> black_dns
cat url_list | grep sozrela >> black_dns
cat url_list | grep popki >> black_dns
cat url_list | grep devok >> black_dns
cat url_list | grep otsos >> black_dns
cat url_list | grep runetki >> black_dns
cat url_list | grep kaif >> black_dns
cat url_list | grep fuck >> black_dns
cat url_list | grep webcams >> black_dns
cat url_list | grep webcam >> black_dns
# anti virus WAREZ section
cat url_list | grep warez >> black_dns
cat url_list | grep crack >> black_dns
cat url_list | grep soft >> black_dns
cat url_list | grep torrent >> black_dns
cat url_list | grep tracker >> black_dns
cat url_list | grep files >> black_dns
cat url_list | grep upload >> black_dns
cat url_list | grep download >> black_dns
# block banners and advertision
cat url_list | grep banner >> black_dns
cat url_list | grep clic >> black_dns
cat url_list | grep adver >> black_dns
cat url_list | grep reklama >> black_dns
cat url_list | grep klik >> black_dns
# block casino
cat url_list | grep vulkan >> black_dns
cat url_list | grep slot >> black_dns
cat url_list | grep 24open >> black_dns
cat url_list | grep admiral >> black_dns
cat url_list | grep fortuna >> black_dns
cat url_list | grep pari >> black_dns
cat url_list | grep casino >> black_dns
cat url_list | grep kazino >> black_dns
cat url_list | grep rulet >> black_dns
cat url_list | grep play >> black_dns
cat url_list | grep loto >> black_dns
cat url_list | grep fishka >> black_dns
cat url_list | grep poker >> black_dns
cat url_list | grep kvest >> black_dns

#cat url_list | grep game >> black_dns
#cat url_list | grep video >> black_dns
#cat url_list | grep music >> black_dns
#cat url_list | grep narko >> black_dns
#cat url_list | grep extremism >> black_dns

#Section2 loading url blacklist database
#sed cut dots of the end of string
sed 's/\(.*\)./\1 /' black_dns |sed 's/^/ 31.211.71.203 /' > host_black

wget http://api.antizapret.info/all.php?type=csv -O zapret.txt
cat zapret.txt | cut -f 3 -d ";" | cut -f 3 -d "/" | uniq | grep . > zapret_dns
cat zapret.txt | cut -f 2 -d ";" | cut -f 3 -d "/" | uniq | grep . >> zapret_dns


wget http://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts -O hosts.txt

#adding 127.0.0.1 in string
#sed 's/^/ 127.0.0.1 /'  hosts.txt
sed 's/127.0.0.1/31.211.71.203/' hosts.txt > host_black

sed 's/^/ 31.211.71.203 /' zapret_dns > host_black

echo '127.0.0.1 localhost.localdomain localhost
# Auto-generated hostname. Please do not remove this comment.
172.16.22.116 mydns.opendg.ru  mydns
::1 localhost.localdomain localhost
#31.211.71.203 ya.ru
# Ad server list for use with hosts files to block ads
#
# For more information about this list, see: https://pgl.yoyo.org/adservers/
# ----
# last updated:   Tue, 29 Nov 2016 16:12:16 GMT
# entries:        2364
# format:         hosts (hosts -- in hosts file format)
# credits:        Peter Lowe - pgl@yoyo.org - https://pgl.yoyo.org/ - https://twitter.com/pgl
# this URL:       http://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts
# other formats:  https://pgl.yoyo.org/adservers/formats.php
# policy:         https://pgl.yoyo.org/adservers/policy.php
#
# start date:    Tue, 29 Nov 2016 00:00:00
'> /etc/hosts
cat host_black | sort -u >> /etc/hosts
service pdnsd restart
