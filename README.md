# KatanaPay EKS Platform
[diagram](https://www.mermaidchart.com/raw/e95c1b9e-3771-4253-bd46-b403fba68c0b?theme=light&version=v0.1&format=svg) – link to the graphical infrastructure diagram
## Overview

This infrastructure provides an isolated, production-grade foundation for running workloads securely on AWS using a private EKS cluster. The design isolates workloads at the networking level, keeps the control plane inaccessible from the internet, and prepares the system for further hardening and observability.

## Infrastructure Descriptions

The infrastructure was created in terraform with vpc in 3 zones private and public, the cluster is deployed in private subnets. The endpoint of the control plane is private. The NAT Gateway is on the same public subnet as the Internet Gateway and all 3 private subnets have access to it. The public modules used are terraform-aws-modules/vpc and terraform-aws-modules/eks from Terraform Registry. I've created 0 nodes, because scale up when first microservice is deployed (stub configuration). irsa.tf is located in modules/eks

Terraform validate for this infrastructure was successful (screenshot attached)

![telegram-cloud-photo-size-2-5316800257385953736-y](https://github.com/user-attachments/assets/e34f9887-69f0-4ee8-a65f-4143d146a392)


The architecture.md file contains the configuration of the entire infrastructure graphical layout (attached screenshot of the infrastructure graphical layout and a link to view it without having to enter the credentials)

[diagram](https://www.mermaidchart.com/raw/e95c1b9e-3771-4253-bd46-b403fba68c0b?theme=light&version=v0.1&format=svg) – link to the graphical infrastructure diagram

![telegram-cloud-photo-size-2-5316800257385953707-y](https://github.com/user-attachments/assets/c2908633-5cd0-44de-9187-c3231b687a7a)


---
## PCI DSS Zones Mapping

- **Control Plane(etcd, kube scheduler, kube-apiserver, contorller manager)**  
  managed by AWS, out of scope
  
- **Data Plane (nodes, pods)**  
  in Private Subnets, restricted via SG
  
- **Audit Trail**  
  via VPC Flow Logs, IRSA logs

- **Threat-model**  
  NAT only for egress, no inbound to nodes, deny-all SG 
---
## TODO

- Network policy & WAF in later hardening

- Configure S3 backend
  
- **Secrets**  
  planned via Vault
  
- **Deploy Vault with KMS-based auto-unseal**  
  Enables secret management and dynamic credentials with secure key storage.

- **Adopt GitOps**  
  Declarative application lifecycle management using ApplicationSets and Git as the source of truth.

- **Enable Observability Stack**  
  Deploy Grafana with Loki for log aggregation, and Prometheus (IAM-authenticated) for metrics collection.

- **Make a Pipeline**  
  To make a pipelines for automatic assembly of Docker containers.

- Allocate a separate storage area
