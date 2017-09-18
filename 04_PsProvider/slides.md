# PsProvider und PsDrives

PowerShell Provider stellen Daten aus bestimmten Datenspeichern in der Windows PowerShell bereit,  
um sie dort anzeigen und bearbeiten zu können.  
Provider stellen die Daten in einem Laufwerk bereit. Auf die Daten kann somit über ein Verzeichnispfad  
zugegriffen werden, wie dies beispielsweise im Dateisystem möglich ist.  
Für die Bearbeitung der Daten können die PowerShell Built-in Cmdlets verwendet werden,  
die der jeweilige Provider unterstützt.

## BUILT-IN PROVIDERS

- Alias Alias: Windows PowerShell aliases
- Certificate Cert: x509 certificates for digital signatures
- Environment Env: Windows environment variables
- FileSystem * File system drives, directories, and files
- Function Function: Windows PowerShell functions
- Registry HKLM:, HKCU: Windows registry
- Variable Variable: Windows PowerShell variables
- WSMan WSMan: WS-Management configuration information

## Provider CmdLets

Die folgenden CmdLets sind für den Zugriff und die Bearbeitung der Daten aller Provider gedacht.  
Diese können für alle Provider in der gleichen Weise benutzt werden.  
Haben Sie gelernt einen Provider zu verwenden, können Sie genauso auch mit allen anderen Provider arbeiten.  

### CHILDITEM

- Get-ChildItem

### CONTENT CMDLETS

- Add-Content
- Clear-Content
- Get-Content
- Set-Content

### ITEM CMDLETS

- Clear-Item
- Copy-Item
- Get-Item
- Invoke-Item
- Move-Item
- New-Item
- Remove-Item
- Rename-Item
- Set-Item

### ITEMPROPERTY CMDLETS

- Clear-ItemProperty
- Copy-ItemProperty
- Get-ItemProperty
- Move-ItemProperty
- New-ItemProperty
- Remove-ItemProperty
- Rename-ItemProperty
- Set-ItemProperty

### LOCATION CMDLETS

- Get-Location
- Pop-Location
- Push-Location
- Set-Location

### PATH CMDLETS

- Join-Path
- Convert-Path
- Split-Path
- Resolve-Path
- Test-Path

### PSDRIVE CMDLETS

- Get-PSDrive
- New-PSDrive
- Remove-PSDrive

## Provider Typen

### 4 BasisTypen

- Drive-Enabled Providers  
    Drive CmdLets

- Item-Enabled Providers  
    Clear-Item  
    Get-Item  
    Set-Item  
    Invoke-Item  
    Test-Path  

- Container-Enabled Providers
    - ChildItem CmdLets:  
        Get-ChildItem  
    - Item CmdLets:  
        Copy-Item  
        New-Item  
        Remove-Item  
        Rename-Item  
        Convert-Path  
        HasChildItem

- Navigation-Enabled Providers  
    Join-Path  
    Get-ParentPath  
    Move-Item  

### 2 Provider Interfaces

- Content-Enabled Providers  
  Implementiert Conent Cmdlets

- Property-Enabled Providers  
   Implementiert PropertyItem Cmdlets


## Links

[PowerShell Documentation](https://docs.microsoft.com/en-us/powershell/)  
[Writing a Windows PowerShell Provider](https://msdn.microsoft.com/en-us/library/ee126192(v=vs.85).aspx)  
