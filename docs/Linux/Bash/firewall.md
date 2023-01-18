# CentOS 中关于防火墙的命令

## 1、Centos 中开放端口

1.systemctl start firewalld.service（开启防火墙）

2.systemctl stop firewalld.service（关闭防火墙）

如需要开放 80 和 443 端口，如下：

```
[root@kube-master ~]# iptables -I INPUT -p tcp -m tcp -dport 80 -j ACCEPT
[root@kube-master ~]# iptables -I INPUT -p tcp -m tcp -dport 443 -j ACCEPT
[root@kube-master ~]# service iptables save
```

查看规则：

`iptables -L -n`

参考文档：[Linux iptables 防火墙的使用配置](https://www.cjavapy.com/article/2304/)

2）CentOS/RHEL 7

```
sudo firewall-cmd --zone=public --permanent --add-port=PORT/tcp
sudo firewall-cmd --reload
```

如需要开放 80 和 443 端口，如下：

```
sudo firewall-cmd --zone=public --permanent --add-port=80/tcp
sudo firewall-cmd --zone=public --permanent --add-port=443/tcp
sudo firewall-cmd --reload
```

参考文档：[Linux firewalld 防火墙的使用配置](https://www.cjavapy.com/article/2305/)

3）常用命令

查看防火墙是否开启：
`systemctl status firewalld`

查看所有开启的端口：
`firewall-cmd --list-ports`

常用命令介绍：

```
firewall-cmd --state ##查看防火墙状态，是否是 running
firewall-cmd --reload ##重新载入配置，比如添加规则之后，需要执行此命令
firewall-cmd --get-zones ##列出支持的 zone
firewall-cmd --get-services ##列出支持的服务，在列表中的服务是放行的
firewall-cmd --query-service ftp ##查看 ftp 服务是否支持，返回 yes 或者 no
firewall-cmd --add-service=ftp ##临时开放 ftp 服务
firewall-cmd --add-service=ftp --permanent ##永久开放 ftp 服务
firewall-cmd --remove-service=ftp --permanent ##永久移除 ftp 服务
firewall-cmd --add-port=80/tcp --permanent ##永久添加 80 端口
iptables -L -n ##查看规则，这个命令是和 iptables 的相同的
```
