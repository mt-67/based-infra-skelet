![изображение](https://github.com/user-attachments/assets/ac2c0f2d-7a4c-4836-8190-a72e72e3f6c1)

---
config:
  layout: fixed
---
# Architecture Overview

# Diagram
flowchart TB
    #Region
      subgraph AWS Region [Region]
    #VPC
        subgraph VPC [VPC: katana]  
        IGW[Internet Gateway]
    #Public Subnets
            subgraph AZ_A [Availability Zone A]
                PUB_A[Public Subnet A]
                  NAT_A[NAT Gateway]
                PRIV_A[Private Subnet A] --> NAT_A[NAT Gateway] --> IGW[Internet Gateway]
                  EKS_A[EKS Cluster]
                    NODES_A[Worker Nodes]
            end
            subgraph AZ_A [Availability Zone B]
                PUB_A[Public Subnet B]
                  NAT_A[NAT Gateway]
                PRIV_A[Private Subnet B] --> NAT_A[NAT Gateway] --> IGW[Internet Gateway]
                  EKS_A[EKS Cluster]
                    NODES_A[Worker Nodes]
            end
            subgraph AZ_A [Availability Zone C]
                PUB_A[Public Subnet C]
                  NAT_A[NAT Gateway]
                PRIV_A[Private Subnet C] --> NAT_A[NAT Gateway] --> IGW[Internet Gateway]
                  EKS_A[EKS Cluster]
                    NODES_A[Worker Nodes]
            end       
