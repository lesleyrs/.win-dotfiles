$dotfiles = "$env:userprofile\.win-dotfiles"

New-Item -ItemType Junction -Path "$env:appdata\helix" -Target "$dotfiles\helix"
New-Item -ItemType Junction -Path "$env:localappdata\nvim" -Target "$dotfiles\nvim"
New-Item -ItemType SymbolicLink -Path "$env:appdata\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk" -Target "$dotfiles\remap.ahk"
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.gitconfig" -Target "$dotfiles\.gitconfig"
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.wezterm.lua" -Target "$dotfiles\.wezterm.lua"

Pause
