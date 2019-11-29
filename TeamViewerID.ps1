#Author: PapyrusCompendium
#Description: Help find TeamViewer IDs from computer names.

function GetCLICredential {
    $username = Read-Host -Prompt "Username"
    $password = Read-Host -Prompt "Password" -AsSecureString
    return New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
}

$adCreds = GetCLICredential
for(;;)
{
    $computerName = Read-Host -Prompt "Computer Name"
    $wmiObject = Get-WmiObject -List StdRegProv -ComputerName $computerName -Credential $adCreds
    "ID: $($wmiObject.GetDWORDValue(2147483650, "SOFTWARE\WOW6432Node\TeamViewer", "ClientID").uValue)"
    "Version: $($wmiObject.GetStringValue(2147483650, "SOFTWARE\WOW6432Node\TeamViewer", "Version").sValue)"
}
