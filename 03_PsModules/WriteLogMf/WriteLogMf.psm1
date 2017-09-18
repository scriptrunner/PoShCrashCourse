
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


$script:SeverityLevel = 'INFO'

function Set-SeverityLevel {
    param(
        [ValidateSet('INFO','WARNING','ERROR','FATAL','DEBUG')]
        [string]$Level = 'Info'
    )

    $script:SeverityLevel = $Level
}

function  Get-SeverityLevel  {
    Get-Variable -Scope Script -Name SeverityLevel -ValueOnly
}

$script:SeverityLevel = 'INFO'
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
    switch ($script:SeverityLevel) {
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


Export-ModuleMember -Function 'Write-Log', 'Set-SeverityLevel', 'Get-SeverityLevel'

