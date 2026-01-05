mkdir backup
cp -r ~/.config backup/.config
cp ~/.zshrc backup/.zshrc
cp ~/.bashrc backup/.bashrc
cp /etc/pacman.conf backup/pacman.conf
cp -r ~/important backup/important
cp ~/.gitconfig backup/.gitconfig
cp ~/.gitignore backup/.gitignore
cp ~/.ssh backup/.ssh
# from here on this is creating the file to update the system
echo "sudo pacman -Syu --needed reflector
sudo reflector --latest 30 --protocol https --fastest 5 --sort rate --age 12 --save /etc/pacman.d/mirrorlist
cp pacman.conf /etc/pacman.conf
sudo pacman -Syyu --needed $(pacman -Qq | tr '\n' ' ')
cp .config ~/.config
cp .zshrc ~/.zshrc
cp .bashrc ~/.bashrc
cp -r important ~/important
cp .gitconfig ~/.gitconfig
cp .gitignore ~/.gitignore
cp .ssh ~/.ssh
chsh -s $(echo $SHELL)" > backup/zupdate-system.sh
