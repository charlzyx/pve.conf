rm -rf ./config
rm -rf ./docker
rm -rf ./lxc
rm -rf ./sftpgo
rm -rf ./dnsmasq
rm -rf ./smb
rm -rf ./systemd

mkdir -p ./config
mkdir -p ./docker
mkdir -p ./lxc
mkdir -p ./sftpgo
mkdir -p ./dnsmasq
mkdir -p ./smb
mkdir -p ./systemd
mkdir -p ./scripts

cp ~/.zshrc ./config/
cp ~/.config/nvim/init.vim  ./config/
cp /etc/resolv.conf ./config/
cp /etc/network/interfaces ./config/
cp /etc/sysctl.conf ./config/

cp /titan/space/backup/pve/tailup.sh ./scripts/
cp /etc/luxresov.sh ./scripts/

cp /etc/pve/lxc/*.conf ./lxc/
cp /etc/sftpgo/sftpgo.json ./sftpgo/
cp /etc/samba/*.conf ./smb/
cp /titan/space/backup/pve/docker-compose.yaml ./docker/
cp /etc/systemd/system/*.service ./systemd/

git add .
git commit -m 'auto update'
