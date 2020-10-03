using namespace System.Collections.Generic
function ConvertTo-Culture {
    <#
    .synopsis
        converts objects to string using culture
    .example
        PS> 12.4, 1234567.89, 1003415, 1.000 | ConvertTo-Culture -CultureName 'de-DE'

            12,4
            1234567,89
            1003415
            1
    .example
        PS> 12.4, 1234567.89, 1003415, 1.000 | ConvertTo-Culture -CultureName 'de-DE' -FormatString 'n'

            12,40
            1.234.567,89
            1.003.415,00
            1,00
    #>
    param(
        [Parameter(
            Mandatory, ValueFromPipeline,
            HelpMessage = 'Any object that supports culture arg with .tostring')]
        [object]$InputObject,

        [Parameter(
            Mandatory, Position = 0,
            HelpMessage = 'Value for: Get-Culture -Name'
        )]
        [string]$CultureName,

        [Parameter(
            Position = 1,
            HelpMessage = 'Format String, ex: object.ToString(n")]')]
        [string]$FormatString

    )

    Process {
        if ($null -eq $InputObject) {
            return
        }
        $CultureInstance = Get-Culture -Name $CultureName
        if ($CultureInstance.count -lt 1) {
            throw "No cultures found"
        }
        if ([string]::IsNullOrWhiteSpace($FormatString) ) {
            $InputObject.ToString( $CultureInstance )
        } else {
            $InputObject.ToString( $FormatString, $CultureInstance )
        }
    }
}
