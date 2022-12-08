# terraform-operations-demo
Demonstrate operations manager capabilities with terraform created infrastructure and app deployment

## Setup your environment
- Start a cloud shell

- Set env variables
```
# verify connectivity
gcloud auth list
gcloud config list project
# if in cloud shell
export PROJECT_ID=$DEVSHELL_PROJECT_ID
# otherwise
export PROJECT_ID=<your-project-id>
echo $PROJECT_ID

# override terraform variables with env variables
export TF_VAR_project_id=$PROJECT_ID
export TF_VAR_region=us-central1
export TF_VAR_zone=us-central1-a
```
- Create a terraform service account
```
export TERRAFORM_SA_ID=terraform
./create-service-account.sh
```
- If running in argolis, set org policies
```
./set-argolis-org-policies.sh
```

## Deploy the gke infrastructure

```
cd tf-gke
terraform init
terraform plan
terraform apply --auto-approve
# will take about 10 minutes to complete
```