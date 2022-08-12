function findUnusualPrimaryGroups{
    Get-ADUser -Filter * -Properties PrimaryGroup | Where-Object { $_.PrimaryGroup -ne (Get-ADGroup -Identity "Domain Users").DistinguishedName } | Select-Object UserPrincipalName,PrimaryGroup | Export-Csv -Path .\unusualPrimaryGroups.csv
}

findUnusualPrimaryGroups
