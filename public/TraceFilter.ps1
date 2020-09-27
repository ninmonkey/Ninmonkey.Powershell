function Format-TraceCommand {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0, HelpMessage = "ScriptBlock to run")]
        [scriptblock]$Expression
    )

    $regex = @{
        'trace' = '^.*tion: 0 :'
    }
    $TraceScript = {
        # Trace-Command -Name ParameterBinding -PSHost -Verbose -Expression { $null | Join-String -sep ', ' }
        Trace-Command -Name ParameterBinding -PSHost -Verbose -Expression $Expression
    }

    $runspace = [PowerShell]::Create([InitialSessionState]::CreateDefault2())
    $StdOut = $runspace.AddScript( $TraceScript ).Invoke()
    $runspace.Streams.Debug | ForEach-Object {
        $_ -replace $regex.trace, ''
    }
}


Get-ChildItem -Path . | ForEach-Object {
    $_.FullName
}

Format-TraceCommand { Get-Item '.' }