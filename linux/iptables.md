service iptables start
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT


iptables -A INPUT -f -m limit --limit 100/s --limit-burst 100 -j ACCEPT