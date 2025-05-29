# KatanaPay EKS Platform
[diagram](https://www.mermaidchart.com/raw/77c7eb92-865c-4935-8173-cbf689a35d8f?theme=light&version=v0.1&format=svg) – link to the graphical infrastructure diagram
## Overview

This infrastructure provides an isolated, production-grade foundation for running workloads securely on AWS using a private EKS cluster. The design isolates workloads at the networking level, keeps the control plane inaccessible from the internet, and prepares the system for further hardening and observability.

## Infrastructure Descriptions

The infrastructure skeleton was created in terraform with vpc in 3 zones private and public, the cluster is deployed in **private subnets** The endpoint of the control plane is **private**.  The NAT Gateway is on the same public subnet as the Internet Gateway and all 3 private subnets have access to it. The public modules used are terraform-aws-modules/vpc and terraform-aws-modules/eks from Terraform Registry.No working nodes yet; this is a basic phase (stub configuration).

Terraform validate for this infrastructure was successful (screenshot attached)

![telegram-cloud-photo-size-2-5307721993602333597-y](https://github.com/user-attachments/assets/3a536d70-bf44-4872-ae87-4e71b9666f46)

The architecture.md file contains the configuration of the entire infrastructure graphical layout (attached screenshot of the infrastructure graphical layout and a link to view it without having to enter the credentials)

[diagram](https://www.mermaidchart.com/raw/77c7eb92-865c-4935-8173-cbf689a35d8f?theme=light&version=v0.1&format=svg) – link to the graphical infrastructure diagram

![telegram-cloud-photo-size-2-5312282450006765450-y](https://github.com/user-attachments/assets/f4b91af6-5e26-4974-9f62-b7a7ca79123a)

---
## PCI DSS Zones Mapping

- **Control Plane**
  managed by AWS, out of scope
  
- **Data Plane (nodes, pods)**
  in Private Subnets, restricted via SG
  
- **Audit Trail**
  via VPC Flow Logs, IRSA logs

- **Threat-model**
  NAT only for egress, no inbound to nodes, deny-all SG 
---
## TODO

  Network policy & WAF in later hardening
  
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
