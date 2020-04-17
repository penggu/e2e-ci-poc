INPUT := env/input.env

.PHONY: setup
setup:
	scripts/upload.sh $(INPUT)

.PHONY: run
run:
	scripts/run-dvm.sh $(INPUT)

.PHONY: run-local
run-local:
	scripts/run-local.sh $(INPUT)

.PHONY: results
results:
	scripts/results.sh $(INPUT)
