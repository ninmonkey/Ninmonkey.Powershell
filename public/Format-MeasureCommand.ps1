using namespace System.Collections.Generic

function Format-Results {
    <#
    .Description
        Nicely format results of multiple Measure-Commands

    output:

        Id TotalSec TotalMs    Test
        -- -------- -------    ----
        2   10.541  10541.370 standard array
        1    0.303    302.691 pipeline array
        0    0.292    292.105 List[string]

    #>
    param(
        [Parameter(Mandatory, HelpMessage = "Hashtable of Measure-Command results")]
        [hashtable]$results
    )
    throw "NYI: Format-Results"
    $id = 0
    $results.Keys | ForEach-Object {
        $key = $_
        [pscustomobject][ordered]@{
            Test       = $key
            TotalMs    = '{0,10:f3}' -f $results.$key.TotalMilliseconds
            TotalMsRaw = $results.$key.TotalMilliseconds
            TotalSec   = '{0,8:f3}' -f $results.$key.TotalSeconds
            Id         = $id++
        }
    } | Sort-Object TotalMsRaw -Descending
    | Format-Table Id, TotalSec, TotalMs, Test
}

if ($false) {
    # to be testing

    $results = [ordered]@{}
    $ls_all = Get-ChildItem ~ -Depth 4

    $results['standard array'] = Measure-Command {
        $FilesImages = @()
        $ls_all | ForEach-Object {
            if ($_.Extension -match 'png|jpg') {
                $FilesImages += $_
            }
        }
    }

    $results['pipeline array'] = Measure-Command {
        $FilesImages = $ls_all | ForEach-Object {
            if ($_.Extension -match 'png|jpg') {
                $_
            }
        }
    }

    # at this scale ( ~17k adds ) it's almost equal to implicit pipes,
    # even with: [list[string]]::new($FilesImages.Count)
    $results['List[string]'] = Measure-Command {
        $ImageNames = [List[string]]::new()
        $ls_all | ForEach-Object {
            if ($_.Extension -match 'png|jpg') {
                $ImageNames.Add($_)
            }
        } | Out-Null
    }


    "Of {0:n0} files, {1:n0} matched" -f $ls_all.Count, $FilesImages.Count | Write-Host -ForegroundColor Green
    Format-Results -results $results

    "Pipeline was {0:f2} times faster than standard array" -f ( $results['standard array'] / $results['pipeline array']) | Write-Host -ForegroundColor Red
}