eval "$(starship init zsh)"

source ~/.bashrc

alias jj="journalctl"
alias jje="journalctl -ex"
alias jjc="journalctl -exfu"
alias sss="systemctl"
function ssr() {
  systemctl restart $1
  systemctl status $1
  journalctl -exfu $1
}
