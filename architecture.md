![изображение](https://github.com/user-attachments/assets/ac2c0f2d-7a4c-4836-8190-a72e72e3f6c1)

# Architecture Overview

## Diagram
---
config:
  layout: fixed
---
graph TD
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


## Config in Mermaid

---
config:
  layout: fixed
---
flowchart TD
    n33["NAT Gateway"] --> n38["Internet Gateway <br>"]
    n40["NAT Gateway"] --> n38
    n42["NAT Gateway"] --> n38
    EKS["EKS Cluster<br><br><br>"]
    PODS["Node"]
    n22["EKS Cluster<br><br><br><br>"]
    n23["Node"]
    n14["EKS Cluster<br><br><br><br>"]
    n20["Node"]
    n2["Public Subnet C"]
    n3["Public Subnet B"]
    n10["AZ (B) <br>"]
    n12["Private Subnet B<br><br><br><br><br> <br>"]
    n11["AZ (C)"]
    n18["Private Subnet C<br><br><br><br><br> <br>"]
    n25["Public Subnet C<br><br><br><br><br> <br>"]
    n16["Public Subnet B<br><br><br><br><br> <br>"]
    n9["AZ (A) <br>"]
    n19["EKS Cluster<br><br><br><br>"]
    n21["Private Subnet A<br><br><br><br><br> <br>"]
    n28["Node"]
    n29["EKS Cluster<br><br><br><br>"]
    n31["Node"]
    n32["Public Subnet A<br><br><br><br><br> <br>"]
    n35["EKS Cluster<br><br><br><br>"]
    n36["Node"]
    n37["VPC katana <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"]
    n41["NAT Gateway"]
    n43["NAT Gateway"]
    n44["NAT Gateway"]
    n45["Region <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"]
    n33@{ shape: rect}
    n38@{ shape: rect}
    n40@{ shape: rect}
    n42@{ shape: rect}
    n28@{ shape: rect}
    n29@{ shape: rect}
    n31@{ shape: rect}
    n32@{ shape: rect}
    n35@{ shape: rect}
    n36@{ shape: rect}
    n37@{ shape: rect}
    n41@{ shape: rect}
    n43@{ shape: rect}
    n44@{ shape: rect}
    n45@{ shape: rect}
    style n37 fill:transparent
    style n45 fill:transparent
