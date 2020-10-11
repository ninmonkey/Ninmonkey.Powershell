# Ninmonkey.Powershell

- [Ninmonkey.Powershell](#ninmonkeypowershell)
  - [Culture](#culture)
    - [ConvertTo-Culture](#convertto-culture)
    - [Compare-FormatCulture](#compare-formatculture)
  - [Format Strings](#format-strings)
    - [Search by Category](#search-by-category)


## Culture
### ConvertTo-Culture

```powershell
🐒> $Sample = 12.4, 1234567.89, 1003415, 1.0
>>  $Sample | ConvertTo-Culture 'de-DE'
12,4
1234567,89
1003415
1

🐒> $Sample | ConvertTo-Culture 'de-DE' 'n'
12,40
1.234.567,89
1.003.415,00
1,00

🐒> 
$cultureList = 'en-Us', 'en-GB', 'de-DE'
foreach($cult in $cultureList) {
    Get-Date | ConvertTo-Culture -CultureName $cult -FormatString 'd'
} 

9/27/2020
27/09/2020
27.09.2020
```

### Compare-FormatCulture


```powershell
🐒> $cultureList = 'de-DE', 'en-Us', 'en-GB', 'es-US', 'es-ES'
get-date | Compare-FormatCulture -CultureList $cultureList

Culture Input                Result
------- -----                ------
de-DE   9/27/2020 5:01:45 PM 27.09.2020 17:01:45
en-GB   9/27/2020 5:01:45 PM 27/09/2020 17:01:45
en-US   9/27/2020 5:01:45 PM 9/27/2020 5:01:45 PM
es-ES   9/27/2020 5:01:45 PM 27/09/2020 17:01:45
es-US   9/27/2020 5:01:45 PM 9/27/2020 5:01:45 PM
```

```powershell
🐒> $Sample = 12.4, 12345.89, 1.0
>>  $Sample | Compare-FormatCulture -CultureList 'de-DE', 'en-Us', 'en-GB' | Sort-Object Input

Culture    Input Result
-------    ----- ------
de-DE          1 1
en-GB          1 1
en-US          1 1
de-DE       12.4 12,4
en-GB       12.4 12.4
en-US       12.4 12.4
de-DE   12345.89 12345,89
en-GB   12345.89 12345.89
en-US   12345.89 12345.89
```


## Format Strings

### Search by Category

```powershell
🐒> Get-FormatString StandardNumeric

FormatString     : C
Name             : Currency
SupportedBy      : All numerics
Result           : A currency value
Precision        : Number of Digits
DefaultPrecision : NumberFormatInfo.CurrencyDecimalDigits
Group            : StandardNumeric

FormatString     : D
Name             : Decimal
SupportedBy      : Integer only
Result           : Integer digits with optional negative sign
Precision        : Minimum number of digits
DefaultPrecision : Minimum number of digits *required*
Group            : StandardNumeric

FormatString     : E
Name             : Exponential (Scientific)
SupportedBy      : All numerics
Result           : Exponential Notation
Precision        : Number of decimal digits
DefaultPrecision : 6
Group            : StandardNumeric
# ... continues
```