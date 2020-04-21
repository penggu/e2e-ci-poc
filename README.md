# e2e-ci-poc

## Inputs

### Cloud Details

Compose an `.env` file with your cloud details. Example [sample.env](env/sample.env) lists the required variables.

### Test cluster

Compose a `.json` file with your cluster definition and variables overrides. Variables defaults are [here](env/defaults.env). Checkout [sample.json](test_clusters/sample.json) shows how to override default values.

## Run locally

Requires `docker`, `azure-cli`, `git`, `bash` & `jq`.

```bash
make run-local INPUT=env/sample.env
```

If you do not have `make`

```bash
./scripts/run-local.sh env/sample.env
```

## Run on DVM

Create a Linux VM and make sure your input `.env` sets variable `DVM_HOST`.

```bash
make setup-dvm run-dvm results INPUT=env/sample.env
```

If you do not have `make`

```bash
./scripts/upload.sh env/sample.env
./scripts/run-dvm.sh env/sample.env
./scripts/results.sh env/sample.env
```
