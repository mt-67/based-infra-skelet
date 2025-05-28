---
config:
  layout: fixed
---
flowchart TD
    n33["NAT Gateway"] --> n38["Internet Gateway <br>"]
    n40["NAT Gateway"] --> n38
    n42["NAT Gateway"] --> n38
    '''EKS["EKS Cluster<br><br><br>"]'''
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
