$ErrorActionPreference = "SilentlyContinue"

$PCName = Read-Host -Prompt "Please Enter the PC Name to Purge Profiles Older than 6 Months From"
Write-Host "Profile Cleanup in Progress... This PowerShell Window Will Close upon Completion."

Invoke-Command -ComputerName "$PCName" -ScriptBlock {Get-WMIObject -Class Win32_UserProfile | Where-Object {(!$_.Special) -and ($_.ConvertToDateTime($_.LastUseTime) -lt (Get-Date).AddDays(-180))} | Remove-WmiObject}

Exit