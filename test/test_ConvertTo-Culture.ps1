
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