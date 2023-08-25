rm -rf ./config
rm -rf ./docker
rm -rf ./lxc
rm -rf ./sftpgo
rm -rf ./dnsmasq
rm -rf ./smb
rm -rf ./systemd
rm -rf ./titan

mkdir -p ./config
mkdir -p ./lxc
mkdir -p ./sftpgo
mkdir -p ./smb
mkdir -p ./systemd
mkdir -p ./scripts
mkdir -p ./titan

cp ~/.zshrc ./config/
cp ~/.config/nvim/init.vim  ./config/
cp /etc/resolv.conf ./config/
cp /etc/network/interfaces ./config/
cp /etc/sysctl.conf ./config/
cp /root/titan/* ./titan/

cp /titan/space/backup/pve/tailup.sh ./scripts/

cp /etc/pve/lxc/*.conf ./lxc/
cp /etc/systemd/system/*.service ./systemd/

git add .
git commit -m 'auto update'
