###
# Find a user with a weird primary group? Use this to change it back to domain user group.
# Will likely break GPO Perms 
###

$group = get-adgroup "CHANGE ME to the domain user group" -properties @("primaryGroupToken")
get-aduser "CHANGE ME TO USER" | set-aduser -replace @{primaryGroupID=$group.primaryGroupToken}