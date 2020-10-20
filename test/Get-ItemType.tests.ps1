BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')

}

Describe "Get-ItemType" {
    It 'List : Defaults' {
        <# test paths
            $DebugPreference = 'Continue'
            Write-Debug  "$PSScriptRoot"
            Write-Debug $MyInvocation.PSScriptRoot
            Get-Item . | Write-Debug
        #>
        $StaticPath = 'C:\Users\cppmo_000\Documents\2020\powershell\MyModules_Github\Ninmonkey.PowerShell\test\testdata\Get-ItemType'
        $BasePath = Get-Item -ea stop $StaticPath
        $query = Get-ItemType -Path $BasePath -ListTypes
        $query.count | Should -Be 1
    }
    It 'List : Include NoExtension' {
        $StaticPath = 'C:\Users\cppmo_000\Documents\2020\powershell\MyModules_Github\Ninmonkey.PowerShell\test\testdata\Get-ItemType'
        # $BasePath = Get-Item -ea stop '.\test\testdata\Get-ItemType\'
        $BasePath = Get-Item -ea stop $StaticPath
        $query = Get-ItemType -Path $BasePath -ListTypes -IncludeNoExtension
        $query.count | Should -Be 2
    }
}
