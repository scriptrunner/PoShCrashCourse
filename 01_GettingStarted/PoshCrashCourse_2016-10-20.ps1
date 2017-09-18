<#
    PowerShell Crashkurs 
    
    20.10.2016


    Einführung
    -------------

    - PowerShell 1.0 verfügbar ab Windows Server 2003/Windows XP/Windows Vista, erstmals mit Microsoft Exchange Server 2007

    - PowerShell ist Open Source
        https://github.com/PowerShell/PowerShell

    - PowerShell ist eine Cross Platform Technologie (PowerShell Core basierend auf .NET Core)
        Windows
            Client
            Server 

        Linux
            Ubuntu 14.04 \ 16.04
            CentOs 7.1
            RHEL 7

        MAC OS X
            OS X 10.11

        Docker

        https://github.com/PowerShell/PowerShell/blob/master/docs/installation

    - Aktuelle Version 5.0 (Windows Management Framework 5.0),
      bereits Preview für 6.0 auf GitHub erhältlich
      s
    - Langfristig Ersatz für cmd und VBScript/Windows Scripting Host

    - Kombiniert den aus den UNIX-Shells bekannten Ansatz von Pipes und Filtern
      mit dem Paradigma der objektorientierten Programmierung

    - Verwendung unterschiedlichster Technologien
        - .NET Framework
        - ADSI
        - COM
        - WMI

    Dateiendungen
    --------------
    .ps1 – Windows PowerShell Shell-Skript
    .ps1xml – Windows PowerShell Format- und Typdefinitionen
    .psc1 – Windows PowerShell Konsolendatei (exportierte Shell-Konfiguration)
    .psd1 – Windows PowerShell Datendatei
    .psm1 – Windows PowerShell Moduldatei


#>

# Powershell Version
$PSVersionTable

# PowerShell Host
Get-Host

# Vordefinierte Variablen 
Get-Variable


<#
    Variablen
    ----------

    implizite Deklaration -> Datentyp muss nicht explizit angegeben werden

    $i = '1' 
    $i = $i + 1

    $j = 1
    $j = $j + 1

    $a = Get-Process
$b

    Invoke-Command $b | Select ProcessName -Unique

#>


<#
    CmdLets und Module

    - CmdlLets 
        Konvention für CmdLet Namen:  Verb-Noun

    -Module
        Zusammenfassung von Cmdlets
            - DLL Module
            - Manifest Module
            - Script Module 

    -Aliase    

    - What you see is NOT, what you get!
#>

Get-Verb
Get-Verb | Group-Object -Property Group
Get-Verb | Where-Object -Property Group -EQ -Value Common 

Get-Alias


Get-Module

$env:PSModulePath


<#
    Wie finde ich Hilfe zu Befehlen, Datentypen, etc

    Get-Help about_Core_Commands
    Get-Help about_Logical_Operators

    Get-Help about_Comparison_operators -ShowWindow
    Get-Help about_Operators -ShowWindow
#>

Get-Help
Get-Member
Get-Module
Get-Command



<#
    Pipelines
    ----------

    Selektieren; Messen, Sortieren
    
    Get-Service DPS

    Select-Object
    Where-Object
    Sort-Object
    Measure-Object

    get-service | Where-Object { $_.Status -eq 'Stopped' }

#>


<#
    Strukturen
    -----------
        Arrays
        Hashtables

    Methoden, Properties an Objekten

#>

<#

    Scripting, Funktionen, Verzweigungen, Schleifen

    if
    foreach
    while
    do
    for
    switch

#>




<#

    Find-Module

    Install-Module
#>


<#
$rssUrl = "http://blogs.msdn.com/b/powershell/rss.aspx"
$blog = [xml](New-Object System.Net.WebClient).DownloadString($rssUrl)
$blog.rss.channel.item | select title -First 8
#>