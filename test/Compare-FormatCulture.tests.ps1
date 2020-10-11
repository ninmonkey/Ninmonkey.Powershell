
BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Compare-FormatCulture" {
    It 'First' {
        $cultureList = 'en', 'pl', 'en-US', 'pl-PL'
        $result = 1234.5678 | Compare-FormatCulture $cultureList
        | ConvertTo-Json -Compress

        $expected = '[{"Culture":"en","Input":1234.5678,"Result":"1234.5678"},{"Culture":"en-US","Input":1234.5678,"Result":"1234.5678"},{"Culture":"pl","Input":1234.5678,"Result":"1234,5678"},{"Culture":"pl-PL","Input":1234.5678,"Result":"1234,5678"}]'
        $result | Should -Be $expected
    }

    It 'Invalid Month Formatter' {
        { (Get-Date).ToString('q') }
        | Should -Throw -Because 'Invalid datetime formatter'
    }
}
