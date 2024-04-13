Set-Alias nv nvim -Force
Set-Alias gu gitui -Force
Set-Alias lg lazygit
Set-Alias l ls

Set-Alias gc GitClone -Force
Set-Alias c CDDoubleDot
Set-Alias e ExplorerDot
Set-Alias u WingetUpdate

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
