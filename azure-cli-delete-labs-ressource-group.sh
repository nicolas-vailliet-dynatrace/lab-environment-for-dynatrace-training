#!/bin/bash
echo "Project name (example dynatracelab20191202162044) ?"
read DOMAIN_NAME
echo "How many VM ?"
read NBVM
echo "type AKS (Y|N) ?"
read AKS
if [ $AKS = "Y" ] || [ $AKS = "y" ]
then
        for ((i=0; i<$NBVM; ++i));
                do
                        USER='USER0'$i
                        VM_RESSOURCE_GROUP=$DOMAIN_NAME'0'$i
                        ACR_RESSOURCE_GROUP='acr'$DOMAIN_NAME'0'$i
                        AKS_RESSOURCE_GROUP='MC_'$ACR_RESSOURCE_GROUP'_akscluster_westeurope'
                        echo "delete ressource group "$VM_RESSOURCE_GROUP
                        az group delete --name $VM_RESSOURCE_GROUP --y
                        echo "delete ressource group "$ACR_RESSOURCE_GROUP
                        az group delete --name $ACR_RESSOURCE_GROUP --y
                        echo "delete ressource group "$AKS_RESSOURCE_GROUP
                        az group delete --name $AKS_RESSOURCE_GROUP --y
                done
else
        for ((i=0; i<$NBVM; ++i));
                do
                        USER='USER0'$i
                        VM_RESSOURCE_GROUP=$DOMAIN_NAME'_'$USER
                        echo "delete ressource group "$VM_RESSOURCE_GROUP
                        az group delete --name $VM_RESSOURCE_GROUP --y
                done
fi
