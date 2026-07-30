$OutputEncoding = [System.Console]::OutputEncoding = [System.Console]::InputEncoding = [System.Text.Encoding]::UTF8

# --print emits the init script inline instead of a one-line stub that runs a cached
# BOM-less UTF-8 file from disk. PowerShell 5.1 decodes BOM-less files as Windows-1252,
# which corrupts the 'á' in the baked-in exe path and breaks every prompt render.
oh-my-posh init pwsh --config "C:\programs\pc-setup\oh-my-posh-theme.json" --print | Out-String | Invoke-Expression

# oh-my-posh strips a leading blank line for pwsh, so add the padding between
# commands here instead, by wrapping the prompt function it just defined.
$ompPrompt = $function:prompt
function prompt {
    "`n" + (& $ompPrompt)
}