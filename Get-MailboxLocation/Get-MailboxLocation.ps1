#######################################################################################################
###                                                                                                 ###
###  Script by Terry Munro - http://blog.teamterry.net - https://github.com/TeamTerry/Scripts       ###
###  Version 1.0 - 20/12/2016                                                                       ###
###                                                                                                 ###
#######################################################################################################

Import-CSV "c:\scripts\MailboxLocation.csv" | 
	foreach {Get-Mailbox -id $_.UPN } | 
	Select Name,DisplayName,PrimarySMTPAddress,Database,ArchiveDatabase,OriginatingServer,OrganizationID | 
	export-csv -NoTypeInformation c:\scripts\MailboxLocationPreMove-Results.csv