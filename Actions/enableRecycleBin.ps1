#Enables Recylce bin on AD
#User calling the script must be a member of schema admins for this to work.
#You must change target.domain parameter to the correct domain for this to function!
Enable-ADOptionalFeature -Identity 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target 'target.domain'