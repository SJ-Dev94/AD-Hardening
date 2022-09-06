function findEnabledAdmins {
    Get-ADGroupMember -Server "domain here" -Identity "Domain Admins" -Recursive | Get-ADUser | Select Name, Enabled | Export-Csv -Path .\enabledAdmins.csv

    Get-ADGroupMember -Server "domain here" -Identity "Schema Admins" -Recursive | Get-ADUser | Select Name, Enabled | Export-Csv -Path .\schemaAdmins.csv

    Get-ADGroupMember -Server "domain here" -Identity "Enterprise Admins" -Recursive | Get-ADUser | Select Name, Enabled | Export-Csv -Path .\enterpriseAdmins.csv
}

findEnabledAdmins