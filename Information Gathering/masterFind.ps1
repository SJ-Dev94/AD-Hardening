#Index file for invoking "find functions" used for AD Hardening
#For PSScriptRoot to work, all files must live in the same index as masterFind


. $PSScriptRoot\findDESAccounts.ps1
. $PSScriptRoot\findEnabledAdmins.ps1
. $PSScriptRoot\findInactiveUsers
. $PSScriptRoot\findPasswordlessUsers
. $PSScriptRoot\findSmbVersions
. $PSScriptRoot\findStaleWorkstations
. $PSScriptRoot\findUnusualPrimaryGroups

findDESAccounts
findEnabledAdmins
findInactiveUsers
findPasswordlessUsers
findSmbVersions
findStaleWorkstations
findUnusualPrimaryGroups