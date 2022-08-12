function findDESAccounts{
    Get-ADUser -Filter {UserAccountControl -band 0x200000} | Export-Csv -Path .\desEnabledAccounts.csv
}

findDESAccounts