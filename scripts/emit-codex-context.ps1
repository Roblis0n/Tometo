# Read a Codex lifecycle event from stdin and emit this installed skill's body.
$ErrorActionPreference = 'Stop'
$utf8 = [System.Text.UTF8Encoding]::new($false, $true)
[Console]::InputEncoding = $utf8
[Console]::OutputEncoding = $utf8

try {
    try {
        $eventData = ConvertFrom-Json -InputObject ([Console]::In.ReadToEnd()) -ErrorAction Stop
    } catch {
        throw 'Could not read a Codex hook event from stdin.'
    }

    $eventName = [string]$eventData.hook_event_name
    if (@('UserPromptSubmit', 'SessionStart', 'SubagentStart') -cnotcontains $eventName) {
        throw 'Unexpected Codex hook event.'
    }

    $skillDirectory = [System.IO.Path]::GetDirectoryName($PSScriptRoot)
    $skillFile = [System.IO.Path]::Combine($skillDirectory, 'SKILL.md')
    $markdown = [System.IO.File]::ReadAllText($skillFile, $utf8)
    $parts = $markdown -split '(?m)^---[ \t]*\r?$', 3
    if ($parts.Count -ne 3 -or $parts[0].Length -ne 0 -or [string]::IsNullOrWhiteSpace($parts[2])) {
        throw 'The installed SKILL.md has no readable body after its front matter.'
    }

    $context = $parts[2].Trim() + [Environment]::NewLine + [Environment]::NewLine +
        "Resolve relative skill references from this directory: $skillDirectory"
    $response = @{
        hookSpecificOutput = @{
            hookEventName = $eventName
            additionalContext = $context
        }
    }
    [Console]::Out.WriteLine((ConvertTo-Json -InputObject $response -Depth 3 -Compress))
} catch {
    [Console]::Error.WriteLine('tometo: ' + $_.Exception.Message)
    exit 1
}
