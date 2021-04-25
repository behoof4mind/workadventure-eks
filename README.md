# workadventure-eks
https://github.com/thecodingmachine/workadventure infrastructure based on AWS EKS solution

## How to prepare EKS cluster
0. Register domain https://aws.amazon.com/getting-started/hands-on/get-a-domain/
1. Create Hosted Zone
2. Get host zone id
3. Go to IAM and create new role (don't forget to replace **YOUR_HOSTED_ZONE_ID**):   
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "route53:ChangeResourceRecordSets"
      ],
      "Resource": [
        "arn:aws:route53:::hostedzone/<YOUR_HOSTED_ZONE_ID>"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ListHostedZones",
        "route53:ListResourceRecordSets"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
```
4. Find and copy policy ARN5. 
5. Attach OIDC by:   
```shell
eksctl utils associate-iam-oidc-provider --region=<YOUR_AWS_REGION>> --cluster=<YOUR_CLUSTER_NAME> --approve
```
5. Create IAM service account:   
```shell
 eksctl create iamserviceaccount \
    --name external-dns \
    --namespace kube-system \
    --cluster <YOUR_CLUSTER_NAME> \
    --attach-policy-arn YOUR_IAM_POLICY_ARN \
    --approve \
    --override-existing-serviceaccounts
```
6. Check service account IAM role
```shell
kubectl describe sa external-dns -n kube-system
```
0. Install [awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) 
1. Change variables if you need
2. Change terraform backend config to your own
3. Set **AWS_DEFAULT_REGION**, **AWS_ACCESS_KEY_ID**, **AWS_SECRET_ACCESS_KEY** environment variables
4. Execute ``teraform init && terraform apply``
5. Configure kubectl
```shell
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```
6. Check that everything is working by
```shell
kubectl version
```
you should see client and server version 

## How to install Traefik ingress controller
1. Install helm
2. Install traefik ingress controller by:
```shell
helm install traefik traefik/traefik -n traefik
```
3. 