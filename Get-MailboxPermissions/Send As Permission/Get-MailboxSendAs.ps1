###########################################################################################################################
###                                                                                                                     ###
###  Script by Terry Munro - http://blog.teamterry.net - https://github.com/TeamTerry/Scripts                           ###
###  Version 1.0 - 22/12/2016                                                                                           ###
###  With inspiration from the following blog posts                                                                     ###
###  http://o365info.com/mailbox-permissions-powershell-commands/                                                       ###
###  http://exchangeserverpro.com/list-users-access-exchange-mailboxes/                                                 ###
###                                                                                                                     ###
###########################################################################################################################

Import-CSV "c:\scripts\Mailboxes.csv" |
 foreach {Get-RecipientPermission -id $_.UPN } |
Where { ($_.IsInherited -eq $False) -and -not ($_.Trustee -like “NT AUTHORITY\SELF”) } |
Select Identity,Trustee,AccessControlType,AccessRights | Export-Csv -NoTypeInformation C:\scripts\MailboxSendAsAccess.csv