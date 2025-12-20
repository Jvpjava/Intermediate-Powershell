$JSONPath = "/Users/junio/PowerShell JP/Intermediate-Powershell/7 - JSON FILES/Employees.json"
$JSONData = Get-Content -Path $JSONPath | ConvertFrom-Json

$Employees = $JSONData.Employees
$EmployeesInSales = [System.Collections.ArrayList]@()
$EmployeesInMarketing = [System.Collections.ArrayList]@()
$EmployeesInEngineering = [System.Collections.ArrayList]@()

foreach($Employee in $Employees) {
    if($Employee.Department -eq "Sales") {
        $Employee
        $EmployeesInSales.Add($Employee) | Out-Null
    }
    elseif($Employee.Department -eq "Marketing") {
        $Employee
        $EmployeesInMarketing.Add($Employee) | Out-Null
    }
    elseif($Employee.Department -eq "Engineering") {
        $Employee
        $EmployeesInEngineering.Add($Employee) | Out-Null       
    } else {
        Write-Host "Department not recognized: $($Employee.Department)" 
    }
}

$EmployeesInSales | Format-Table 
$EmployeesInMarketing | Format-Table 
$EmployeesInEngineering | Format-Table 

$CSVFilePath = "/Users/junio/PowerShell JP/Intermediate-Powershell/7 - JSON FILES/Employees.csv"
$CSVData = Import-Csv -Path $CSVFilePath

# Now we will convert the csv data to json format
$CSVData | ConvertTo-Json | Out-File -FilePath "/Users/junio/PowerShell JP/Intermediate-Powershell/7 - JSON FILES/TestExport.json"

$WebURI = "https://www.apicountries.com/countries"
$WebRequest = Invoke-WebRequest -Uri $WebURI -Method Get
$CountryData = $WebRequest.Content | ConvertFrom-Json | ConvertTo-Json depth 10

$CountryData | Where-Object nativeName -eq "Canada"













