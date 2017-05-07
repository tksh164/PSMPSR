Collect 'TheName' 'OutputFilePath' { param ($CP)

    Write-Output $CP

    Write-Output 'In script block5'
    Write-Output 'In script block2'

    Write-Output $CP.GlobalParams.VarName

    Write-Output (& $CP.Utility 'ABC')
}
