$SID ='ENTER SID HERE'
$SIDObject = New-Object System.Security.Principal.SecurityIdentifier($SID)
$UserObject = $SIDObject.Translate([System.Security.Principal.NTAccount])
Write-Host "Username: " $UserObject.Value