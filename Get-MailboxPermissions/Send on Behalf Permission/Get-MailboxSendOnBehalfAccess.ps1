###########################################################################################################################
###                                                                                                                     ###
###  Script by Terry Munro - http://365Admin.com.au - https://github.com/TeamTerry                                      ###
###  Version 1.0 - 22/12/2016                                                                                           ###
###                                                                                                                     ###
###########################################################################################################################

Import-CSV "c:\scripts\Mailboxes.csv" | 
	foreach {Get-Mailbox -id $_.UPN } | 
	Select Name,DisplayName,GrantSendOnBehalfTo | 
	export-csv -NoTypeInformation c:\scripts\MailboxSendOnBehalfAccess.csv