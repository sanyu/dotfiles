alias ssh_nofingerprint='ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no"'
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias pf="fzf --preview='bat --style=numbers --color=always --line-range :500 {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
function kgetall {    kubectl api-resources --verbs=list --namespaced -o name | xargs -n1 kubectl get --show-kind --ignore-not-found "$@" }
complete -F __start_kubectl kgetall
