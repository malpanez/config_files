<#
    Quick Active Directory snippets
    --------------------------------
    - Requires RSAT / ActiveDirectory module (Windows) or the ADDS tools (Server).
    - Replace every instance of "user" with the actual samAccountName or UPN.
    - Run in a domain-joined PowerShell session with appropriate privileges.
    - PowerShell 3+ auto-loads modules, so ActiveDirectory cmdlets work without an explicit Import-Module.
#>

# Check whether an AD account is currently locked out (LockedOut = True/False)
Get-ADUser -Identity "user" -Properties LockedOut |
    Select-Object Name, SamAccountName, LockedOut

# Unlock an AD account (requires appropriate delegations or domain admin rights)
Unlock-ADAccount -Identity "user"

# Reset a domain user's password and force a new secure string
Set-ADAccountPassword -Identity "user" -Reset `
    -NewPassword (ConvertTo-SecureString -AsPlainText "Passw0rd" -Force)
