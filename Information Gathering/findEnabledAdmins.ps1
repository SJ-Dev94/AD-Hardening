function findEnabledAdmins {
    Get-ADGroupMember -Server "fwic.local" -Identity "Domain Admins" -Recursive | Get-ADUser | Select Name, Enabled | Export-Csv -Path .\enabledAdmins.csv

    Get-ADGroupMember -Server "fwic.local" -Identity "Schema Admins" -Recursive | Get-ADUser | Select Name, Enabled | Export-Csv -Path .\schemaAdmins.csv

    Get-ADGroupMember -Server "fwic.local" -Identity "Enterprise Admins" -Recursive | Get-ADUser | Select Name, Enabled | Export-Csv -Path .\enterpriseAdmins.csv
}

findEnabledAdmins