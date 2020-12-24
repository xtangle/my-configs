# aliases for encoding and decoding url strings
alias urlencode='python3 -c "import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]))"'

# aliases for pushd and popd
alias pd='pushd'
alias po='popd'

# alias for clearing the terminal
alias cls='printf $(tput clear)'

# aliases for git
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcf='git config'
alias gch='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gf='git fetch'
alias gi='git init'
alias gl='git log'
alias gm='git merge'
alias gp='git push'
alias gpu='git pull'
alias gr='git reset'
alias gre='git remote'
alias gs='git status'
alias gst='git stash'
alias gg='gacp'
alias gsb='git-sync-branches'

# alias for how2
alias h2='how2'

# aliases for shellcheck
alias sc='shellcheck'
alias sca='shellcheck-all'

# alias for lazydocker
alias lzd='lazydocker'
