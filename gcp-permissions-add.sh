#!/bin/bash

PROJECT_ID="Project-ID-Project-ID"
MEMBER="group:name_of_group@domain.com"

# List of roles to assign
ROLES=(
    "roles/aiplatform.admin"
    "roles/apigee.apiAdmin"
    "roles/apigee.developerAdmin"
    "roles/apigee.environmentAdmin"
    "roles/backupdr.admin"
    "roles/compute.imageUser"
    "roles/compute.instanceAdmin.v1"
    "roles/compute.networkAdmin"
    "roles/compute.publicIpAdmin"
    "roles/consumerprocurement.admin"
    "roles/iam.serviceAccountCreator"
    "roles/dataform.admin"
    "roles/deloitte.cmsOperations"
    "roles/notebooks.admin"
    "roles/securitycenter.adminViewer"
    "roles/iam.serviceAccountAdmin"
    "roles/iam.serviceAccountUser"
    "roles/storage.admin"
    "roles/storage.folderAdmin"
    "roles/storage.hmacKeyAdmin"
    "roles/storage.objectAdmin"
    "roles/storage.objectCreator"
    "roles/storage.objectViewer"
    "roles/vmmigration.admin"
)

for ROLE in "${ROLES[@]}"; do
    echo "Assigning $ROLE to $MEMBER..."
    gcloud projects add-iam-policy-binding "$PROJECT_ID" \
        --member="$MEMBER" \
        --role="$ROLE" \
        --quiet
done

echo "All roles have been assigned."
