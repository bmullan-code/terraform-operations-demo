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
gcloud iam service-accounts create terraform \
  --project=$PROJECT_ID
# add roles
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:terraform@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/compute.admin"
# roles/compute.networkAdmin
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:terraform@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/compute.networkAdmin"
# roles/container.clusterAdmin
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:terraform@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/container.clusterAdmin"
# roles/billing.projectManager
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:terraform@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/billing.projectManager"
# roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:terraform@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/iam.serviceAccountUser"

```




## Deploy the gke infrastructure

```
cd tf-gke
terraform init
terraform plan
terraform apply --auto-approve
# will take about 10 minutes to complete


```