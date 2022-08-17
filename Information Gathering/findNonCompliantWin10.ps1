#this is broken

$opsyslike = "OperatingSystem -Like 'Windows 10*'"

Get-ADComputer -Filter {"$opsyslike"} -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack,OperatingSystemVersion -Wrap -Auto | Export-Csv C:\Users\Tekdoc\Documents\NonCompliantWin10.csv