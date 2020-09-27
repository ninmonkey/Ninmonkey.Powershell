# see also: https://www.powershellgallery.com/packages/Indented.Net.IP/6.1.0/Content/Indented.Net.IP.psm1
# $Env:UserProfile:\Documents\PowerShell\Modules\Indented.Net.IP\6.1.0

$private = @(
    # 'ConvertToNetwork'
)

foreach ($file in $private) {
    . ("{0}\private\{1}.ps1" -f $PSScriptRoot, $file)
}

$public = @(
    'Join-Hashtable'
    'Compare-FormatCulture'
    'ConvertTo-Culture'
)

foreach ($file in $public) {
    . ("{0}\public\{1}.ps1" -f $PSScriptRoot, $file)
}

$functionsToExport = @(
    'Join-Hashtable'
    'Compare-FormatCulture'
    'ConvertTo-Culture'
)
Export-ModuleMember -Function $functionsToExport
