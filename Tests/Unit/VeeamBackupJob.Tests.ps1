# To run these tests, execute Invoke-Pester in this working directory.

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
$sut = $sut -replace 'ps1','psm1'

Import-Module "$here\$sut" -Force

# Setup scaffolding and stub out dependencies.

Describe "VeeamBackupJob" {
    Context 'Get-TargetResource' {
        It "Returns false if the provided job does not exist" {
            Get-TargetResource -JobName "Bogus job" | Should be $false
        }
        It "Detects the Daily schedule." {}
        It "Detects the Monthly schedule." {}
        It "Detects the Periodic schedule." {}
        It "Detects the Continuous schedule." {}
    }
    Context "Set-TargetResource" {}
    Context "Test-TargetResource" {}
}
