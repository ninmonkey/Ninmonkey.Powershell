
h1 'section first part'
123456789, 245.667 | ConvertTo-Culture 'pl'

12.4, 12.1232455, 1003415, 1.000 | ConvertTo-Culture -CultureName 'en-us'


hr
h2 'section: test sorting'
$cultureList = 'en', 'pl', 'en-US', 'pl-PL'
, (12.4, 12.1232455) | Compare-FormatCulture $cultureList
| Out-Default
hr

Label 'SortBy: Culture'
12.4, 12.1204 | Compare-FormatCulture $cultureList
| Format-Table
| Out-Default


Label 'SortBy: Input'
12.4, 12.1204 | Compare-FormatCulture $cultureList
| Sort-Object Input |  Format-Table
function Get-NinCulture {
    throw 'NYI'
    # [Parameter(HelpMessage = 'Include all culture results instead of one')][switch]$All
}

h2 'final test: through ConvertTo-Culture'
$finalSamples = 12.4, 1234567.89, 1003415, 1.0

Label 'ConvertTo-Culture' 'de-DE'
$finalSamples | ConvertTo-Culture -CultureName 'de-DE'

Label 'ConvertTo-Culture' 'de-DE, "n"'
$finalSamples | ConvertTo-Culture -CultureName 'de-DE' -FormatString 'n'


h2 'final test: through Compare-FormatCulture'
Label 'Compare-FormatCulture' 'de-DE'
$finalSamples | Compare-FormatCulture -CultureList 'de-DE'

Label 'Compare-FormatCulture' 'de-DE, "n"'
$finalSamples | Compare-FormatCulture -CultureList 'de-DE' -FormatString 'n'
