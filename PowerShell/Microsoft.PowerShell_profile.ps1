Set-Alias nv nvim -Force
Set-Alias gu gitui -Force
Set-Alias lg lazygit
Set-Alias ll eza

Set-Alias gc GitClone -Force
Set-Alias c CDDoubleDot
Set-Alias e ExplorerDot
Set-Alias u WingetUpdate
Set-Alias l EzaALH

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

function EzaALH {
	eza -alh $args
}
