Set-Variable -Name output -Value "C:\Users\$env:USERNAME\Documents\$env:USERNAME-system.csv"
If (Test-Path -Path $output) { Remove-Item $output }
foreach ($key in $PSVersionTable.Keys) {
   $info = '"' + $key + '","' + $PSVersionTable[$key] + '"'
   $info | Out-File -FilePath $output -Append
 }
Write-Host "Out put file location: " $output
