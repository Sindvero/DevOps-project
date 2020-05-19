#!/bin/bash

#===========================
#   Create Instances
#===========================

sudo echo -e "Creating your ec2 instances..."

aws ec2 run-instances --image-id $1 --count $2 --instance-type $3 --key-name $4 --security-group-ids $5 --subnet-id $6 --user-data file://install-env.sh
Instances[0]=$(aws ec2 describe-instances --filters Name=instance-state-name,Values=pending --query 'Reservations[*].Instances[0].{Instance:InstanceId}')

echo -e "\nWaiting for the instances to be ready...\n"
aws ec2 wait instance-running --instance-ids ${Instances[@]}
echo -e "\nYour environment has been created! :)\n"
