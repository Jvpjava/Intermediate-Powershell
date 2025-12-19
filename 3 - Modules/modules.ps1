Set-StrictMode -Version Latest
Import-Module "C:\Users\junio\Desktop\Powershell Intermediates\3 - Modules\Configurations\Configuration.psm1" -Force
New-ModuleManifest -Path "C:\Users\junio\Desktop\Powershell Intermediates\3 - Modules\Configurations\Configuration.psd1" -Author "Junior Valerio" -Description "Module Configurations" -ModuleVersion "1.0.2" -RootModule "Configuration.psm1"

Get-Command -Module Configuration
Get-Help Get-Configuration

