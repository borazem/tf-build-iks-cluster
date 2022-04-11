
##############################################################################
# VNF Public facing subets
##############################################################################
resource "ibm_is_subnet" "lab_iks_subnets" {
  count                    = 3
  name			   ="${ibm_is_vpc.lab_vpc.name}-app-${count.index + 1}"
  vpc                      = ibm_is_vpc.lab_vpc.id
  zone                     = "${var.region}-${count.index + 1}"
  resource_group           = data.ibm_resource_group.group.id
  total_ipv4_address_count = "256"
}

resource "ibm_is_public_gateway" "lab_iks_subnet_pgw" {
  depends_on = [ibm_is_vpc.lab_vpc]
  count                    = 3
  name                     = "${ibm_is_vpc.lab_vpc.name}-pwg-${count.index + 1}"
  vpc                      = ibm_is_vpc.lab_vpc.id
  zone                     = "${var.region}-${count.index + 1}"

  //User can configure timeouts
  timeouts {
    create = "90m"
  }
}
output "subnets" {
  value = ibm_is_subnet.lab_iks_subnets
}
#lab-vpc-lab-pub-subnet-1
resource "ibm_is_subnet_public_gateway_attachment" "lab_iks_subnet_pgw_attach1" {
  depends_on = [ibm_is_vpc.lab_vpc]
  count                    = 3
  subnet 		   = ibm_is_subnet.lab_iks_subnets[count.index].id 
  public_gateway	   = ibm_is_public_gateway.lab_iks_subnet_pgw[count.index].id

#  //User can configure timeouts
  timeouts {
    create = "90m"
  }
}
