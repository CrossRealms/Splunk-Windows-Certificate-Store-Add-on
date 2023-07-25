<#
    .SYNOPSIS
    Get Certificate data from one or more certificate authorities.
 
    .PARAMETER SearchPath
    Certificate Authority location string "computername\CAName" (Default gets location strings from Current Domain)
 
    .PARAMETER ExcludeProperties
    Certificate properties to exclude in the output.

    All Available Fields
        PSPath
        PSParentPath
        PSChildName
        IssuerName
        HasPrivateKey
        SubjectName
        FriendlyName
        Issuer
        NotAfter
        NotBefore
        SerialNumber
        Thumbprint
        EnhancedKeyUsageList
        PSDrive
        PSProvider
        PSIsContainer
        PrivateKey
        PublicKey
        RawData
        SendAsTrustedIssuer
        EnrollmentServerEndPoint
        Extensions
        EnrollmentPolicyEndPoint
        DnsNameList
        Subject
        SignatureAlgorithm
        Version
        PolicyId
        Handle
        Archived

    Default excluded fields
        PSIsContainer
        PrivateKey
        RawData
        Thumbprint
        EnhancedKeyUsageList
        EnrollmentServerEndPoint
        EnrollmentPolicyEndPoint
        Extensions
        PolicyId
        Handle
        Archived

    Note: included fields will vary depending on cert type and properties included in the cert
 
    .EXAMPLE
    get_local_certificates.ps1
    Recurse all certificates in "Cert:\LocalMachine"
 
    .EXAMPLE
    get_local_certificates.ps1 -SearchPath "Cert:\LocalMachine\CA"
    Recurse all certificates in "Cert:\LocalMachine\CA"


    .EXAMPLE
    get_local_certificates.ps1 -SearchPath "Cert:\LocalMachine\CA" -ExcludeProperties 'PSPath','PSDrive'
    Recurse all certificates in "Cert:\LocalMachine\CA" and only exclude the PSDrive and PSpath properties.


#>
[CmdletBinding()]
Param (
    # Certificate Authority location string "computername\CAName" (Default gets location strings from Current Domain)
    [String]
    $SearchPath = "Cert:\LocalMachine",

    # Certificate Fields to exclude in Export
    [String[]]
    $ExcludeProperties = @(
        'PSIsContainer',
        'PrivateKey',
        'RawData',
        'Thumbprint',
        'EnhancedKeyUsageList',
        'EnrollmentServerEndPoint',
        'EnrollmentPolicyEndPoint',
        'Extensions',
        'PolicyId',
        'Handle',
        'Archived'
    )
) 

Get-ChildItem $SearchPath -Recurse | Where-Object {-not $_.PSIsContainer} | Select-Object -Property * -ExcludeProperty $ExcludeProperties
