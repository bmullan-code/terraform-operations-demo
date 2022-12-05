# terraform-operations-demo
Demonstrate operations manager capabilities with terraform created infrastructure and app deployment

## Setup your environment
- Start a cloud shell
```
# verify connectivity
gcloud auth list
gcloud config list project
export PROJECT_ID=$DEVSHELL_PROJECT_ID
echo $PROJECT_ID

# override terraform variables with env variables
export TF_VAR_project_id=$PROJECT_ID
export TF_VAR_region=us-central1
export TF_VAR_zone=us-central1-a
```



## Deploy the gke infrastructure

```
cd tf-gke
terraform init
terraform plan
terraform apply --auto-approve

```