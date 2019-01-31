Set-Variable -Name output -Value "C:\Users\$env:USERNAME\Documents\$env:USERNAME-tools.csv"
If (Test-Path -Path $output) { Remove-Item $output }
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property DisplayName, DisplayVersion | Export-Csv -Path $output -Append -NoTypeInformation
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object -Property DisplayName, DisplayVersion | Export-Csv -Path $output -Append -NoTypeInformation
Write-Host "Output file location: " + $output
