Get-Date| Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt"
Add-Content "C:\PowerShell\CyberArk Services\output.txt" 'DR'
Get-Service *Ark* | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
Get-CimInstance win32_processor | Measure-Object -Property LoadPercentage -Average | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
Get-CimInstance -ClassName Win32_LogicalDisk | Select-Object -Property DeviceID,@{'Name' = 'FreeSpace (GB)'; Expression= { [int]($_.FreeSpace / 1GB) }} | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append
Add-Content "C:\PowerShell\CyberArk Services\output.txt" 'padr.log'
Get-content -tail 10 "C:\Program Files (x86)\PrivateArk\PADR\Logs\padr.log" | Out-File -FilePath "C:\PowerShell\CyberArk Services\output.txt" -Append