# Code Snippets - PowerShell Grundlagen CrashKurs IV

# Provider anzeigen
Get-PSProvider

# Hilfe zu PsProvidern anzeigen
Get-Help * -Category provider
Get-Help Registry
Get-Help about_providers

# PowerShell Laufwerke anzeigen
Get-PSDrive

# PowerShell Provider Dateisystem
Get-PSDrive -PSProvider FileSystem

# PowerShell Provider Registry
Get-PSProvider -PSProvider Registry

# Provider Typen anzeigen
$prov = Get-PSProvider -PSProvider FileSystem
$prov.Capabilities
$prov.ImplementingType



# PsDrive CmdLets
Get-Command -Noun 'PsDrive'
Get-PSDrive
Get-PSDrive -PSProvider FileSystem

# Laufwerk verbinden persistent (nur DateiSystem auf Remote machine)
New-PSDrive -Name Z -PSProvider FileSystem -Root \\<NetBIOS Name RemoteMachine>\<ShareName> -Persist -Scope Global

# temp. Laufwerk verbinden zu einem Registry-Pfad
New-PSDrive -Name Wow6432 -PSProvider Registry -Root HKLM:\SOFTWARE\Wow6432Node -ErrorAction SilentlyContinue

# Laufwerk entfernen
Remove-PsDrive -Name Z -Force



# Item enabled PsProvider CmdLets

Test-Path -Path .\AppSphere\ScriptRunnerSvc\General -IsValid

Get-Item -Path .\AppSphere\ScriptRunnerSvc\General

Get-ChildItem -Path .\AppSphere\ScriptRunnerSvc\General

# Alias für ein Execuatable anlegen
Set-Item -Path Alias:np -Value C:\Windows\notepad.exe

# Alias entfernen
Clear-Item -Path Alias:np -Force

# Datei mit Standardeditor öffnen
Invoke-Item -Path Z:\git\ActionPacks\ActiveDirectory\Users\Add-ADUsersToGroups.ps1



# Container Enabled CmdLets
<#
    Get-ChildItem
    Copy-Item
    New-Item
    Remove-Item
    Rename-Item
    Convert-Path
#>

# In string konvertieren
Convert-Path -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\AppSphere ScriptRunnerSvc'
Convert-Path -Path ~
Convert-Path -Path .

# Get-Item vs Convert-Path
(Convert-Path -Path .).GetType()

(Get-Item -Path .).GetType()

# Verzeichnis erstellen
New-Item -Path C:\Test -ItemType Directory -Force

# Verzeichnis löschen
Remove-Item -Path C:\Test -Force

# Existenz von Verzeichnissen, Datei, etc. prüfen
Test-Path C:\Test

# Umbenennen von Verzeichnissen, Dateien, etc.
Rename-Item -Path C:\Test -NewName 'Test2' -Force

# Verzeichnisse rekursiv kopieren
Copy-Item -Path Z:\git -Destination C:\Test -Container -Recurse -Force
Copy-Item -Path Z:\git -Destination C:\Test -Recurse -Force

# Verzeichnisse rekursiv löschen
Remove-Item -Path C:\Test\ActionPacks -Recurse -Force



# Navigation-Enabled Providers  
<#
    Join-Path
    Move-Item
#>

# Verzeichnisse verschieben
Move-Item -Path C:\Test\git -Destination C:\Test2 -Force

# Content cmdlets
<#
    Add-Content
    Clear-Content
    Get-Content
    Set-Content
#>


Get-Content -Path C:\Git\ScriptRunner\ActionPacks\README.md

Get-Content -Path C:\Git\ScriptRunner\ActionPacks\README.md | Set-Content -Path C:\readme2.md

Get-Content -Path C:\readme2.md
 
Clear-Content -Path C:\readme2.md

Set-Content -Path C:\readme2.md -Value 'Test 123' -Force


Get-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\AppSphere ScriptRunnerSvc' -Name UninstallString





$item = Get-Item -Path 'C:\TEMP\log.txt'
$item | Get-ItemProperty -Name Length

