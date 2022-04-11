# Deploy an IKS cluster in VPC

Following the instructions and executing the scripts, you will provision

- VPC
- Private Subnets - one in each zone (zone 1, 2 and 3)
- Public gateway per subnet
- IKS cluster

![](images/vpc-autoscale.png)

### Pre-requisites:

- IBM Cloud IAM API key - refer [IAM documentation](https://cloud.ibm.com/docs/iam?topic=iam-manapikey)
- SSH key - refer [VPC SSH documentation](https://cloud.ibm.com/docs/vpc?topic=vpc-ssh-keys)
- If you want to enable **SSH offloading (termination)** or **End-to-end encryption**, you need to create a Certificate manager service, order a certificate and pass that to load balancer HTTPS listener, Follow the [instructions here](https://cloud.ibm.com/docs/certificate-manager?topic=certificate-manager-ordering-certificates) to learn the certificate ordering process.

### Getting started:

1- Clone this githup repository in your local system:
```
git clone git@github.com:bkoohi/build-iks-cluster.git
```
```
cd build-iks-cluster
```

2. Update the values in `tvariables.tf` file based on your requirement and save the file. Minimum requirements are:
"ibmcloud_api_key"
"ssh_keyname"

3. Initialize the Terraform providers. Run:
   ```
   terraform init
   ```
4. Execute terraform plan :
   ```
   terraform plan
   ```
5. Apply terraform plan:
   ```
   terraform apply -auto-approve
   ```


### Clean-up

```
terraform destroy  -auto-approve
```
