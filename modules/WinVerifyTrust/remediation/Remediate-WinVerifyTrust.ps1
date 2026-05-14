# Description: This is a remediation script used to configure the WinVerifyTrust registry keys to enable certificate padding checks.

try {
    $registryPaths = @(
        'HKLM:\SOFTWARE\Microsoft\Cryptography\Wintrust\Config'
        'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Cryptography\Wintrust\Config'
    )

    foreach ($path in $registryPaths) {
        New-Item -Path $path -ItemType Container -Force -ErrorAction Stop | Out-Null
        New-ItemProperty -Path $path -Name 'EnableCertPaddingCheck' -Value 1 -PropertyType DWord -Force -ErrorAction Stop | Out-Null
    }
} catch {
    Write-Error "Failed to create registry keys: $($_.Exception.Message)"
}

Get-Service -Name CryptSvc -Verbose | Stop-Service -Verbose -Force -PassThru | Start-Service -Verbose -PassThru