#All credit goes to https://gist.github.com/IISResetMe/399a75cfccabc1a17d0cc3b5ae29f3aa#file-update-msexchstoragegroupschema-ps1
#Works like a charm

#TLDR - Removes POSSuperComputer vulnerability by destroying MSExchangeStorage group schemas.
#CVE-2021-34470
#https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34470

param(
  [switch]$Force
)

if(-not $Force){
  Write-Warning "This will cripple Exchange-related schema entries"
  Write-Warning "DO NOT run this if you have an active Exchange organization in the current forest"
  Write-Warning "Instead, apply the latest Exchange Server CU from Microsoft"
  Write-Warning "If you've already removed all Exchange Server installations from the forest, go ahead and run this script with '-Force'"
  return
}

# Discover schema NC
$rootDSE = Get-ADRootDSE
$schemaNC = $rootDSE.schemaNamingContext

# Discover schema master
$schemaMaster = Get-ADObject $schemaNC -Properties fSMORoleOwner | Get-ADDomainController -Identity { $_.fSMORoleOwner }

# Re-bind against RootDSE on schema master
$rootDSE = [ADSI]::new("LDAP://$($schemaMaster.HostName)/RootDSE")

# Prepare to refresh the schema!!!
$schemaRefresh = {
  $rootDSE.Put("schemaUpdateNow", 1)
  $rootDSE.SetInfo()
}

# Fetch msExchStorageGroup schema object
$schemaObject = Get-ADObject -LDAPFilter '(&(objectClass=classSchema)(lDAPDisplayName=msExchStorageGroup))' -SearchBase $schemaNC

# Update schema object
Set-ADObject -Identity $schemaObject.distinguishedName -Remove @{possSuperiors = 'computer'} -Server $schemaMaster

# Refresh schema
& $schemaRefresh