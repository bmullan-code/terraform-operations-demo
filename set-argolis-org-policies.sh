#!/bin/bash
# based on go/argolis-gke

# export PROJECT_ID=sandbox2-363416

# gcloud -q resource-manager org-policies disable-enforce compute.requireOsLogin --project=${PROJECT_ID}
# gcloud -q resource-manager org-policies disable-enforce compute.vmCanIpForward --project=${PROJECT_ID}

cat > /tmp/os_login.yaml << ENDOFFILE
name: projects/$PROJECT_ID/policies/compute.requireOsLogin
spec:
  rules:
  - enforce: false
ENDOFFILE
gcloud org-policies set-policy /tmp/os_login.yaml -q


cat > /tmp/shieldedVm.yaml << ENDOFFILE
name: projects/$PROJECT_ID/policies/compute.requireShieldedVm
spec:
  rules:
  - enforce: false
ENDOFFILE
gcloud org-policies set-policy /tmp/shieldedVm.yaml 


cat > /tmp/vmCanIpForward.yaml << ENDOFFILE
name: projects/$PROJECT_ID/policies/compute.vmCanIpForward
spec:
  rules:
  - allowAll: true
ENDOFFILE
gcloud org-policies set-policy /tmp/vmCanIpForward.yaml


cat > /tmp/vmExternalIpAccess.yaml << ENDOFFILE
name: projects/$PROJECT_ID/policies/compute.vmExternalIpAccess
spec:
  rules:
  - allowAll: true
ENDOFFILE
gcloud org-policies set-policy /tmp/vmExternalIpAccess.yaml


cat > /tmp/restrictVpcPeering.yaml << ENDOFFILE
name: projects/$PROJECT_ID/policies/compute.restrictVpcPeering
spec:
  rules:
  - allowAll: true
ENDOFFILE
gcloud org-policies set-policy /tmp/restrictVpcPeering.yaml




