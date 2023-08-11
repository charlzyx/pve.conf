rm -rf dnsmaq.conf
rm -rf ./smb
rm -rf ./lxc

mkdir -p ./smb
mkdir -p ./lxc

cp ~/.zshrc .zshrc
cp /etc/dnsmasq.conf dnsmasq.conf
cp /etc/samba/*.conf ./smb/
cp /titan/space/backup/pve/docker-compose.yaml ./docker-compose.yaml
cp /etc/pve/lxc/*.conf ./lxc/

git add .
git commit -m 'auto update'
