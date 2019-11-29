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
    $wmiObject = Get-WmiObject -List StdRegProv -ComputerName $computerName -Credential $adCreds
    foreach ($item in $wmiObject.EnumKey(2147483650, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall").sNames) {
        $wmiObject.GetStringValue(2147483650, "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$($item)", "DisplayName").sValue
    }

    foreach ($item in $wmiObject.EnumKey(2147483650, "SOFTWARE\Wow6432node\Microsoft\Windows\CurrentVersion\Uninstall").sNames) {
        $wmiObject.GetStringValue(2147483650, "SOFTWARE\Wow6432node\Microsoft\Windows\CurrentVersion\Uninstall\$($item)", "DisplayName").sValue
    }
}
