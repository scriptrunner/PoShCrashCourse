# WriteLog
# Version: 1.0.0.0

<#
.SYNOPSIS
Write Log messages to the LogFilePath.

.DESCRIPTION
Write Log messages to the LogFilePath. Possible seveity levels are 'INFO','WARNING','ERROR','FATAL' and 'DEBUG'.

.PARAMETER Message
The log message.

.PARAMETER Level
The severity level of the log message.

.PARAMETER LogFilePath
The file path of the log file.

.EXAMPLE
Write-Log -Message 'This is a sample log message.' -LogFilePath 'C:\Temp\log.txt'
2017-06-21 17:24:49.871 [INFO] This is a sample log message.

.NOTES
General notes
#>
Function Write-Log {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Message,
        [ValidateSet('INFO','WARNING','ERROR','FATAL','DEBUG')]
        [String]$Level = "INFO",
        [string]$LogFilePath
    )

    $timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff"
    $line = "$timeStamp [$Level] $Message"
    switch ($script:SeverityLevel:SeverityLevel) {
        'DEBUG' { break }
        'INFO' {  
            if($Level -eq 'DEBUG'){
                exit
            }
            break
        }
        'WARNING' {  
            if(($Level -eq 'DEBUG') -or ($Level -eq 'INFO')){
                exit
            }
            break
        }
        'ERROR' {  
            if(($Level -ne 'ERROR') -or ($Level -ne 'FATAL')){
                exit
            }
            break
        }
        'FATAL' {
            if($Level -ne 'FATAL'){
                exit
            }
            break
        }
    }
    if($LogFilePath) {
        Add-Content -Path $LogFilePath -Value $line -PassThru -Force -ErrorAction SilentlyContinue 
    }
    else {
        Write-Output $line
    }
}

<#
.SYNOPSIS
Set the severity log level.

.DESCRIPTION
Set the severity log level.

.PARAMETER Level
The severity level.Allowed values are 'INFO','WARNING','ERROR','FATAL' and 'DEBUG'.

.EXAMPLE
Set-SeverityLevel -Level 'Error'

.NOTES
General notes
#>
function Set-SeverityLevel {
    param(
        [ValidateSet('INFO','WARNING','ERROR','FATAL','DEBUG')]
        [string]$Level = 'INFO'
    )
    Set-Variable -Scope Script -Name 'SeverityLevel' -Value $Level
}

<#
.SYNOPSIS
Get the severity log level.

.DESCRIPTION
Get the severity log level.

.EXAMPLE
Get-SeverityLevel

.NOTES
General notes
#>
function Get-SeverityLevel {
    Get-Variable -Scope Script -Name 'SeverityLevel' -ValueOnly
}

Set-Variable -Scope Script -Name 'SeverityLevel' -Value 'INFO'
Export-ModuleMember -Function 'Write-Log', 'Get-SeverityLevel', 'Set-SeverityLevel' -Variable 'SeverityLevel'
