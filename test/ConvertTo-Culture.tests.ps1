
BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
    $localCult = Get-Culture
}

Describe "ConvertTo-Culture" {
    It 'Currency: explicit de-DE' {
        $kwargs = @{
            CultureName  = 'de-DE'
            FormatString = 'c'
        }
        12.4 | ConvertTo-Culture @kwargs
        | Should -be '12,40 €'
    }

    It 'Currency: implicit local' {
        $sample = 0.23, 123456, -10
        $formatString = 'c3'
        $expected = $sample | ForEach-Object {
            $_.ToString($formatString)
        }
        $kwargs = @{
            CultureName  = $localCult
            FormatString = $formatString
        }

        $sample | ConvertTo-Culture @kwargs
        | Should -Be $expected
    }

    It 'Currency: explicit de-DE' {
        $kwargs = @{
            CultureName  = 'de-DE'
            FormatString = 'c'
        }
        12.4 | ConvertTo-Culture  @kwargs
        | Should -be '12,40 €'
    }

    It 'Text as Currency "c"' {
        {
            'a' | ConvertTo-Culture -FormatString 'c' -CultureName 'de-DE'
        } | Should -Throw '*overload*ToString*' -Because 'Invalid formatString for text'
    }

    It 'Datetime to "n"' {
        $InputObject = Get-Date
        $kwargs = @{
            CultureName  = 'en-GB'
            FormatString = 'n'
        }
        { $InputObject |  ConvertTo-Culture @kwargs }
        | Should -Throw -Because 'n is not a valid datetime formatter'

        $kwargs['InputObject'] = $InputObject
        { ConvertTo-Culture @kwargs }
        | Should -Throw -Because 'n is not a valid datetime formatter'
    }
}