#!/bin/bash

read -p "请输入新客户端名称:" name 
echo -e "\n"
#easyrsa build-client-full $name nopass
if [ -f /etc/easy-rsa/pki/private/$name.key ]
then
    echo "客户端 $name 已经存在了"
else
    echo "正在添加新客户端 $name"
    easyrsa build-client-full $name nopass
    crt="/etc/easy-rsa/pki/issued/$name.crt"
    key="/etc/easy-rsa/pki/private/$name.key"
    cp $crt /etc/openvpn/
    cp $key /etc/openvpn/
    
    if [ -f def.ovpn ]
    then
        dir="./ovpn"
        if [ ! -d $dir ];then 
          mkdir $dir
        fi
        ovpn="./ovpn/$name.ovpn"
        cp def.ovpn $ovpn
        echo "<ca>" >>$ovpn
        cat ca.crt >>$ovpn
        echo "</ca>" >>$ovpn
        echo "<cert>" >>$ovpn
        cat $crt >>$ovpn
        echo "</cert>">>$ovpn
        echo "<key>">>$ovpn
        cat $key >>$ovpn
        echo "</key>" >>$ovpn
	echo "客户端添加完成 $ovpn"
    else 
        echo "def.ovpn 文件不存在"
    fi    
fi
