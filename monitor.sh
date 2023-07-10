#! /bin/bash

echo "#########################################################"

# Date:
date
# Want to see its exit code:
ls /var/run/httpd/httpd.pid &> /dev/null

# If the exit code is 0 tell us it is running. If not, start the process and tell us again if it is running:
if [ $? -eq 0 ]
then
        echo "httpd process is running."
else
        echo "httpd process is NOT running"
        echo "Starting the process..."
        systemctl start httpd

        #Nested condition:
        if [ $? -eq 0 ]
        then
                echo "Process Started successfully"
        else
                echo "Process starting failed, contact the admin."
        fi

fi
echo "#########################################################"
echo
