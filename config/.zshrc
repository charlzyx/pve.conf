
eval "$(starship init zsh)"

source ~/.bashrc

alias jj="journalctl"
alias jjex="journalctl -ex"
alias jjc="journalctl -exfu"
alias ssc="systemctl"
alias ssd="systemctl | grep dead"
alias sss="systemctl status"
function ssr() {
  set -ex
  systemctl restart $1
  systemctl status $1
  journalctl -exfu $1
}

function cc() {
  pct console $1
}

