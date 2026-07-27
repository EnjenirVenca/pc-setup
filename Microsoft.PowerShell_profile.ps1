$OutputEncoding = [System.Console]::OutputEncoding = [System.Console]::InputEncoding = [System.Text.Encoding]::UTF8

oh-my-posh init pwsh --config "C:\programs\pc-setup\oh-my-posh-theme.json" | Invoke-Expression

# oh-my-posh strips a leading blank line for pwsh, so add the padding between
# commands here instead, by wrapping the prompt function it just defined.
$ompPrompt = $function:prompt
function prompt {
    "`n" + (& $ompPrompt)
}
