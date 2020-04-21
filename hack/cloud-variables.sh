#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

METADATA=$(mktemp)
curl -sk -o ${METADATA} "https://management.${AZURE_LOCATION}.${CLOUD_FQDN}/metadata/endpoints?api-version=2015-01-01"

echo export LOCATION=\"$AZURE_LOCATION\"
echo export REGION_OPTIONS=\"$AZURE_LOCATION\"
echo export CLIENT_ID=\"$AZURE_CLIENT_ID\"
echo export CLIENT_SECRET=\"$AZURE_CLIENT_SECRET\"
echo export SUBSCRIPTION_ID=\"$AZURE_SUBSCRIPTION_ID\"
echo export TENANT_ID=\"$AZURE_TENANT_ID\"
echo export CUSTOM_CLOUD_CLIENT_ID=\"$AZURE_CLIENT_ID\"
echo export CUSTOM_CLOUD_SECRET=\"$AZURE_CLIENT_SECRET\"

echo export PORTAL_ENDPOINT=\"https://portal.${AZURE_LOCATION}.${CLOUD_FQDN}\"
echo export RESOURCE_MANAGER_ENDPOINT=\"https://management.${AZURE_LOCATION}.${CLOUD_FQDN}\"

echo export SERVICE_MANAGEMENT_ENDPOINT=\"$(jq -r '.authentication.audiences | .[0]' "$METADATA")\"
echo export ACTIVE_DIRECTORY_ENDPOINT=\"$(jq -r .authentication.loginEndpoint "$METADATA" | sed -e 's/adfs\/*$//')\"
echo export GALLERY_ENDPOINT=\"$(jq -r .galleryEndpoint "$METADATA")\"
echo export GRAPH_ENDPOINT=\"$(jq -r .graphEndpoint "$METADATA")\"
echo export KEY_VAULT_DNS_SUFFIX=\"".vault.${AZURE_LOCATION}.${CLOUD_FQDN}"\"

echo export STORAGE_ENDPOINT_SUFFIX=\"${AZURE_LOCATION}.${CLOUD_FQDN}\"
echo export RESOURCE_MANAGER_VM_DNS_SUFFIX=\"cloudapp.${CLOUD_FQDN}\"
echo export SERVICE_MANAGEMENT_VM_DNS_SUFFIX=\"cloudapp.net\"

API_MODEL=$(jq -c '.apiModel' ${CLUSTER_DEFINITION})
echo export API_MODEL_INPUT=\'${API_MODEL}\'
