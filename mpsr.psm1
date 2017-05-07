$Script:globalParams = @{}

function ConfigParam
{
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory = $true, Position = 1)]
        [string] $Value
    )

    $Script:globalParams[$Name] = $Value
}


function DoCollect
{
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $CollectScriptFilePath
    )

    . (Join-Path -Path $PSScriptRoot -ChildPath $CollectScriptFilePath)
}

function Collect
{
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory = $true, Position = 1)]
        [string] $OutputFileName,

        [Parameter(Mandatory = $true, Position = 2)]
        [ScriptBlock] $Script
    )

    $commonParams = @{
        Name           = $Name
        OutputFileName = $OutputFileName
        GlobalParams   = $Script:globalParams
        Utility        = UtilityFunc
    }

    $results = & $Script $commonParams

    $output = $results -join "`n"
    # TODO: Write results to output file.
    Write-Host ('**{0}**' -f $output)
}

function CompleteCollect
{

}

function UtilityFunc
{
    {
        param (
            [Parameter(Mandatory = $true, Position = 0)]
            [string] $P
        )

        'Utility' + $P
    }
}