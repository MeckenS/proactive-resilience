$enable64   = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Cryptography\WinTrust\Config\' -ErrorAction SilentlyContinue).EnableCertPaddingCheck
$enable32 = (Get-ItemProperty 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Cryptography\WinTrust\Config\' -ErrorAction SilentlyContinue).EnableCertPaddingCheck

$WinVerifyTrustSigValEnabled = ([int]$enable64 -eq 1) -and ([int]$enable32 -eq 1)

$hash = @{
    WinVerifyTrustSigValEnabled = $WinVerifyTrustSigValEnabled

}

return $hash | ConvertTo-Json -Compress