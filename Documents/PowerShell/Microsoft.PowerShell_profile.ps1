oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\zash.omp.json" | Invoke-Expression

Invoke-Expression (&scoop-search --hook)



# directory alias
function ws { cd 'D:\Documents\Workspace' }
function nc { cd "$env:XDG_CONFIG_HOME/nvim"; nvim . } # neovim config

# linux like alias
function touch($file) { "" | Out-File $file -Encoding ASCII }
function la { Get-ChildItem -Path . -Force | Format-Table -AutoSize }
function ll { Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize }

function dotfiles() {
  git --git-dir=$HOME\.dotfiles --work-tree=$HOME @args
}
