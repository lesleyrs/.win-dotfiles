# Set-Alias nv nvim -Force
# Set-Alias gu gitui -Force
Set-Alias lg lazygit
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

function GitLogP {
	git log -p
}

function GitStatus {
	git status
}

function GitDiff {
	git status && git diff
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
