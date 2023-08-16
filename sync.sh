rm -rf ./config
rm -rf ./docker
rm -rf ./lxc
rm -rf ./sftpgo
rm -rf ./dnsmasq
rm -rf ./smb

mkdir -p ./config
mkdir -p ./docker
mkdir -p ./lxc
mkdir -p ./sftpgo
mkdir -p ./dnsmasq
mkdir -p ./smb

cp ~/.zshrc ./config/
cp ~/.config/nvim/init.vim  ./config/
cp /titan/space/backup/pve/tailup.sh ./config/
cp /etc/pve/lxc/*.conf ./lxc/
cp /etc/sftpgo/sftpgo.json ./
cp /etc/dnsmasq.conf ./dnsmasq/dnsmasq.conf
cp /etc/samba/*.conf ./smb/
cp /titan/space/backup/pve/docker-compose.yaml ./docker/docker-compose.yaml

git add .
git commit -m 'auto update'
