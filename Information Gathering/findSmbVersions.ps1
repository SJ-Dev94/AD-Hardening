function findSmbVersions{
    Get-SmbServerConfiguration | Select EnableSMB1Protocol | Export-Csv -Path .\smbVersion1csv

    Get-SmbServerConfiguration | Select EnableSMB2Protocol | Export-Csv -Path .\smbVersion2.csv
}

findSmbVersions