#Author: PapyrusCompendium
#Description: Help find Dell Service tags from remote machine.

$adCreds = Get-Credential
for(;;)
{
    $computerName = Read-Host -Prompt "Computer Name"
    (Get-WmiObject -Class win32_bios -ComputerName $computerName -Credential $adCreds).SerialNumber
}
