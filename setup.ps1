# enable developer mode or run as admin: Start-Process pwsh -Verb RunAs -ArgumentList "-NoExit -File .\setup.ps1"

$dotfiles = "$env:userprofile\.win-dotfiles"

New-Item -ItemType Junction -Path "$env:userprofile\Documents\PowerShell" -Target "$dotfiles\PowerShell"
New-Item -ItemType Junction -Path "$env:appdata\helix" -Target "$dotfiles\helix"
New-Item -ItemType Junction -Path "$env:appdata\alacritty" -Target "$dotfiles\alacritty"
New-Item -ItemType Junction -Path "$env:localappdata\nvim" -Target "$dotfiles\nvim"
New-Item -ItemType SymbolicLink -Path "$env:appdata\Microsoft\Windows\Start Menu\Programs\Startup\remap.ahk" -Target "$dotfiles\remap.ahk"
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.gitconfig" -Target "$dotfiles\.gitconfig"
New-Item -ItemType SymbolicLink -Path "$env:userprofile\.wezterm.lua" -Target "$dotfiles\.wezterm.lua"
# New-Item -ItemType SymbolicLink -Path "$env:userprofile\bin\fs.ps1" -Target "$dotfiles\fs.ps1"
