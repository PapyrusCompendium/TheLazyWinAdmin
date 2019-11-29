#Author: PapyrusCompendium
#Description: Help find all installed software on a machine.

function GetCLICredential {
    $username = Read-Host -Prompt "Username"
    $password = Read-Host -Prompt "Password" -AsSecureString
    return New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
}

$adCreds = GetCLICredential
for(;;)
{
    $computerName = Read-Host -Prompt "Computer Name"
    Get-WmiObject -Class Win32_Product -ComputerName $computerName -Credential $adCreds | Select-Object Name, Version 
}
