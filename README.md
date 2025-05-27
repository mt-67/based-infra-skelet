# KatanaPay EKS Platform

## Overview

This infrastructure provides an isolated, production-grade foundation for running workloads securely on AWS using a private EKS cluster. The design isolates workloads at the networking level, keeps the control plane inaccessible from the internet, and prepares the system for further hardening and observability.

## Infrastructure Descriptions?

The infrastructure skeleton was created in terraform with vpc in 3 zones private and public, the cluster is deployed in **private subnets** The endpoint of the control plane is **private**.  The NAT Gateway is on the same public subnet as the Internet Gateway and all 3 private subnets have access to it. The public modules used are terraform-aws-modules/vpc and terraform-aws-modules/eks from Terraform Registry.No working nodes yet; this is a basic phase (stub configuration).

Terraform validate for this infrastructure was successful (screenshot attached)
![telegram-cloud-photo-size-2-5307721993602333597-y](https://github.com/user-attachments/assets/3a536d70-bf44-4872-ae87-4e71b9666f46)

Еhe architecture.md file contains the configuration of the entire infrastructure graphical layout (attached screenshot of the infrastructure graphical layout and a link to view it without having to enter the credentials).
---

## Next Sprint

- **Deploy Vault with KMS-based auto-unseal**  
  Enables secret management and dynamic credentials with secure key storage.

- **Adopt GitOps with ArgoCD**  
  Declarative application lifecycle management using ApplicationSets and Git as the source of truth.

- **Enable Observability Stack**  
  Deploy Grafana with Loki for log aggregation, and Prometheus (IAM-authenticated) for metrics collection.
