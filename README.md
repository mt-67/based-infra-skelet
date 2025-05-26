# Skeleton EKS Platform

## Overview

This infrastructure provides an isolated, production-grade foundation for running workloads securely on AWS using a private EKS cluster. The design isolates workloads at the networking level, keeps the control plane inaccessible from the internet, and prepares the system for further hardening and observability.

## Why Isolation and a Private Cluster?

- **Security-first architecture**: Avoid exposing sensitive APIs or workloads to the public internet.
- **Separation of concerns**: Public-facing services (e.g., Load Balancers) reside in public subnets, internal services run in private subnets.
- **Control plane protection**: Only internal resources in VPC can interact with Kubernetes API.

The cluster is deployed in **private subnets** across multiple AZs. The control plane endpoint is **private-only**. There are no worker nodes yet; this is a foundation phase (stub configuration).

---

## 3 First Hardening Steps (and Why)

1. **Disable Public Access to Control Plane**  
   Prevents attackers from reaching the Kubernetes API over the internet.

2. **Enable Network Policies (via CNI)**  
   Enforces traffic rules between pods, critical for environments requiring PCI-DSS or strict microsegmentation.

3. **Use IRSA for Pod Identity**  
   Replaces static AWS credentials with IAM Roles for Service Accounts, improving auditability and security.

---

## Next Sprint

- **Deploy Vault with KMS-based auto-unseal**  
  Enables secret management and dynamic credentials with secure key storage.

- **Adopt GitOps with ArgoCD**  
  Declarative application lifecycle management using ApplicationSets and Git as the source of truth.

- **Enable Observability Stack**  
  Deploy Grafana with Loki for log aggregation, and Prometheus (IAM-authenticated) for metrics collection.
