$Path = Get-Item -Path "C:\Users\junio\Desktop\Powershell Intermediates\6 - CSV Files\commatest.csv"
# $Content = Get-Content -Path $Path
# $Content

$employeeData = Import-Csv -Path $Path -Delimiter ','

# Employee data is an array type.
$employeeData.GetType()

foreach ($employee in $employeeData) {
    Write-Output "Employee $($employee.Name) is a $($employee.Title) from $($employee.Country)"
}

Get-Service | Select-Object -Property Name,DisplayName,Status,StartType,@{Name="Time";Expression={Get-Date -Format "MM-dd-yyyy hh:mm:ss"}} | Export-Csv -Path "C:\Users\junio\Desktop\Powershell Intermediates\6 - CSV Files\TestExport.csv" -Delimiter ',' -IncludeTypeInformation