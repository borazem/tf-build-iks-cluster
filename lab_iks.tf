
##############################################################################
# Create IKS cluster
##############################################################################
resource "ibm_container_vpc_cluster" "lab_iks_vpc" {
  depends_on = [ibm_is_vpc.lab_vpc]
  name              = var.lab_cluster_name
  vpc_id            = ibm_is_vpc.lab_vpc.id
  resource_group_id = data.ibm_resource_group.group.id
  flavor            = var.machine_type
  worker_count      = var.workers_per_zone //adds "x" amount of workers for each zone provisioned dynamically
  kube_version      = var.kube_version != "" ? var.kube_version : null
  wait_till         = "OneWorkerNodeReady"
  disable_public_service_endpoint = false
//  zones {
//    subnet_id = ibm_is_subnet.lab_iks_subnet1.id
//    name      = "${var.region}-1}"
//  }
//
//  zones {
//    subnet_id = ibm_is_subnet.lab_iks_subnet2.id
//    name      = "${var.region}-2}"
//  }
//
//  zones {
//    subnet_id = ibm_is_subnet.lab_iks_subnet3.id
//    name      = "${var.region}-3}"
//  }
// Dynamic Zone Provisioning per subnet in list
  dynamic "zones" {
    for_each = ibm_is_subnet.lab_iks_subnets
    content {
      name      = zones.value.zone
      subnet_id = zones.value.id
    }
  }
}
