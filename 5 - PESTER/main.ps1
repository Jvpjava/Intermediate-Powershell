Invoke-Pester -Script (.\pestertest.ps1 -ComputerName 192.168.56.103 -Credential (Get-Credential))

$ScriptParameters = @{
    Path = "C:\Users\junio\Desktop\Powershell Intermediates\5 - PESTER\pestertest.ps1"
    Parameters= @{
        ComputerName = "192.168.56.103"
        Creds        = Get-Credential
    }
}

Invoke-Pester -Script $ScriptParameters -OutputFile "C:\Users\junio\Desktop\Powershell Intermediates\5 - PESTER\output.xml" -OutputFormat NUnitXml
