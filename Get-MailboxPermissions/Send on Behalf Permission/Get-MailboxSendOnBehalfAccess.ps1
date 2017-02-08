###########################################################################################################################
###                                                                                                                     ###
###  Script by Terry Munro - http://blog.teamterry.net - https://github.com/TeamTerry/Scripts                           ###
###  Version 1.0 - 22/12/2016                                                                                           ###
###                                                                                                                     ###
###########################################################################################################################

Import-CSV "c:\scripts\Mailboxes.csv" | 
	foreach {Get-Mailbox -id $_.UPN } | 
	Select Name,DisplayName,GrantSendOnBehalfTo | 
	export-csv -NoTypeInformation c:\scripts\MailboxSendOnBehalfAccess.csv