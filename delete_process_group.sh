#!/bin/bash
read DOMAIN
read NBVM
read AKS
echo "continue (Y/N)"
read Response
if [ $Response = "N" ] || [ $Response = "n" ]
then
	exit
fi

for ((i=0; i<$NBVM; ++i));
	do
		USER='USER0'$i
		VM_RESSOURCE_GROUP=$DOMAIN_NAME'_'$USER
		ACR_RESSOURCE_GROUP='acr'$DOMAIN_NAME'0'$i
		AKS_RESSOURCE_GROUP='MC_'$ACR_RESSOURCE_GROUP'_akscluster_westeurope'
		echo 'delere  : ' $DOMAIN'.'$LOCATION'.cloudapp.azure.com'
		az group delete --name $VM_RESSOURCE_GROUP
		az group delete --name $ACR_RESSOURCE_GROUP
		az group delete --name $AKS_RESSOURCE_GROUP
	done
fi
