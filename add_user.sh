#!/bin/bash

# add group wheel
# addgroup --system wheel

# Added because 12.4 beta uses adm instead of admin.
addgroup --system admin
password='rpawar01'
for user in rpawar01

do
        output=`id $user > /dev/null 2>&1`
        if [ 1 -eq $? ]; then
				echo "Creating user: $user"
				useradd -G admin -s /bin/bash -d /home/$user $user
				(echo "$password"; echo "$password") | passwd $user
				mkdir /home/$user
				chown $user:users /home/$user
				su -c "mkdir --mode=700 /home/$user/.ssh" $user
				chage -M 90 $user
				chage -I -1 $user
				if [ $user = "rpawar01" ]; then
						su -c "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAk87yx6dmwFDN4gw0rg76tGaEiQECu1wk5TjPa4OC11TziIZI0gF24rpUSKUq7A+sgj09gwGEyEzRYnH1s+aqyabR4Yfb563hCMX4XnsRMqAqUOH0PEoLjbv52xybeuZwr45Rm9hWO34XgdwN4li3SBT9tvXk7kHHYiVJ93kziUc= rpawar01' > /home/$user/.ssh/authorized_keys" $user
				fi						
				if [ ! -f /home/$user/.bashrc ]; then
						su -c "echo \"export PS1='\[\e[0;35m\]\u@\h:\w>\[\e[m\]'\" > /home/$user/.bashrc" $user
				fi
				su -c "chmod 600 /home/$user/.ssh/authorized_keys" $user
                
        fi
done
