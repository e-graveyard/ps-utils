#Set Variables
$Office365Username = "admin@domain.com"
$Office365Password = "SUPER_SECRET_PASSWORD"

#Get Office365 Credentials
#$Office365credentials = Get-Credential
$SecureOffice365Password = ConvertTo-SecureString -AsPlainText $Office365Password -Force
$Office365Credentials = New-Object System.Management.Automation.PSCredential $Office365Username, $SecureOffice365Password

#Create remote Powershell session
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Office365credentials -Authentication Basic –AllowRedirection

#Import the session
Import-PSSession $Session -AllowClobber | Out-Null

#Give MailBox Permissions to Admin.
Add-MailboxPermission -Identity "User One" -User admin.account -AccessRights FullAccess -InheritanceType All

#Remove the Session.
Get-PSSession | Remove-PSSession
