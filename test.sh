#!/bin/bash
echo "Login into GCP with CLI help"
sudo gcloud auth login --no-launch-browser
echo "Enter the name of project"
read b
sudo gcloud config set project $b
echo "Enter your service-account"
read a
sudo gcloud iam service-accounts keys create terraform.json --iam-account=$a

sudo terraform init
sleep 1
sudo terraform plan
sleep 1
sudo terraform apply
sleep 20
echo "Please enter IP-Address of instance"
read ip
if [[ `ping -c 1 $ip | grep bytes | wc -l` -gt 1  ]] 
then
   echo "IP-Address of instance is available"
   echo "Destroying instance and network"
   sleep 2
   terraform destroy
else
   echo "Instance not created yet"
fi
