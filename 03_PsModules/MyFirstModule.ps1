<#  PowerShell Modules
                
    · Was ist ein PowerShell Modul?
    · Warum werden PowerShell Module verwendet?
    · Arten von PowerShell Modulen
        o   Skript Module
        o   Manifest Module
        o   Binäre Module
        o   Dynamic Module
    · Die PowerShellGallery und PowerShellGet
    · Eigene Module schreiben und verwenden
    · Live Coding-Beispiele

#>
<#  What is a PowerShell module?
    A module is a package that contains Windows PowerShell commands, such as cmdlets, providers,
    functions, workflows, variables, and aliases.

#>
<#  Why should I use PowerShell modules?
    You can easily decide whether to create a module by answering the following questions while writing a script:

    - Will the code I'm writing need to be used more than once?
    - Does this code essentially manage a single object or entity?
    - As I write this code, do I find that I'm breaking it apart into functions because it's getting too complex to be in a single script?
    - Do I need to share the code with others?

    If you answered yes to at least three of these four questions, it's a good bet you should be writing a module instead of a PS1 script.
    - See more at: http://www.tomsitpro.com/articles/powershell-modules,2-846.html#sthash.WfFAB85t.dpuf

#>
<#  Module auto-loading
    Module Auto-Loading Beginning in Windows PowerShell 3.0, Windows PowerShell imports modules
    automatically the first time that you run any command in an installed module. You can now use
    the commands in a module without any set-up or profile configuration, so there's no need to
    manage modules after you install them on your computer.

#>
<#  Explicite module loading
    -
#>
<#  Different kinds of PowerShell modules

    - Script Modules   --  PSM1 files that typically contain mostly functions, but can contain any valid PowerShell code.
    - Manifest Modules --  Script modules that contain a manifest.
    - Binary Modules   --  Compiled DLL files typically not created by IT pros; these are usually left up to developers.
    - Dynamic Modules  --  Modules that are never written to disk and are only available in memory.

    Each module serves specific purposes, but the module type you'll be creating will most likely be script modules.
    Script modules don't require knowledge of C# or the compilation process, and they are the most common,
    especially among IT pros.
    - See more at: http://www.tomsitpro.com/articles/powershell-modules,2-846.html#sthash.WfFAB85t.dpuf

#>
<#  Get installed modules
    - Modules loaded to the current session

        Get-Module

    - List of all installed modules

        Get-Module -ListAvailable

    - PsModulePath

        $env:PsModulePath -split ';'

#>
<#  How to install a module
    - Create a Modules directory for the current user if one does not exist.
   
        New-Item -Type Directory -Path $home\Documents\WindowsPowerShell\Modules -Force

    - Copy the entire module folder into the Modules directory.
        e.g.
        Copy-Item -Path C:\Git\ScriptRunner\Internal\PoShCrashCourse\03_PsModules\WriteLog -Destination $home\Documents\WindowsPowerShell\Modules

        Get-ChildItem -Path $home\Documents\WindowsPowerShell\Modules

#>
<#  Install module from PsGallery

    Get-Command -Module PowerShellGet

    Find-Module -Name PSScriptAnalyzer

    Install-Module -Name PSScriptAnalyzer -Force

    Update-Module -Name Psscriptanalyzer


#>
<#  How to import a module
    You might have to import a module or import a module file. Importing is required when a module is not installed
    in the locations specified by the PSModulePath environment variable ($env:PSModulePath), or the module
    consists of file, such as a .dll or .psm1 file, instead of typical module that is delivered as a folder.

    You might also choose to import a module so that you can use the parameters of the Import-Module command,
    such as the Prefix parameter, which adds a distinctive prefix to the noun names of all imported commands,
    or the NoClobber parameter, which prevents the module from adding commands that would hide or replace
    existing commands in the session.

    Import-Module C:\Git\ScriptRunner\Internal\PoShCrashCourse\03_PsModules\WriteLog\WriteLog.psm1

#>
<#  How to remove a module from the current session

    Remove-Module -Name WriteLog 

#>
<#  How to import a module into every session

        Description	                | Path
        ---                         | ---
        Current user, Current Host	| $Home\Documents\WindowsPowerShell\Profile.ps1
        Current User, All Hosts	    | $Home\Documents\Profile.ps1
        All Users, Current Host	    | $PsHome\Microsoft.PowerShell_profile.ps1
        All Users, All Hosts	    | $PsHome\Profile.ps1

        
        Get-Content -Path $profile

        Add-Content -Value 'Import-Module C:\Git\ScriptRunner\Internal\PoShCrashCourse\03_PsModules\WriteLog\WriteLog.psm1' -Path $profile

#>
<#  How to create a script module based on a script file

    Code sample

#>
<#  Manifest module
    
    New-ModuleManifest -Path C:\Git\ScriptRunner\Internal\PoShCrashCourse\03_PsModules\WriteLogMf\WriteLogMf.psd1

    Test-ModuleManifest -Path C:\Git\ScriptRunner\Internal\PoShCrashCourse\03_PsModules\WriteLogMf\WriteLogMf.psd1

    Code sample

#>