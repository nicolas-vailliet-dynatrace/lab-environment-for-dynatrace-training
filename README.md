# azure-cli-deploy-vm-for-workshop
This script permits to deploy quickly several Ubuntu VM with Docker Engine on an Azure subscription. It's very usefull for a workshop. It's compatible with easytravel on docker. Usefull to deploy quickly a Dynatrace training environment.

Open your azure subscription, https://portal.azure.com/  
Open your azure cli like described here :  
![azurecli](azurecli.png)
  
  
**DEPLOY Ubuntu VM** : Go to your Azure Cli and apply these commands:   

    cd;if [ -d "./azure-cli-deploy-vm-for-workshop" ];then rm -rf ./azure-cli-deploy-vm-for-workshop;fi
    git clone https://github.com/JLLormeau/azure-cli-deploy-vm-for-workshop.git
    cd azure-cli-deploy-vm-for-workshop;chmod +x azure-cli-deploy-vm-for-workshop.sh
    ./azure-cli-deploy-vm-for-workshop.sh
      
You can create several ubuntu VM with the size = Standard_F1 (1 CPU; 2GB RAM; 16 GB Disk; 0,0420€/hour).  
Here is the example for 2 VM with the default hostnames and credentials:  
VM1 : dynatracelab2019120214002300.westeurope.cloudapp.azure.com & user = USER00 & Pwd = Dynatrace@2019  
VM2 : dynatracelab2019120214002301.westeurope.cloudapp.azure.com & user = USER01 & Pwd = Dynatrace@2019  
  
**INSTALL EASYTRAVEL LAB** : Go to the VM with putty and deploy easytravel on each VM with these commands:   
   
    sudo apt-get install git -y
    git clone https://github.com/JLLormeau/dynatracelab_easytraveld.git
    cd dynatracelab_easytraveld
    sudo docker-compose up -d

In thise example, we create 2 easytravel application :  
http://dynatracelab2019120214002300.westeurope.cloudapp.azure.com  
http://dynatracelab2019120214002301.westeurope.cloudapp.azure.com  

to restart easytravel use these commands on each VM :  
    
    cd dynatracelab_easytraveld
    docker-compose down
    sudo docker-compose up -d

at the end of the workshop, open your azure portal and delete the ressource groups.  
  
  
**INSTALL KUBERNETES LAB** : Go to the VM with putty and deploy the AKS cluster fith Azure Voting App from each VM with this command:
    
    sudo apt-get install git -y
    cd;if [ -d "./dynatracelab_azure-voting-app-redis" ];then rm -rf ./dynatracelab_azure-voting-app-redis;fi
    git clone https://github.com/JLLormeau/dynatracelab_azure-voting-app-redis.git
    cd dynatracelab_azure-voting-app-redis;chmod +x deploy-aks-cluster-with-azure-voting-app.sh
    ./deploy-aks-cluster-with-azure-voting-app.sh    

at the end of the workshop, open your azure portal and delete the ressource groups for the VM, for the ACR and for the AKS.  

