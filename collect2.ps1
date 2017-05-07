Collect 'TheName' 'OutputFilePath' { param ($CP)

    Write-Output 'In script block8'

    Write-Output $CP.GlobalParams.VarName

    Write-Output (& $CP.Utility 'XYZ')
}
