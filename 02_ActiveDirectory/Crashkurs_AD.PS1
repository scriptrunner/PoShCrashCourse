# PowerShell Modul ActiveDirectory installieren


# Client Betriebssysteme Windows 7 .. 10

# Download remote server administration tools (Remoteserver-Verwaltungstools)

# Windows  7    https://www.microsoft.com/de-de/download/details.aspx?id=7887
# Windows  8    https://www.microsoft.com/de-de/download/details.aspx?id=28972
# Windows  8.1  https://www.microsoft.com/de-de/download/details.aspx?id=39296
# Windows 10    https://www.microsoft.com/de-DE/download/details.aspx?id=45520

# Installieren der Remoteserver-Verwaltungstools
# Systemsteuerung -> Programme und Features -> Windows Feature aktivieren
# -> Aktivieren des Remoteserver-Verwaltungstools -> Rollenverwaltungstools -> AD DS- und AD LDS-Tools -> Active Directory-Modul für Windows PowerShell



# Server Betriebssyteme Windows 2012 .. 2016

Get-WindowsFeature | where -Property Name -Value *AD* -like

Install-WindowsFeature -Name RSAT-AD-Powershell -Verbose

# Test if available
Get-Module -ListAvailable | Where-Object -Property Name -Value ActiveDirectory -EQ



Get-Command -Module ActiveDirectory



Get-ADDomain -Current LocalComputer
Get-ADDomain -Current LoggedOnUser


# Domain Controller abfragen
Get-ADDomainController
Get-ADDomainController -Discover -DomainName 'mydomain'
Get-ADDomainController -Discover -DomainName 'mydomain'


Get-ADUser -Filter '*' | Measure-Object

Get-ADComputer -Filter '*'

Get-ADGroup -Filter '*' | Measure-Object

Get-ADGroup -SearchBase 'OU=ETT,OU=DE,DC=xxx,DC=xxx,DC=com' -Filter '(CN -like *User*)'




# AD Filter HowTo
Update-Help

Get-Help about_ActiveDirectory_Filter 


Get-ADObject -Filter 'CN -like "*admin*"'

Get-ADUser -Filter 'CN -like "*admin*"'

Get-ADGroup -Filter 'CN -like "*admin*"'

$adminGroup = Get-ADGroup -Filter 'CN -eq "TestGroup"'

Get-ADGroupMember -Identity $adminGroup -Recursive | measure

# Test AD Group Membership
Function Test-ADGroupMember
{

    [CmdletBinding()]
    Param (
        [parameter(Mandatory = $true)]
        [string]$User,
        [parameter(Mandatory = $true)]
        [string]$Group
    )

    Trap {Return "error"}

    if (
        Get-ADUser -Filter "memberOf -RecursiveMatch '$((Get-ADGroup -Identity $Group).DistinguishedName)'" -SearchBase $((Get-ADUser -Identity $User).DistinguishedName)

    ) {Return 'true'}

    else {Return 'false'}

}


Test-ADGroupMember -User 'testuser' -Group 'testGroup' 



Function Unlock-MyADAccount
{
    Param
    (
        [parameter(Mandatory=$true)][string]$SAMAccount
    )


    $Testees = @(Search-ADAccount -LockedOut)
    foreach($Test in $Testees)
    {
        If ($Test.SamAccountName -eq $SAMAccount)
        {
            Write-Host "Account is locked, unlock ongoing"
            Unlock-ADAccount -Identity $SAMAccount
            $Test2 = Search-ADAccount -LockedOut
            If ($Test2.SamAccountName -eq $SAMAccount)
            {
                Write-Host "Account is still locked, something went wrong!"
            }
            else
            {
                Write-Host "Account unlock successfully."
            }
        }
    }
}


$Firstname = 'Hans'
$Lastname = 'Maier'

$City = 'Ettlingen'
$Company = 'AppSphere AG'
$Department = 'DevOps'
$StreetAddress = 'Ludwig-Erhard-Staße 1'
$maildomain = '@appsphere.com'

New-ADUser -Name "$Firstname $Lastname" -AccountPassword (ConvertTo-SecureString “1qay!QAY” -AsPlainText -Force) -AllowReversiblePasswordEncryption $FALSE -ChangePasswordAtLogon $TRUE -City $City -Company "$Company" -Department "$Department" -EmailAddress "$Firstname.$Lastname$maildomain" -Enabled $TRUE -GivenName "$Firstname" -PasswordNotRequired $FALSE -SamAccountName "$Firstname.$Lastname" -StreetAddress "$StreetAddress" -Surname "$Lastname" -userprincipalname (“$Firstname.$Lastname$userdomain")


$user = Get-ADUser -Filter 'CN -EQ "Hans Maier"'
Set-ADUser -Identity $user 
