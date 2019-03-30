Set-Variable -Name output -Value "C:\Users\$env:USERNAME\Documents\$env:USERNAME-path.csv"
If (Test-Path -Path $output) { Remove-Item $output }
Set-Variable -Name paths -Value $env:Path.Split(';')
foreach ($path in $paths) {
   $path = '"' + $path + '",'
   $path | Out-File -FilePath $output -Append
 }
Write-Host "File location: " $output

