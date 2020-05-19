#!/bin/bash

echo "Destroying your environment..."
aws ec2 terminate-instances --instance-ids $(aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId}')

echo "Your environment has been destroy!"
