oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\robbyrussell.omp.json" | Invoke-Expression

# directory alias
function sc { cd 'D:\Documents\School\Năm 4 Kì 1' }
function ws { cd 'D:\Documents\Workspace' }

# Linux like alias
function touch($file) { "" | Out-File $file -Encoding ASCII }
function la { Get-ChildItem -Path . -Force | Format-Table -AutoSize }
function ll { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

