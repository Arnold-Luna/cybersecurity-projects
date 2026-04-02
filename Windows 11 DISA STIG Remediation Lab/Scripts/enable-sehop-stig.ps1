# enable-sehop-stig.ps1
# Remediates Windows 11 DISA STIG WN11-00-000150
# Ensures Structured Exception Handling Overwrite Protection (SEHOP) is enabled
# by setting:
# HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\DisableExceptionChainValidation = 0

$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel"
$valueName = "DisableExceptionChainValidation"
$desiredValue = 0

Write-Host "Starting SEHOP DISA STIG remediation..." -ForegroundColor Cyan
Write-Host "Target Path: $registryPath"
Write-Host "Value Name : $valueName"
Write-Host "Desired    : $desiredValue"
Write-Host ""

try {
    # Confirm the registry path exists
    if (-not (Test-Path $registryPath)) {
        throw "Registry path does not exist: $registryPath"
    }

    # Check if the value already exists
    $currentValue = $null
    try {
        $currentValue = (Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction Stop).$valueName
        Write-Host "Current value found: $currentValue" -ForegroundColor Yellow
    }
    catch {
        Write-Host "Registry value not found. It will be created." -ForegroundColor Yellow
    }

    # Create or update the DWORD value
    New-ItemProperty `
        -Path $registryPath `
        -Name $valueName `
        -Value $desiredValue `
        -PropertyType DWord `
        -Force | Out-Null

    # Read back and verify
    $updatedValue = (Get-ItemProperty -Path $registryPath -Name $valueName).$valueName

    if ($updatedValue -eq $desiredValue) {
        Write-Host ""
        Write-Host "SUCCESS: SEHOP registry setting is compliant." -ForegroundColor Green
        Write-Host "$valueName = $updatedValue"
        Write-Host "A reboot is recommended before re-running the SCAP scan." -ForegroundColor Cyan
    }
    else {
        throw "Verification failed. Expected $desiredValue but found $updatedValue."
    }
}
catch {
    Write-Host ""
    Write-Host "ERROR: Remediation failed." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}
