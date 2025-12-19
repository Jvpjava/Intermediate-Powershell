function Get-ConfigurationFile {
    [CmdletBinding()]
    param ()

    <#
        .DESCRIPTION
        This is the description for the get-configuration cmdlet written by Junior Valerio

        .EXAMPLE
        Get-Configuration
        This will return all configurations

        .EXAMPLEGet-Configuration -Name "Test"
        This will return configuration with the name of test

        .LINK
        This is a link to my github and my website that has more help for this module.
    #>
    Write-Output "Getting Configuration File"
}

function Set-ConfigurationFile {
    [CmdletBinding()]
    param()
    Write-Output "Setting Configuration File"
}

function New-ConfigurationFile {
    [CmdletBinding()]
    param ()
    Write-Output "Getting Configuration File"
}