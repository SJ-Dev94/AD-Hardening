Get-ADUser -Filter {(AdminCount -eq 1) -and (AccountNotDelegated -eq $false)}