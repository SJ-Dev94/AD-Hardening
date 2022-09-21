# !!!!IMPORTANT!!!!! 
#Do not run this without READING & UNDERSTANDING each line, you could inadvertantly tank a domain controller
# !!!!IMPORTANT!!!!! 


#Finds AD Computers with last logon of 180 days and then disables them
$Days = 180
$Time = (Get-Date).Adddays(-($Days))
Get-ADComputer -Filter {LastLogonTimeStamp -lt $Time} | Set-ADComputer -Enabled $false 

#Finds GUID of OU "Disabled Computers so you can input it into the $TargetOU varable below"
Get-ADOrganizationalUnit -Filter 'Name -like "Disabled Computers"'

#GUID from above
$TargetOU = "insert guid here"

#Finds disabled computers, moves them to the target OU (which should be "Disabled Computers" )
Get-ADComputer -Filter {(Enabled -eq $False)} | Move-ADObject -TargetPath $TargetOU





