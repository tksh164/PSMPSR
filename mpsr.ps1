Remove-MOdule -Name 'mpsr' -Force
Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath 'mpsr.psd1')

ConfigParam 'VarName' 'VarValue'

DoCollect 'collect1.ps1'
DoCollect 'collect2.ps1'

CompleteCollect
