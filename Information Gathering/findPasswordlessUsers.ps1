
function findPasswordlessUsers{
    get-adobject -ldapfilter "(&(objectCategory=person)(objectClass=user)(userAccountControl:1.2.840.113556.1.4.803:=32))" -properties userAccountControl
}

findPasswordlessUsers