#Author: PapyrusCompendium
#Description: Help find Dell Service tags from remote machine.

function GetCLICredential {
    $username = Read-Host -Prompt "Username"
    $password = Read-Host -Prompt "Password" -AsSecureString
    return New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
}

$adCreds = Get-GetCLICredential
for(;;)
{
    $computerName = Read-Host -Prompt "Computer Name"
    (Get-WmiObject -Class win32_bios -ComputerName $computerName -Credential $adCreds).SerialNumber
}
