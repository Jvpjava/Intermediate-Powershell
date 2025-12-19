param (
    $ComputerName,
    $Creds
)

Describe 'Checking deployment' {
    Context 'Checking windows services' {
        # This block of code ensures that the module imports correctly,
        # Functions are working correctly, making sure that services are 
        # running or stopped. Features installments and uninstallment.
        It 'Making sure the print spooler is Stopped' {
            $Service = Invoke-Command -ComputerName $ComputerName -Credential $Creds -ScriptBlock {
                Get-Service Spooler
            }
            $Service.status | Should be 'Stopped'
        }
    }
}