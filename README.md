# Lab environment for dynatrace training
This script permits to deploy quickly several Ubuntu VM with Docker Engine on an Azure subscription. It's usefull for a workshop. It's compatible with easytravel on docker. Usefull to deploy quickly a Dynatrace training environment.

Open your azure subscription, https://portal.azure.com/  
Open your azure cli like described here :  
![cli-azure](cli-azure.png)
  
  
**DEPLOY Ubuntu VM** : Go to your Azure Cli and apply these commands (about 3 minutes per VM):   

    cd;if [ -d "./lab-environment-for-dynatrace-training" ];then rm -rf ./lab-environment-for-dynatrace-training;fi
    git clone https://github.com/JLLormeau/lab-environment-for-dynatrace-training.git
    cd lab-environment-for-dynatrace-training;chmod +x azure-cli-deploy-vm-for-workshop.sh
    ./azure-cli-deploy-vm-for-workshop.sh
      
You can create several ubuntu VM with the size = Standard_B2s (2 CPU; 4GB RAM; 8 GB Disk; 0,04€/hour).  
Here is the example for 3 VM with the default hostnames and credentials:  
VM1 : dynatracelab2019120214002300.westeurope.cloudapp.azure.com & user = USER00 & Pwd = Dynatrace@2020  
VM2 : dynatracelab2019120214002301.westeurope.cloudapp.azure.com & user = USER01 & Pwd = Dynatrace@2020  
VM2 : dynatracelab2019120214002302.westeurope.cloudapp.azure.com & user = USER02 & Pwd = Dynatrace@2020  
  
**INSTALL Docker EASYTRAVEL LAB** : 
Prerequisite : Ubuntu VM installed
Go to the VM with putty and deploy easytravel on each VM with these commands (installation = about 2 minutes):   
   
    git clone https://github.com/JLLormeau/dynatracelab_easytraveld.git
    cd dynatracelab_easytraveld
    docker-compose up -d
    docker-compose ps

In thise example, we create 3 easytravel application :  
http://dynatracelab2019120214002300.westeurope.cloudapp.azure.com  
http://dynatracelab2019120214002301.westeurope.cloudapp.azure.com  
http://dynatracelab2019120214002302.westeurope.cloudapp.azure.com  

to restart easytravel use these commands on each VM :  
    
    cd dynatracelab_easytraveld
    docker-compose down
    docker-compose up -d
    docker-compose ps

at the end of the workshop, delete the labs resource groups (VM).  
  
  
**INSTALL KUBERNETES LAB** : 
Prerequisite : Ubuntu VM installed
Go to the VM with putty and deploy the AKS cluster fith Azure Voting App from each VM with this command - skip the warning (installation = about 20 minutes - if you lose your session, you can run the script again):
    
    sudo apt-get install git -y
    cd;if [ -d "./dynatracelab_azure-voting-app-redis" ];then rm -rf ./dynatracelab_azure-voting-app-redis;fi
    git clone https://github.com/JLLormeau/dynatracelab_azure-voting-app-redis.git
    cd dynatracelab_azure-voting-app-redis;chmod +x deploy-aks-cluster-with-azure-voting-app.sh
    ./deploy-aks-cluster-with-azure-voting-app.sh    

at the end of the workshop, delete the labs resource groups (VM, ACR et AKS).

**DELETE LABS RESOURCE GROUP** : Go to your Azure Cli and apply these commands (follow the instruction) you will only delete your labs resource groups.

    cd;cd azure-cli-deploy-vm-for-workshop;chmod +x azure-cli-delete-labs-resource-group.sh
    ./azure-cli-delete-labs-resource-group.sh
    
