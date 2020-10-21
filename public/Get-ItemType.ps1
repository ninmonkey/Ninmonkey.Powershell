
function Get-ItemType {
    <#
    .SYNOPSIS
    Like Get-ChildItem except you select a list of file types

    .DESCRIPTION
        initial version: doesn't AC from cur directory
    .PARAMETER Filetype
    Parameter description
    .EXAMPLE
    .

    .NOTES
        todo:

        - [ ] autocomplete filetypes
        - [  ] files in '.git/*' return a type as 'no extension'
        - [  ] detect types based on current path
        - [  ] -PassThru -ListTypes
            make it return an actual list


    #>
    [CmdletBinding()]
    param (
        [Parameter(
            HelpMessage = "Base path to search, else current directory")]
        [Alias('PSPath')]
        [string]$Path = '.',

        [Parameter(
            Mandatory, Position = 0,
            ParameterSetName = "getSelectedTypes",
            HelpMessage = "types to find")]
        [ValidateSet('.code-workspace', '.gitignore', '.json', '.lnk', '.md', '.png', '.ps1', '.psd1', '.vscode')]
        [string[]]$Filetype,

        [Parameter(HelpMessage = "Include files without extensions, for example 'LISCENSE'")][switch]$IncludeNoExtension,

        [Parameter(
            Mandatory, ParameterSetName = 'ListTypes',
            HelpMessage = "Show number of each file type")]
        [switch]$ListTypes
    )

    begin {
        # $PSBoundParameters | Write-Debug
        $IgnoreDir = @(
            '\.git\' # todo: configurabhle dirs
        )
    }

    Process {
        $RootPath = Get-Item -ea Stop $Path
        Switch ($PSCmdlet.ParameterSetName) {
            'ListTypes' {

                $splat_gci = @{
                    File    = $true
                    Force   = $true
                    Recurse = $true
                    Path    = $RootPath
                }

                $query = Get-ChildItem @splat_gci
                | Where-Object {
                    $_.FullName -notmatch [regex]::Escape( '\.git\' )
                }
                if (! $IncludeNoExtension) {
                    $query = $query | Where-Object {
                        -not [string]::IsNullOrWhiteSpace( $_.Extension )
                    }
                }


                $query | Group-Object Extension | Sort-Object Count -Descending
                break

            }
            default { throw "set NYI: $($PSCmdlet.ParameterSetName)" }
        }

    }
}
