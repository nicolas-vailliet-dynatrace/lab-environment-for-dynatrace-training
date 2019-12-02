#!/bin/bash
read DOMAIN
read NBVM
read AKS
if [ $AKS = "Y" ] || [ $AKS = "y" ]
then
	for ((i=0; i<$NBVM; ++i));
		do
			USER='USER0'$i
			VM_RESSOURCE_GROUP=$DOMAIN_NAME'_'$USER
			ACR_RESSOURCE_GROUP='acr'$DOMAIN_NAME'0'$i
			AKS_RESSOURCE_GROUP='MC_'$ACR_RESSOURCE_GROUP'_akscluster_westeurope'
			az group delete --name $VM_RESSOURCE_GROUP
			az group delete --name $ACR_RESSOURCE_GROUP
			az group delete --name $AKS_RESSOURCE_GROUP
		done
else
	for ((i=0; i<$NBVM; ++i));
		do
			USER='USER0'$i
			VM_RESSOURCE_GROUP=$DOMAIN_NAME'_'$USER
			az group delete --name $VM_RESSOURCE_GROUP
		done
fi	
