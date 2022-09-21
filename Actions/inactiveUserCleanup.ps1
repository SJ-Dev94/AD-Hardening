# !!!!IMPORTANT!!!!! 
#Do not run this without READING & UNDERSTANDING each line, you could inadvertantly tank a domain controller
# !!!!IMPORTANT!!!!! 

$Days = 180
$Time = (Get-Date).Adddays(-($Days))

#DNT (do not touch)is a security group to move all "Mysterious" users that could potentially cause issue on disable so we can filter against this group below. 
$group = Get-ADGroup "DNT"

#GroupFilter english explanation: memberof, not equal to group.distinguishedname. When filtering for user groups, you MUST use the distinguised name making this line necesarry.
# -f is the string operator which takes parameters on the right which is then input on the left, ie: {0}. 
# this takes any number of parameters, say there was group.distinguisedname, group.x, group.y, group x and y would be {1} and {2} respectively
$GroupFilter = 'memberof -ne "{0}"' -f $group.DistinguishedName

#Grabs timestamp, filters results less than time variable listed above
$TimeFilter = {LastLogonTimeStamp -lt $Time}

#Variable to check against enabled accounts, used in Get-ADUser Filter
$isEnabled = { enabled -eq $true }

#Finds GUID of OU "Disabled Computers so you can input it into the $TargetOU varable below"
Get-ADOrganizationalUnit -Filter 'Name -like "Disabled Users"'

#GUID from above
$TargetOU = "INSERT GUID OF OU HERE"

#Gets users filtered by group filter, timefilter, and isenabled, then disabled the account and moves it into the target path which is the "disabled users group"
Get-ADUser -Filter "$GroupFilter -and $TimeFilter -and $isEnabled" | Disable-ADAccount | Move-ADObject -TargetPath $TargetOU

