---
config:
  layout: fixed
---
flowchart TD
    VPC["VPC: katana"] --> PUB1["Public Subnet A"] & PUB2["Public Subnet B"] & PUB3["Public Subnet C"] & PRIV1["Private Subnet A"] & PRIV2["Private Subnet B"] & PRIV3["Private Subnet C"]
    PUB1 --> NAT["NAT Gateway"]
    NAT --> IGW["Internet Gateway"]
    PRIV1 --> NAT & EKS["EKS Cluster katana 
    (Private API Endpoint)"]
    PRIV2 --> EKS & NAT
    PRIV3 --> EKS & NAT
    EKS --> PODS["Worker Nodes 
  0 count"]
    PODS --> IRSA["IRSA 
  (TODO)"]
    style VPC stroke-width:4px,stroke-dasharray: 0
    style PUB1 stroke:#2962FF
    style PUB2 stroke:#2962FF
    style PUB3 stroke:#2962FF
    style PRIV1 stroke:#D50000
    style PRIV2 stroke:#D50000
    style PRIV3 stroke:#D50000
    style IGW stroke-width:1px,stroke-dasharray: 0
    style IRSA stroke-width:1px,stroke-dasharray: 0
    style EKS stroke-width:4px,stroke-dasharray: 0
    style PODS stroke-width:2px,stroke-dasharray: 0
    linkStyle 13 stroke:#000000,fill:none
