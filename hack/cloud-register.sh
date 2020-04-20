#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

register() {
    if az cloud list | jq '.[].name' | grep $CLOUD_AZCLI_NAME; then
        return
    fi

    VM_IMAGES="https://raw.githubusercontent.com/Azure/azure-rest-api-specs/master/arm-compute/quickstart-templates/aliases.json"
    
    az cloud register \
    -n $CLOUD_AZCLI_NAME \
    --endpoint-resource-manager $RESOURCE_MANAGER_ENDPOINT \
    --endpoint-vm-image-alias-doc $VM_IMAGES \
    --suffix-storage-endpoint $STORAGE_ENDPOINT_SUFFIX \
    --suffix-keyvault-dns $KEY_VAULT_DNS_SUFFIX
}

register
az cloud set -n $CLOUD_AZCLI_NAME
az cloud update --profile $API_PROFILE