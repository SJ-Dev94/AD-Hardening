#this script finds pc's by operating system
#Change the operating system within the quotes of $opSys


$opSys = {OperatingSystem -Like 'Windows 8*'}


Get-ADComputer -Filter "$opSys" -Properties * | FT Name, LastLogonDate -Autosize
