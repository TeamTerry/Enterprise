#######################################################################################################
###                                                                                                 ###
###  Script by Terry Munro - http://365Admin.com.au - https://github.com/TeamTerry                  ###
###  Version 1.0 - 03/01/2017                                                                       ###
###  Enter the custom attribute number and value                                                    ###
###                                                                                                 ###
#######################################################################################################

###	Connect to Exchange Online first
###	Edit the custom attribute number and value and results file name 

Get-Mailbox -ResultSize "unlimited" -Filter 'CustomAttribute1 -eq "CustomAttibute1Value"' | Select name, displayname, alias, UserPrincipalName, PrimarySMTPAddress | export-csv -NoTypeInformation c:\scripts\Results.csv
