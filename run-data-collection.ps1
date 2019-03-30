Set-Variable -Name output -Value "C:\Users\$env:USERNAME\Documents\$env:USERNAME-data"

Write-Host 'Creating new directory...' $output
If (Test-Path -Path $output) { 
    Write-Host "Warning directory already exists!"
    Write-Host "Do you want to override it?"
    Write-Host "Current data will be lost."

    Remove-Item $output -Recurse:$true -Confirm:$true
}

New-Item -Path $output -ItemType Directory

./get-system-info.ps1
./get-path-info.ps1
./get-installed-software.ps1

Write-Host 'Moving files to: ' $output
Move-Item -Path "C:\Users\$env:USERNAME\Documents\$env:USERNAME-system.csv" -Destination "C:\Users\$env:USERNAME\Documents\$env:USERNAME-data"
Move-Item -Path "C:\Users\$env:USERNAME\Documents\$env:USERNAME-path.csv" -Destination "C:\Users\$env:USERNAME\Documents\$env:USERNAME-data"
Move-Item -Path "C:\Users\$env:USERNAME\Documents\$env:USERNAME-tools.csv" -Destination "C:\Users\$env:USERNAME\Documents\$env:USERNAME-data"

Write-Host 'Compressing output...'
Set-Variable -Name zip -Value "$output.zip"
If(Test-path $zip) {Remove-item $zip}
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($output, $zip)

Write-Host 'Cleaning up...'
Remove-Item $output -Recurse:$true -Confirm:$false

Write-Host 'Done!'
Write-Host "Output file: " $zip

Pause
