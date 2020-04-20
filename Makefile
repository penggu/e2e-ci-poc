INPUT := env/input.env

.PHONY: setup-dvm
setup-dvm:
	scripts/upload.sh $(INPUT)

.PHONY: run-dvm
run-dvm:
	scripts/run-dvm.sh $(INPUT)

.PHONY: run-local
run-local:
	scripts/run-local.sh $(INPUT)

.PHONY: results
results:
	scripts/results.sh $(INPUT)
