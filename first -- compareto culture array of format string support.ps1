hr
$f = Get-ChildItem .. -File | Select-Object -First 1
$deltaTime = (Get-Date) - $f.CreationTime

Label 'c'
$deltaTime | Compare-FormatCulture 'en-US', 'de-DE', 'es-ES' -FormatString 'c'
Label 'g'
$deltaTime | Compare-FormatCulture 'en-US', 'de-DE', 'es-ES' -FormatString 'g'
Label 'G'
$deltaTime | Compare-FormatCulture 'en-US', 'de-DE', 'es-ES' -FormatString 'G'