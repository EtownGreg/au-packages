<# 
    Rename this file to register.ps1 or it will get overwritten by the future updates.
    For the list of all environment vars run `gitlab-runner register --help`
    Running runners should automatically pick up config.toml changes.
#>

$Env:REGISTRATION_TOKEN         = ''
$Env:CI_SERVER_URL              = ''
$Env:RUNNER_TAG_LIST            = ''

$Env:RUNNER_NAME                = ''
$Env:RUNNER_EXECUTOR            = 'shell'
$Env:RUNNER_SHELL               = 'powershell'

$Env:CONFIG_FILE                = "$PSScriptRoot\config.toml"
$Env:REGISTER_RUN_UNTAGGED      = 'false'
$Env:RUNNER_REQUEST_CONCURRENCY = 1
$Env:RUNNER_BUILDS_DIR          = ''
$Env:RUNNER_CACHE_DIR           = ''

gitlab-runner register --non-interactive
