function Get-FormatString {
    <#
    .SYNOPSIS
        Get the meaning of Format Strings as tables/psco

    .DESCRIPTION
        Undecided if I should  split commandlet into a 'Get-FormatString' vs' 'New-FormatString'
    .EXAMPLE
        PS> Get-FormatString StandardNumeric
        PS> Get-FormatString List
        PS> Get-FormatString

    .NOTES
        future:
            - [ ] parse an existing FormatString, return the meaning
    #>

    param(
        # [Parameter(
        #     HelpMessage = 'nyi: auto open URL of selection, or pipe with Out-Web Or Invoke-DefaultBrowser ? ')]
        # [switch]$Online,

        [parameter(
            Position = 0)]
        [ValidateSet('StandardNumeric', 'List')]
        [string]$Category = 'List'
    )

    switch ($Category) {

        'StandardNumeric' {
            $_DocFormatMeta | Where-Object Group -Match 'StandardNumeric'

            break
        }

        'List' {
            ''
            $_DocFormatMeta.Group
            | Sort-Object -Unique
            | Join-String -sep ", " -OutputPrefix 'DocMeta: Categories: '

            ''
            $_DocUrlMapping.Keys
            | Sort-Object -Unique
            | Join-String -sep ", " -OutputPrefix 'DocUrl: Categories: '
            break

        }

        default {
            $_DocUrlMapping

            "Categories"
            $_DocFormatMeta.Group
            | Sort-Object -Unique

            break
        }
    }
}
