#!/bin/bash
#set variables 
#NBVM = nb de VM
#DOMAIN_NAME = must be unique only [a-z] lower case
TIME=`date +%Y%m%d%H%M%S`
DOMAIN_NAME_DEFAULT='dttraining'$TIME
PASSWORD='Dynatrace@2019'
LOCATION='westeurope'
SIZE='Standard_F1'

echo "Create several Ubuntu VM with Docker Engine on Azure - from JLL version 1.0"
echo "How many VM ? 1, 2 ... 8 ?"
read NBVM
echo "What is the name of the domain ? must be unique and only [a-z0-9] lower case - default : $DOMAIN_NAME_DEFAULT " 
read DOMAIN_NAME
if [[ -z $DOMAIN_NAME ]]
then
	DOMAIN_NAME=$DOMAIN_NAME_DEFAULT
fi
for ((i=0; i<$NBVM; ++i));
do
	echo 'hostname : '$DOMAIN_NAME'0'$i'.'$LOCATION'.cloudapp.azure.com with usr = USER0'$i' & Pwd = '$PASSWORD' & Size = '$SIZE''
done
echo ""
echo "Continue (Y/N)"
read Response
if [ $Response = "Y" ] || [ $Response = "y" ]
then
	#create VM
	for ((i=0; i<$NBVM; ++i));
	do
		USER='USER0'$i
		RESSOURCE_GROUP=$DOMAIN_NAME'_'$USER
		DOMAIN=$DOMAIN_NAME'0'$i
		echo 'create ressource group : '  $RESSOURCE_GROUP
		az group create \
			--name $RESSOURCE_GROUP \
			--location $LOCATION \
			--tags $DOMAIN
		echo 'create vm : ' $DOMAIN'.'$LOCATION'.cloudapp.azure.com'
		az group deployment create \
			--resource-group $RESSOURCE_GROUP \
			--template-uri https://raw.githubusercontent.com/JLLormeau/azure-cli-deploy-vm-for-workshop/master/azuredeploy.json \
			--parameters  adminUsername="$USER" adminPasswordOrKey="$PASSWORD" authenticationType="password" dnsNameForPublicIP="$DOMAIN" vmSize="$SIZE";
	done
fi
