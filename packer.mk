build-packer:
	@packer build -var-file=vhd/packer/settings.json vhd/packer/vhd-image-builder.json

init-packer:
	@./vhd/packer/init-variables.sh

az-setup:
	@./hack/cloud-register.sh

az-login:
	az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}

run-packer: az-setup az-login
	@packer version && ($(MAKE) init-packer | tee -a vhd/packer/packer-output) && ($(MAKE) build-packer | tee -a packer-output)

az-copy: az-login
	azcopy-preview copy "${OS_DISK_SAS}" "${CLASSIC_BLOB}${CLASSIC_SAS_TOKEN}"

delete-sa: az-login
	az storage account delete -n ${SA_NAME} -g ${AZURE_RESOURCE_GROUP_NAME} --yes

generate-sas: az-login
	az storage container generate-sas --name vhds --permissions lr --connection-string "${CLASSIC_SA_CONNECTION_STRING}" --start ${START_DATE} --expiry ${EXPIRY_DATE} | tr -d '"' | tee -a vhd-sas && cat vhd-sas
