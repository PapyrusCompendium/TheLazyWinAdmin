#Author: PapyrusCompendium
#Description: Find a computer on the domain by IP address.

for(;;)
{
    $deviceIP = Read-Host -Prompt "IP Address"
    if(Get-ADComputer -F {IPv4Address -eq $deviceIP} -Properties *){
        (Get-ADComputer -F {IPv4Address -eq $deviceIP} -Properties *).Name
    } else {
        "No computer found."
    }
}
