# Description: Detection script to verify WinVerifyTrust registry keys are configured to enable certificate padding checks.
# If the registry keys do not exist, the script will terminate with an exit code of 1 indicating to run the remediation script.
# If the registry keys exist, the script will terminate with an exit code of 0 indicating no issues.

$enable64   = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Cryptography\WinTrust\Config\' -ErrorAction SilentlyContinue).EnableCertPaddingCheck
$enable32 = (Get-ItemProperty 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Cryptography\WinTrust\Config\' -ErrorAction SilentlyContinue).EnableCertPaddingCheck

if ($enable64 -ne 1 -or $enable32 -ne 1) {
    exit 1
}
else {
    exit 0
}