{
    It 'Mixed types' {
    <#
            I am not sure what the best way to test this would be
            Maybe count non-terminating errors is the correct value?
        #>
    {
        10, (Get-Date)
        | ConvertTo-Culture -CultureName 'en-GB' -FormatString 'n'
    }
    | Should -Throw -Because 'Mixed Input types with a wrong format string'

}


# It 'Should fail: Invalid format string' {
# 'dsfsd' | ConvertTo-Culture 'de-DE' -FormatString 'x'
# 3 | ConvertTo-Culture 'de-DE' -FormatString 'x'
# 3 | ForEach-Object {
#     $_.ToString('c') | Should -Throw
# }
# | Should -Throw
# }


# 12.4, 1234567.89, 1003415, 1.000 | ForEach-Object { $_.ToString('f3', (Get-Culture 'de-DE')) }
}

<#

Label 'manual'
12.4, 1234567.89, 1003415, 1.000 | ForEach-Object { $_.ToString('n0') }
Label 'lib'
12.4, 1234567.89, 1003415, 1.000 | ConvertTo-Culture -CultureName 'de-DE' -FormatString 'n0'

Label 'Manual'
12.4, 1234567.89, 1003415, 1.000 | ForEach-Object { $_.ToString('f9', (Get-Culture 'de-DE')) }

Label 'lib'
12.4, 1234567.89, 1003415, 1.000 | ConvertTo-Culture -CultureName 'de-DE' -FormatString 'f9'

Label 'Manual'
(Get-Date) | ForEach-Object { $_.ToString('m', (Get-Culture 'de-DE')) }
Label 'lib'
(Get-Date) | ConvertTo-Culture -CultureName 'de-DE' -FormatString 'm'

Label 'Manual'
(Get-Date) | ForEach-Object { $_.ToString('d', (Get-Culture 'de-DE')) }
Label 'lib'
(Get-Date) | ConvertTo-Culture -CultureName 'de-DE' -FormatString 'd'
#>