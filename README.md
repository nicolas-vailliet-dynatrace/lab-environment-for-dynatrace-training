# azure-cli-deploy-vm-for-workshop
This script permits to deploy quickly several Ubuntu VM with Docker Engine on an Azure subscription.
It's very usefull for a workshop. It's compatible with easytravel on docker. Usefull to deploy quickly a Dynatrace training environment.

Open your azure subscription, https://portal.azure.com/  
Open cli like describe here :
![azurecli](azurecli.png)

and use this command :  
**git clone https://github.com/JLLormeau/azure-cli-deploy-vm-for-workshop.git  
cd azure-cli-deploy-vm-for-workshop  
chmod +x azure-cli-deploy-vm-for-workshop.sh  
./azure-cli-deploy-vm-for-workshop.sh**

to deploy easytravel on each VM  
go to putty  

and apply these commands  
**sudo apt-get install git  
git clone https://github.com/JLLormeau/dynatracelab_easytraveld.git  
cd dynatracelab_easytraveld  
sudo docker-compose up -d**  

test easytravel with http://"<hostname>".westeurope.cloudapp.azure.com

to reatsrt easytravel use these commands  
**cd dynatracelab_easytraveld  
docker-compose down  
sudo docker-compose up -d**  

