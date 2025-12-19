$env:COMPUTERNAME

$Test = {Write-Output "This is a script block"}
& $Test

$Creds = Get-Credential
$someVariable = "This is from the GetHired Desktop Domain Controller!"


Invoke-Command -ComputerName "192.168.56.103" -Credential $Creds -ScriptBlock {
    Write-Output "This is running on $($env:COMPUTERNAME) and $($someVariable)"
     #Get-ADUser -Filter "*" -Server "GetHired.com"
}

Invoke-Command -ComputerName "192.168.56.103" -Credential $Creds -ScriptBlock {
    Write-Output "This is running on $($env:COMPUTERNAME) and $($args[0])"
     #Get-ADUser -Filter "*" -Server "GetHired.com"
} -ArgumentList $someVariable

Invoke-Command -ComputerName "192.168.56.103" -Credential $Creds -ScriptBlock {
    Write-Output "This is running on $($env:COMPUTERNAME) and $($using:someVariable)"
     #Get-ADUser -Filter "*" -Server "GetHired.com"
} 

$Users = Invoke-Command -ComputerName "192.168.56.103" -Credential $Creds -ScriptBlock {
     Get-ADUser -Filter "*" -Server "GetHired.com"
} 

$Users 

# -------------------------------------------------------------------------------
# Session leaves the session open so when creating a variable in a different session
# You can create a new one and still use that same variable
$session = New-PSSession -ComputerName "192.168.56.103" -Credential $Creds
Enter-PSSession -Session $session #Gives us access to that remote computer

Exit-PSSession

Invoke-Command -Session $session -ScriptBlock {
    $test = "Testing Testing"
}

Invoke-Command -Session $session -ScriptBlock {
    Write-Output $test
}

#---------------------------------------------------------------------------------------------
#Creates a new session everytime you invoke a command 
Invoke-Command -ComputerName "192.168.56.103" -Credential $Creds -ScriptBlock {
     $test = "Testing Testing"
}

Invoke-Command -ComputerName "192.168.56.103" -Credential $Creds -ScriptBlock {
     Write-Output $test
} 
# ---------------------------------------------------------------------------------------------

#Set-Item WSMan:\localhost\Client\TrustedHosts -Value "DC.GetHired.com,192.168.56.103"

Get-PSSession

Disconnect-PSSession -Session $session
Remove-PSSession -Session $session

Get-PSSession | Disconnect-PSSession |Remove-PSSession