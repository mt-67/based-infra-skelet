# Actual Time Spent

2 hours 35 minutes

# What I’d add if I had another day

- IAM Roles и Policy (is important for the security of the resource from users)
- Disable Public Access to Control Plane (prevents attackers from reaching the Kubernetes API over the internet)
- Network policies Zero-Trust (is important for the security of the infrastructure)
- IRSA integration for least-privilege access from pods (so that the pods can access the api were under control and with the roles they were given)
- CloudWatch logging and metrics 
- Terraform module for Vault integration via KMS

# Notes

Architecture diagram is in `architecture.md`.  
3 Hardening steps are described in `README.md`.
