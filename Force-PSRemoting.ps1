# Getting the remote host IP or hostname from the user
$TargetMachine = Read-Host "Enter the target machine name or IP"

# Ensures PS-Remoting is enabled locally
Enable-PSRemoting -force

# Trusting everything locally
Set-Item wsman:\localhost\client\trustedhosts -value * -force

# Gets the desired remote credential from the user
$cred = Get-Credential -Message "Enter the credentials to be used on the remote machine"

# WMI method to force enable PS-Remoting on the target machine
Invoke-WmiMethod -ComputerName $TargetMachine -Namespace root\cimv2 -Class Win32_Process -Name Create -Credential $cred -Impersonation 3 -EnableAllPrivileges `
-ArgumentList "powershell Start-Process powershell -Verb runAs -ArgumentList 'Enable-PSRemoting –force'"

#Enters the PS-Session
Enter-PSSession -ComputerName $TargetMachine -Credential $cred

# WMI method to force disable PS-Remoting on the target machine
Invoke-WmiMethod -ComputerName $TargetMachine -Namespace root\cimv2 -Class Win32_Process -Name Create -Credential $cred -Impersonation 3 -EnableAllPrivileges `
-ArgumentList "powershell Start-Process powershell -Verb runAs -ArgumentList 'Disable-PSRemoting –force'"

# Untrusting everything locally
Set-item wsman:\localhost\client\trustedhosts -value "" -force