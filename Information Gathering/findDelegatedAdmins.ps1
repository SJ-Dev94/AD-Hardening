Get-ADGroupMember "Domain Admins" |
get-aduser -Properties AccountNotDelegated |
Where-Object {
  -not $_.AccountNotDelegated
}