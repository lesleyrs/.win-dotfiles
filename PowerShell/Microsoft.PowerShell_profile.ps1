Set-PSReadLineKeyHandler -Key 'Ctrl+q' -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key 'Ctrl+e' -Function EndOfLine
Set-PSReadLineKeyHandler -Key 'Ctrl+k' -Function KillLine
Set-PSReadLineKeyHandler -Key 'Ctrl+u' -Function BackwardKillLine
# pre-existing Set-PSReadLineKeyHandler -Key 'Alt+d' -Function KillWord
Set-PSReadLineKeyHandler -Key 'Alt+Backspace' -Function BackwardKillWord

Set-Alias nv nvim -Force
Set-Alias vi vim
Set-Alias which where.exe

Set-Alias gc GitClone -Force
Set-Alias gp GitPull -Force
Set-Alias gl GitLog -Force

function wget {
	curl -OL @args
}

function time {
	$script = [ScriptBlock]::Create($args -join ' ')
	Measure-Command { & $script }
}

function gcd {
	git clean -fXdn
}

function glo {
	git log --oneline --graph @args
}

function GitLog {
	git log -p @args
}

function gs {
	git status @args
}

function gd {
	git status && git diff @args
}

function gf {
	git add . && git commit -m @args && git push
}

function GitPull {
	git pull --rebase
}

function GitClone {
	git clone @args
}

function c {
	cd..
}

function e {
	explorer .
}

function u {
    winget update @args
}

function l {
	ls @args -Force
}
