#Set Variables
$Office365Username = "admin@domain.com"
$Office365Password = "SUPER_SECRET_PASSWORD"

#Get Office365 Credentials
$SecureOffice365Password = ConvertTo-SecureString -AsPlainText $Office365Password -Force
$Office365Credentials = New-Object System.Management.Automation.PSCredential $Office365Username, $SecureOffice365Password

#Create remote Powershell session
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Office365credentials -Authentication Basic –AllowRedirection

#Import the session
Import-PSSession $Session -AllowClobber | Out-Null

#Set Mailbox Forwarding
Set-Mailbox -Identity user.one@domain.com -DeliverToMailboxAndForward $true -ForwardingSMTPAddress "user.one@cname.domain.com"
Set-Mailbox -Identity user.two@domain.com -DeliverToMailboxAndForward $true -ForwardingSMTPAddress "user.two@cname.domain.com"
Set-Mailbox -Identity user.three@domain.com -DeliverToMailboxAndForward $true -ForwardingSMTPAddress "user.three@cname.domain.com"

#Remove the Session.
Get-PSSession | Remove-PSSession
