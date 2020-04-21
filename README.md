# e2e-ci-poc

## Inputs

### Cloud Details

Compose an `.env` file with your cloud details. Example [sample.env](env/sample.env) lists the required variables.

### Test cluster

Compose a `.json` file with your cluster definition and variables overrides. Variables defaults are [here](env/defaults.env). Checkout [sample.json](test_clusters/sample.json) shows how to override default values.

## Run locally

Requires `docker`, `azure-cli`, `git`, `bash` & `jq`.
if not available, run the following command in elevated powershell window:
```powershell
# 1.1 On Windows DVM, launch Powershell as Administrator
# 1.2 Change Powershell security policy
Set-ExecutionPolicy Bypass -Scope Process -Force
# 1.3 Enable TLS
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
# 1.4 Download and install chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# 1.5 Use chocolately to install packages
choco install docker -y
choco install azure-cli -y
choco install git.install --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf" -y
choco install jq -y
```

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
