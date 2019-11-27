#Author: PapyrusCompendium
#Description: Help find TeamViewer IDs from computer names.

$adCreds = Get-Credential
for(;;)
{
    $computerName = Read-Host -Prompt "Computer Name"
    $wmiObject = Get-WmiObject -List StdRegProv -ComputerName $computerName -Credential $adCreds
    "ID: $($wmiObject.GetDWORDValue(2147483650, "SOFTWARE\WOW6432Node\TeamViewer", "ClientID").uValue)"
}
