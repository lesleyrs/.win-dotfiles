Set-Alias nv nvim -Force
Set-Alias gu gitui -Force
Set-Alias lg lazygit
Set-Alias ll eza

Set-Alias gc Clone -Force
Set-Alias c CDDoubleDot
Set-Alias e ExplorerDot
Set-Alias u WingetUpdate
Set-Alias l EzaALH

function CDDoubleDot {
	cd..
}

function Clone {
	git clone
}

function ExplorerDot {
	explorer .
}

function WingetUpdate {
    winget update
}

function EzaALH {
	eza -alh
}
