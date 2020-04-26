#!/bin/bash -ex

CREATE_TIME="$(date +%s)"
STORAGE_ACCOUNT_NAME="jadarsievhdsa"
AZURE_RESOURCE_GROUP_NAME="ecs-ci"

az group create -n ${AZURE_RESOURCE_GROUP_NAME} -l ${AZURE_LOCATION}
az storage account create -n ${STORAGE_ACCOUNT_NAME} -g ${AZURE_RESOURCE_GROUP_NAME} --sku "Standard_RAGRS" --kind Storage
key=$(az storage account keys list -n ${STORAGE_ACCOUNT_NAME} -g ${AZURE_RESOURCE_GROUP_NAME} | jq -r '.[0].value')
az storage container create --name system --account-key=${key} --account-name=${STORAGE_ACCOUNT_NAME}

cat <<EOF > vhd/packer/settings.json
{
    "subscription_id": "${AZURE_SUBSCRIPTION_ID}",
    "client_id": "${AZURE_CLIENT_ID}",
    "client_secret": "${AZURE_CLIENT_SECRET}",
    "tenant_id": "${AZURE_TENANT_ID}",
    "resource_group_name": "${AZURE_RESOURCE_GROUP_NAME}",
    "location": "${AZURE_LOCATION}",
    "storage_account_name": "${STORAGE_ACCOUNT_NAME}",
    "vm_size": "${AZURE_VM_SIZE}",
    "create_time": "${CREATE_TIME}",
    "ubuntu_sku": "${UBUNTU_SKU}"
}
EOF

cat vhd/packer/settings.json
