###########################################################################################################################
###                                                                                                                     ###
###  Script by Terry Munro - http://365Admin.com.au - https://github.com/TeamTerry                                      ###
###  Version 1.0 - 22/12/2016                                                                                           ###
###  With inspiration from the following blog posts                                                                     ###
###  http://o365info.com/mailbox-permissions-powershell-commands/                                                       ###
###  http://exchangeserverpro.com/list-users-access-exchange-mailboxes/                                                 ###
###                                                                                                                     ###
###########################################################################################################################

Import-CSV "c:\scripts\Mailboxes.csv" |
 foreach {Get-MailboxPermission -id $_.UPN } |
Where { ($_.IsInherited -eq $False) -and -not ($_.User -like "NT AUTHORITY\SELF") -and -not ($_.User -like '*Discovery Management*') } |
Select Identity, user, AccessRights | Export-Csv -NoTypeInformation C:\scripts\MailboxFullAccess.csv