#input 1=version or else the latest one also the template 2=file
#check the OS of the matchine
#call the functions for perticular OS with arg version and file
###funtion for ubuntu
#check for version input
#if no install the latest version from apt
#if yes install the specific version
#check for config file if yes replace else exit
###function for redhat
###function for centos
!/bin/bash
version=$1
file=$2
OS=$(cat /etc/os-release | head -1 | awk -F '"' '{print$2}')
install_wireguard_ubuntu() {
version=$1
echo "update the system"
#       sudo apt-get update
if [ -z $version ]
then
#       sudo apt-get install wireguard -y
        echo "wireguard installed sucessfully"
        echo "by method of apt get"
else
#	sudo apt-get install  -y build-essential
#	sudo apt-get install make
#	sudo apt-get install -y libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev
        installing_from_source $version
fi
}
install_wireguard_Red_hat() {
version=$1
#       sudo yum update
echo "updating the instance"
if [ -z $version ]
then
#	sudo yum install epel-release -y
#       sudo yum install wireguard -y
#	service wireguard start
        echo "wireguard installed sucessfully"
        echo "by redhat yum method"
else
#	yum groupinstall "Development Tools"
#	yum install pcre pcre-devel zlib zlib-devel openssl openssl-devel
        installing_from_source $version
fi
}
install_wireguard_centOS() {
version=$1
#	sudo yum update
if [ -z $version ]
then
#	sudo yum install epel-release -y
#       sudo yum install wireguard -y
#	service wireguard start
        echo "wireguard installed sucessfully by yum in centos"
else
#        yum groupinstall "Development Tools"
#        yum install pcre pcre-devel zlib zlib-devel openssl openssl-devel
        installing_from_source $version
fi
}
installing_from_source () {
$version=$1

echo "installed from wget method"
echo "for the version $version"
}
if [ $OS == "Ubuntu" ]
then
echo "function to install wireguard for the os:$OS"
install_wireguard_ubuntu $version $file
elif [ $OS == "Red Hat" ]
then
install_nginx_Red_hat $version $file
elif [ $OS == "CentOS" ]
then
install_nginx_centOS $version $file
else
echo "this script does't support your OS"
fi
if [ -z $file ]
then
        echo "default config file"
else
#       cp $file /etc/nginx/nginx.conf
echo "conf file is updated"
fi