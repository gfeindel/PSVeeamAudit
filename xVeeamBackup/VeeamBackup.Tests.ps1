# To run these tests, execute Invoke-Pester in this working directory.

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
$sut = $sut -replace 'ps1','psm1'

Import-Module "$here\$sut" -Force

Describe "VeeamBackup" {
    Context 'Get-TargetResource' {
        It "Returns false if the provided job does not exist" {
            Get-TargetResource -JobName "Bogus job" | Should be $false
        }
    }
    Context "Set-TargetResource" {
    }
    Context "Test-TargetResource" {
    }
}
