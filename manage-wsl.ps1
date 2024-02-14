param(
    [string]$target_distribution = "Ubuntu-22.04",
    [string]$wsl_instances_path = "C:\Users\testuser\OneDrive\Desktop\wsl-instances",
    [string]$instance_name = "dev-environment",

    [Parameter(ParameterSetName = "Create")]
    [switch]$create,

    [Parameter(ParameterSetName = "Delete")]
    [switch]$delete
)

#################### BEGIN SCRIPT ####################

if (-not((wsl --list) -contains $target_distribution) -and -not((wsl --list) -contains "${target_distribution} (Default)")) {
    Write-Warning "Currently ${target_distribution} is not installed. To fix this run wsl --install ${target_distribution}."
    exit 1;
}

# This assumes that wsl is already pre-configured with everything you need. This includes: users and general configuration.
if (-Not(Test-Path $wsl_instances_path)) {
    New-Item -ItemType Directory -Path $wsl_instances_path
}

switch ($true) {
    $create {
        wsl --export "${target_distribution}" ".\test"
        wsl --import "${instance_name}" "${wsl_instances_path}\${instance_name}" ".\test"
        Remove-Item ".\test"
    }
    $delete {
        wsl --unregister "${instance_name}"
        Remove-Item "${wsl_instances_path}\${instance_name}"
    }
}
