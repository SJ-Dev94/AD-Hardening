###
# Find a user with a weird primary group? Use this to change it back to domain user group.
# Will likely break GPO Perms 
###

$group = get-adgroup "Domain Users" -properties @("primaryGroupToken")
get-aduser "Guest" | set-aduser -replace @{primaryGroupID=$group.primaryGroupToken}


Get-ADUser -Filter * -Properties PrimaryGroup | Where-Object { $_.PrimaryGroup -ne (Get-ADGroup -Identity "Domain Users").DistinguishedName } 