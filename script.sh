
#!/bin/bash

tput clear
trap ctrl_c INT

function ctrl_c() {
        echo "**You pressed Ctrl+C...Exiting"
        exit 0;
}
#
echo -e "#################################################################################"
echo
echo
echo -e "\n           Welcome to audit of your linux machine by RISHIKESH MANE:           "
echo
echo
sleep 1
echo "###################### SERVER UPTIME  ##############################################"
echo
uptime | cut -d "," -f 1
echo
echo "###################### Last Server Reboot Timestamp ################################"
echo
dmesg | grep “systemd-” | head
echo
echo "###################### Server Local Time Zone [Expected IST, Highlight to NON-IST ]#"
echo
date +%Z
echo
echo "###################### server Date time and Timezone ###############################"
echo
date
echo
echo "###################### Last 10 installed packges with dates ########################"
echo
rpm -qa --last | tail -n  10
echo
echo "###################### OS version [Expected RHEL family, Highlight for different os]"
echo
cat /etc/redhat-release
echo
echo "###################### Kernel version ##############################################"
echo
hostnamectl | grep Kernel
echo
echo "###################### CPU - Virtual cores Total count #############################"
echo
nproc
echo
echo "###################### CPU - Clock speed ###########################################"
echo
cat /proc/cpuinfo | grep MHz
echo
echo "###################### CPU - Architecture ##########################################"
echo
lscpu | grep "Architecture"
echo
echo "###################### Disk - Mounted/Unmounted volumes, type, storage #############"
echo
findmnt -D
echo
echo "unmonted remaining above"
echo "###################### Public and Private address of system#########################"
echo
echo "                       Private IP                                                   "
ip route get 1.2.3.4 | awk '{print $7}'
echo
echo
echo "                       Public IP                                                    "
curl ifconfig.me
echo
echo
echo -e "\n###################### Hostname as I am using Aws ec2 instance of RHEl#########"
echo
hostname
echo
echo -e "\n###################### Networking - Bandwidth #################################"
echo
echo
echo -e "\n###################### OS Firewall (Allowed Ports & Protocols)#################"
echo
firewall-cmd --list-ports
echo
echo -e "\n###################### Network Firewall Allowed Ports #########################"
echo
echonetstat -tulpn | grep LISTEN
echo
echo -e "\n###################### Network Firewall Allowed Protocols #####################"
echo
netstat -s
echo
echo -e "\n###################### CPU - Utilization ######################################"
echo
vmstat
echo
echo -e "\n###################### RAM - Utilization ######################################"
echo
vmstat
echo
echo -e "\n###################### Storage ################################################"
echo
echo
echo -e "\n###################### Highlight when current User Password Exipring ##########"
echo
chage -l root
echo
echo

exit 0;
