#replaces ds-MachineAccountQuota with 0
#ds-MachineAccountQuota allows non admin users to add a set amount of pc's to the domain 
#this function should be left to admins, so we set it to 0

Set-ADDomain -Identity <DOMAIN NAME HERE> `
             -Replace @{"ms-DS-MachineAccountQuota"="0"}