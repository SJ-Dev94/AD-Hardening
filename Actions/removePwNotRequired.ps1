###
#if passwordnotrequired flag is enabled, changes all users in the list to require password.
###

$pwNotRequired = Get-ADUser -LDAPFilter "(&(userAccountControl:1.2.840.113556.1.4.803:=32)(!(IsCriticalSystemObject=TRUE)))"
foreach($user in $pwNotRequired )
    {
        Set-ADAccountControl $user -PasswordNotRequired $false
    }
