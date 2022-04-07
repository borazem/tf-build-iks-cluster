# build-iks-cluster

Deploy IKS cluster Workshop

The purpose of this structured, no-cost, hands-on, instructor-led learning experience is to demonstrate how to create an IKS cluster in IBM Cloud using IBM Cloud portal and via terraform automation. Specifically, the attendees will learn how to:

 Deploy a Kubernetes cluster in IBM cloud.
 Bind to default subdomain.

Additional IBM Cloud solution tutotials can be access from this link: https://cloud.ibm.com/docs/solution-tutorials?topic=solution-tutorials-scalable-webapp-kubernetes

## 1- Building IKS Cluster 

IKS cluster can be provisioned using IBM Cloud dashboard portal or using Terraform/CLIs

1.1 Using IBM Cloud dashboard

Login into IBM Cloud dashboard portal and select Navigation Menu from top left corner of dashboard
https://cloud.ibm.com
    ![plot](https://github.com/bkoohi/build-iks-cluster/blob/main/images/Screen%20Shot%202022-04-07%20at%204.50.07%20PM.png)
 
 
        Select Kubernetes 
 
                Select Clusters
                
                       Create Cluster
                       
                              Select Kubernetes for community version ( or Red Hat OpenShift )
                              
                                      Select Kubernetes version ( current latest ver 1.23.5 )
                                      
                                      Select VPC ( VPC is recommended but alternative option is non-VPC or Classic IaaS )
                                      
                                      Select Create VPC ( or VPC provided to you )
                                      
                                             In new windows, select Edit and change default region from Dallas to Toronto and then Save
                                             
                                             Geography should be now North America and Region should be Toronto
                                             
                                             Provide a name for your VPC .ie <your-initial>-lab-vpc
                                             
                                             Leave Resource Group as default
                                             
                                             Leave subnets as default
                                             
                                             click on Create to create the VPC
                                             
                                      Your VPC ( <your-initial>-lab-vpc ) should appear as your target Virtual Private Cloud 
                                      
                                      Select Default Resource Group ( or other provided Resource Group )
                                      
                                      Use default worker node zones and subnets 
                                      
                                      Use pencil edit to change worker node sizes. It can be as small as 2vCPU, 4GB RAM, 100GB storage (cx2.2x4)
                                      
                                      Number of Worker nodes per zone can be 1 or larger ( depending to your applications)
                                      
                                      Change cluster name to your <your-initial>-lab-iks
                                      
                                      Keep other values as default
                                      
                                      Select Create from right hand side to create the cluster
                                      
  Portal will show status of your clustrer and it starts by: Preparing master, workers..
                        
  
  1.2 Using terraform/CLI 
  
      
  
                          
                          
