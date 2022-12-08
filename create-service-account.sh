#!/bin/bash

# export TERRAFORM_SA_ID=terraform

gcloud iam service-accounts create $TERRAFORM_SA_ID \
  --project=$PROJECT_ID

echo "adding roles ..."
# add roles
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:$TERRAFORM_SA_ID@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/compute.admin" --no-user-output-enabled

# roles/compute.networkAdmin
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:$TERRAFORM_SA_ID@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/compute.networkAdmin" --no-user-output-enabled

# roles/container.clusterAdmin
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:$TERRAFORM_SA_ID@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/container.clusterAdmin" --no-user-output-enabled 

# roles/billing.projectManager
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:$TERRAFORM_SA_ID@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/billing.projectManager" --no-user-output-enabled

# roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:$TERRAFORM_SA_ID@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/iam.serviceAccountUser" --no-user-output-enabled
  
# roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding $PROJECT_ID  \
  --member="serviceAccount:$TERRAFORM_SA_ID@$PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/iam.serviceAccountUser" --no-user-output-enabled
