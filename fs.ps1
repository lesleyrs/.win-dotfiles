if ($args[0] -eq "-h" -or $args[0] -eq "--help") {
	Write-Host "This is a minimal wrapper for fzf, get it from Winget or https://github.com/junegunn/fzf" -ForegroundColor Yellow
	Write-Host "Edit the default vars in this file, use --no-deps/-n, or pass these in order: root, edit, cat, ls, find"
	Write-Host "Root is the search root, text files are opened with edit, find searches and the others are visuals"
	Write-Host "Paths with spaces in them don't show their previews, thx micro`$oft`n"
    exit
} elseif ($args[0] -eq "-n" -or $args[0] -eq "--no-deps") {
	$root = if ($args[1]) { $args[1] } else { '~' }
	$edit = if ($args[2]) { $args[2] } else { 'notepad' }
	$cat = if ($args[3]) { $args[3] } else { 'cat {}' }
	$ls = if ($args[4]) { $args[4] } else { 'ls {}' }
	$env:FZF_DEFAULT_COMMAND = if ($args[5]) { $args[5] } else { 'dir /s /b' }
} else {
	$root = if ($args[0]) { $args[0] } else { '~' }
	$edit = if ($args[1]) { $args[1] } else { 'hx' }
	$cat = if ($args[2]) { $args[2] } else { 'bat --color=always {}' }
	$ls = if ($args[3]) { $args[3] } else { 'eza -lahF --color=always --group-directories-first {}' }
	$env:FZF_DEFAULT_COMMAND = if ($args[4]) { $args[4] } else { 'fd' }
}

try {
	cd $root
	$path = $PWD
	$env:FZF_DEFAULT_OPTS = "-0 --header='Search root: $PWD' --bind=esc:cancel,shift-left:preview-page-up,shift-right:preview-page-down --preview='if exist {}\ ($ls) else ($cat)'"

	do {
		$path = fzf | Resolve-Path
		
		if ($path -and (Get-Item $path).PSIsContainer) {
			cd $path
		} elseif ($path) {
			switch ([System.IO.Path]::GetExtension($path)) {
				{ $_ -in ".exe",".zip", ".pdf", ".png", ".gif", ".mp3", ".ogg", ".wav", ".ttf", ".svg" } {
					start $path
				}
			    default {
				if ($path) {
					& $edit $path
				}
				}
			} 
			$parent = Split-Path $path -Parent
			if ($parent) {
			    cd (Resolve-Path $parent)
			}
		}
	} while ($path -and (Test-Path (Resolve-Path $path) -PathType Container))
} finally {
	Remove-Item Env:FZF_DEFAULT_OPTS
}
