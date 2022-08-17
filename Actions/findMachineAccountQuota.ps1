#finds the MachineAccountQuota

Get-ADObject -Identity ((Get-ADDomain).distinguishedname) `
             -Properties ms-DS-MachineAccountQuota
