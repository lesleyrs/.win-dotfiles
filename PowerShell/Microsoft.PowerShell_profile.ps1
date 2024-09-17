Set-PSReadLineKeyHandler -Key 'Ctrl+q' -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key 'Ctrl+e' -Function EndOfLine
Set-PSReadLineKeyHandler -Key 'Ctrl+k' -Function KillLine
Set-PSReadLineKeyHandler -Key 'Ctrl+u' -Function BackwardKillLine
Set-PSReadLineKeyHandler -Key 'Alt+Backspace' -Function BackwardKillWord

Set-Alias nv nvim -Force
Set-Alias l ls

Set-Alias gc GitClone -Force
Set-Alias gp GitPull -Force
Set-Alias c CDDoubleDot
Set-Alias e ExplorerDot
Set-Alias u WingetUpdate
Set-Alias gd GitDiff
Set-Alias gn GitNote
Set-Alias gf GitFix
Set-Alias gs GitStatus
Set-Alias gl GitLogP -Force
Set-Alias time MeasureCmd

function MeasureCmd {
	$script = [ScriptBlock]::Create($args -join ' ')
	Measure-Command { & $script }
}

function GitLogP {
	git log -p $args
}

function GitStatus {
	git status $args
}

function GitDiff {
	git status && git diff $args
}

function GitNote {
	git add . && git commit -m "note" && git push
}

function GitFix {
	git add . && git commit -m "fix" && git push
}

function GitPull {
	git pull --rebase
}

function CDDoubleDot {
	cd..
}

function ExplorerDot {
	explorer .
}

function WingetUpdate {
    winget update $args
}

function GitClone {
	git clone $args
}
