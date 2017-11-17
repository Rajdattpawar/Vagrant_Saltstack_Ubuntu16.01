#!/bin/bash

# add group wheel
# addgroup --system wheel

# Added because 12.4 beta uses adm instead of admin.
addgroup --system admin
password='USERNAME'
for user in USERNAME

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
				if [ $user = "USERNAME" ]; then
						su -c "echo 'ssh-rsa ADDYOURKEYHERE USERNAME' > /home/$user/.ssh/authorized_keys" $user
				fi						
				if [ ! -f /home/$user/.bashrc ]; then
						su -c "echo \"export PS1='\[\e[0;35m\]\u@\h:\w>\[\e[m\]'\" > /home/$user/.bashrc" $user
				fi
				su -c "chmod 600 /home/$user/.ssh/authorized_keys" $user
                
        fi
done
