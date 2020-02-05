Import-Module ActiveDirectory

# is AD User is Locked?

Get-ADUser -Identity "user" -Properties * | Select-Object LockedOut

# AD User Unlock:

Unlock-ADAccount -Identity "user"

# Change Windows password for a domain user with PowerShell:

Set-ADAccountPassword -Identity "user" -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "Passw0rd" -Force)
