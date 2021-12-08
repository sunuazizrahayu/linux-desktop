# Manjaro XFCE
My Manjaro XFCE Config

```
# Enable AUR
# https://forum.manjaro.org/t/enable-aur-using-command-line/79107
sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf

# Set Mirror & Upgrade
# https://linuxhint.com/change-manjaro-mirrors-list/
sudo pacman-mirrors --country Indonesia && sudo pacman -Syyu

# Instal Docker
sudo pacman -S bash-completion docker docker-compose

# Enable Docker
sudo systemctl start docker; sudo systemctl enable docker; sudo usermod -aG docker $USER

# Instal some software
sudo pacman -S go firefox-developer-edition
sudo pamac build sublime-text-4 goland goland-jre postman-bin

# Configuration
git clone https://github.com/mpmont/ci-snippets.git ~/.config/sublime-text/Packages/ci-snippets
git clone https://github.com/filipelinhares/vuejs-snippets-sublime.git ~/.config/sublime-text/Packages/vuejs-snippets-sublime
git clone https://github.com/supercomputra/SF-Mono-Font.git ~/.fonts/SF-Mono-Font


```
