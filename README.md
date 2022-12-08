# terraform-operations-demo
Demonstrate operations manager capabilities with terraform created infrastructure and app deployment

## Setup your environment
- Start a cloud shell

- verify connectivity & setup vars
```
gcloud auth list
gcloud config list project
# if in cloud shell
export PROJECT_ID=$DEVSHELL_PROJECT_ID
# otherwise
export PROJECT_ID=<your-project-id>
echo $PROJECT_ID
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

- Set terraform env variables
```
# override terraform variables with env variables
export TF_VAR_project_id=$PROJECT_ID
export TF_VAR_region=us-central1
export TF_VAR_zone=us-central1-a
export TF_VAR_terraform_service_account=$TERRAFORM_SA_ID

```

## Deploy the gke infrastructure

```
cd tf-gke
terraform init
terraform plan
terraform apply --auto-approve
# will take about 10 minutes to complete
```

## Deploy the kubernetes app
```
cd tf-k8s
terraform init
terraform plan
terraform apply --auto-approve
# will take about 10 minutes to complete
```

## Post setup steps
- verify apps are running
```
# get the kubernetes cluster context
gcloud container clusters get-credentials ${PROJECT_ID-gke} --zone $TF_VAR_zone
# check pod status
kubectl get pods
# should all show "running"
```

- go to operations console
- review Logging -> Logs Explorer
- review Trace -> Trace List

### Things to try
- create a log based metric. 
- An example is provided in the log-based-metric.yml file
```
gcloud logging metrics create custom-metric2 --config-from-file ./custom-metric.yml
```
- Then explore this metric in Logging -> Log Based Metrics

### to do
- create metrics (based on log)
- create dashboard (Monitoring)
- error reporting
