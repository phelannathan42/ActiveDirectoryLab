
# ==============================
# Bulk User Creation Script for AD Lab
# ==============================

# Set the default password for all users
$PASSWORD_FOR_USERS = "Password1"

# Load list of names from a text file
$USER_FIRST_LAST_LIST = Get-Content .\names.txt

# Convert the password to a secure string
$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

# Create a new Organizational Unit if it doesn't exist
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '_USERS'")) {
    New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false
}

# Loop through each name and create users
foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
    $username = "$($first.Substring(0,1))$($last)".ToLower()

    Write-Host "Creating user: $username" -ForegroundColor Cyan

    New-ADUser `
        -GivenName $first `
        -Surname $last `
        -Name "$first $last" `
        -DisplayName "$first $last" `
        -UserPrincipalName "$username@adlab.local" `
        -SamAccountName $username `
        -AccountPassword $password `
        -Path "OU=_USERS,DC=adlab,DC=local" `
        -Enabled $true `
        -PasswordNeverExpires $true
}
