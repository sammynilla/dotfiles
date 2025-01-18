# remove default powershell cruft
Remove-Item alias:cls
Remove-Item alias:erase
Remove-Item alias:set

# file utilities
Remove-Item alias:move
Function touch { New-Item "$args" -ItemType File }
Remove-Item alias:md
Function mkdir { New-Item "$args" -ItemType Directory }
Function sha256 { Get-FileHash -Path $args }

# directory utilities
Remove-Item alias:dir
Remove-Item alias:pwd
Function pwd { (Get-ChildItem).Directory.FullName }

# navigation utilities
Function e. { explorer . }
Function ..  { Set-Location -Path .. }
Function dev { Set-Location -Path "c:\dev-tools\bin" }
Function xdg { Set-Location -Path $env:XDG_CONFIG_HOME }

# tools and utilities
Function nvim {
  $app_path = "c:\dev-tools\bin\nvim_msvc.cmd"
  & $app_path $args
}
Function glog { git log --oneline --all --graph --decorate }
