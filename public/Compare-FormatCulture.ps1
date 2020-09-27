function Compare-FormatCulture {
    <#
    .synopsis
        Compare different formatting results per culture
    .example
        PS> 12.4, 12.1204 | Compare-FormatCulture 'en', 'pl']

            Culture   Input Result
            -------   ----- ------
            en         12.4 12.4
            en      12.1204 12.1204
            pl         12.4 12,4
            pl      12.1204 12,1204

    #>
    param(
        [Parameter(
            Mandatory, ValueFromPipeline
        )]
        [object[]]$InputObject,

        [Parameter(
            Mandatory, Position = 0, HelpMessage = 'list of cultures'
        )]
        [string[]]$CultureList,

        [Parameter(
            Position = 1, HelpMessage = 'ToString() format string'
        )]
        [string]$FormatString
    )

    begin {
        [hashtable]$SortBy = @{}
        $SortBy.Default = (
            @{
                Expression = 'Culture'; Descending = $false
            },
            @{
                Expression = 'Input'; Descending = $false
            }
        )
        # [] list is used so output can be sorted
        $FinalResult = [list[object]]::new()
    }

    Process {
        $InputObject | ForEach-Object {
            $curObject = $_
            $CultureList | ForEach-Object {
                $curCult = $_
                $meta = [ordered]@{
                    Culture = (Get-Culture $curCult).Name
                    Input   = $curObject
                    Result  = $curObject | ConvertTo-Culture -CultureName $curCult
                }
                $FinalResult.Add(
                    ([pscustomobject]$meta)
                )
            }
        }
    }

    end {
        $FinalResult | Sort-Object -Property Culture
    }
}