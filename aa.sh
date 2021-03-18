systemctl restart network
nmcli connection up ens33
systemctl stop firewalld.service
setenforce 0

read -p "请输入ip地址：" ip
cat > /etc/sysconfig/network-scripts/ifcfg-ens33 <<EOF
TYPE=Ethernet
BOOTPROTO=none
DEFROUTE=yes
NAME=ens33
DEVICE=ens33
ONBOOT=yes
IPADDR=192.168.254.$ip
GATEWAY=192.168.254.2
NETMASK=255.255.255.0
DNS1=114.114.114.114
EOF

systemctl restart network

read -p "输入主机名：" name
hostnamectl set-hostname $name
