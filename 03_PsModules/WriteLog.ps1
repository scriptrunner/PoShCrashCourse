
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
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>

$Global:SeverityLevel = 'INFO'
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
    switch ($Global:SeverityLevel) {
        'DEBUG' { break }
        'INFO' {  
            if($Level -eq 'DEBUG'){
                Write-Output $line
                exit
            }
            break
        }
        'WARNING' {  
            if(($Level -eq 'DEBUG') -or ($Level -eq 'INFO')){
                Write-Output $line
                exit
            }
            break
        }
        'ERROR' {  
            if(($Level -ne 'ERROR') -or ($Level -ne 'FATAL')){
                Write-Output $line
                exit
            }
            break
        }
        'FATAL' {
            if($Level -ne 'FATAL'){
                Write-Output $line
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
