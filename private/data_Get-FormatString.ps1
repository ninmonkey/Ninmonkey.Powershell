
$_DocUrlMapping = [ordered]@{
    about_OverView      = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/formatting-types'
    StandardNumeric     = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings'
    CustomNumeric       = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-numeric-format-strings'
    StandardDateAndTime = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings'
    CustomDateAndTime   = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings'
    StandardTimeSpan    = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-timespan-format-strings'
    CustomTimeSpan      = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-timespan-format-strings'
    Enum                = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/enumeration-format-strings'
    about_Composite     = 'https://docs.microsoft.com/en-us/dotnet/standard/base-types/composite-formatting'
}

$_DocFormatMeta = @(
    [ordered]@{
        FormatString     = 'C'
        Name             = 'Currency'
        SupportedBy      = 'All numerics'
        Result           = 'A currency value'
        Precision        = 'Number of Digits'
        DefaultPrecision = 'NumberFormatInfo.CurrencyDecimalDigits'
    }

    [ordered]@{
        FormatString     = 'D'
        Name             = 'Decimal'
        SupportedBy      = 'Integer only'
        Result           = 'Integer digits with optional negative sign'
        Precision        = 'Minimum number of digits'
        DefaultPrecision = 'Minimum number of digits *required*'
    }

    [ordered]@{
        FormatString     = 'E'
        Name             = 'Exponential (Scientific)'
        SupportedBy      = 'All numerics'
        Result           = 'Exponential Notation'
        Precision        = 'Number of decimal digits'
        DefaultPrecision = '6'
    }

    [ordered]@{
        FormatString     = 'F'
        Name             = 'Fixed point'
        SupportedBy      = 'All numerics'
        Result           = 'Integral and decimal digits with optional negative sign.'
        Precision        = 'Number of decimal digits'
        DefaultPrecision = 'NumberFormatInfo.NumberDecimalDigits'
    }

    [ordered]@{
        FormatString     = 'G'
        Name             = 'General'
        SupportedBy      = 'All numerics'
        Result           = 'The smaller of either fixed-point or scientific'
        Precision        = 'Number of significant digits'
        DefaultPrecision = '(Depends on the numeric type)'
    }

    [ordered]@{
        FormatString     = 'N'
        Name             = 'Number'
        SupportedBy      = 'All numerics'
        Result           = 'Integral and decimal digits, group separators, and a decimal separator with optional negative sign.'
        Precision        = 'Desired number of decimal places'
        DefaultPrecision = 'NumberFormatInfo.NumberDecimalDigits'
    }

    [ordered]@{
        FormatString     = 'P'
        Name             = 'Percent'
        SupportedBy      = 'All numerics'
        Result           = 'Number multiplied by 100 and displayed with a percent symbol'
        Precision        = 'Desired number of decimal places'
        DefaultPrecision = 'NumberFormatInfo.PercentDecimalDigits'
    }

    [ordered]@{
        FormatString     = 'R'
        Name             = 'Round Trip'
        SupportedBy      = '[Single], [double], [BigInteger]'
        Result           = 'A string that can round-trip to an identical number'
        Precision        = 'Ignored'
        DefaultPrecision = 'Ignored'
    }

    [ordered]@{
        FormatString     = 'X'
        Name             = 'Hexadecimal'
        SupportedBy      = 'Integer only'
        Result           = 'Hexadecimal string displayed (as text)'
        Precision        = 'Number of digits in the result'
        DefaultPrecision = 'Ignored'
    }



) | ForEach-Object {
    $_['Group'] = 'StandardNumeric'
    [pscustomobject]$_
}