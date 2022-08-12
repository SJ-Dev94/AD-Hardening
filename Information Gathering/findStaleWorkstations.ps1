function findStaleWorkstations{
    Search-ADAccount –AccountInActive –ComputersOnly –TimeSpan 180:00:00:00 –ResultPageSize 2000 –ResultSetSize $null | ?{$_.Enabled –eq $True} | Select-Object Name, SamAccountName, DistinguishedName | Export-Csv -Path .\staleWorkstations.csv
}

findStaleWorkstations