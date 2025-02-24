#!/bin/bash

# 0. modifica pacman.conf


# 7. Habilitar múltiplos downloads, cores e iLoveCandy no pacman.conf
echo "Habilitando múltiplos downloads, cores e iLoveCandy no pacman.conf..."

# Habilitar múltiplos downloads no pacman.conf
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 15/' /etc/pacman.conf

# Habilitar cores no pacman.conf
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

# Habilitar iLoveCandy no pacman.conf
sudo sed -i 's/#ILoveCandy/ILoveCandy/' /etc/pacman.conf


# 1. Atualizar o sistema
echo "Atualizando o sistema..."

sudo pacman -Syu --noconfirm

# 2. Instalar pacotes normais via pacman
echo "Instalando pacotes normais..."
sudo pacman -S --noconfirm \
        unzip \
    gum \
    rofi \
    wofi \
    unrar \
    okular \
    waybar \
    swww \
    dolphin \
    dolphin-plugins \
    ark \
    firefox \
    loupe \
    xdg-desktop-portal \
    xdg-desktop-portal-gnome \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-hyprland \
    blueman \
    bluedevil \
    xdg-desktop-portal-wlr \
    xdg-user-dirs \
    xdg-user-dirs-gtk \
    xdg-utils \
    archlinux-xdg-menu \
    btop \
    ttf-font-awesome \
    noto-fonts \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-firacode-nerd \
    ttf-jetbrains-mono-nerd \
    swayidle \
    polkit-gnome \
    bash-completion \
    ntfs-3g \
    ffmpegthumbnailer \
    ffmpegthumbs \
    volumeicon \
    pavucontrol \
    pamixer \
    notification-daemon \
    wl-clipboard \
    wayland-utils \
    clinfo \
    alsa-utils \
    imagemagick \
    adw-gtk-theme \
    breeze \
    breeze5 \
    breeze-gtk \
    breeze-icons \
    nwg-look \
    bluez \
    bluez-utils \
    bluez-tools \
    kio \
    kde-cli-tools \
    sddm \
    xorg \
    network-manager-applet \
    exfat-utils \
    btrfs-progs \
    xfsprogs \
    jfsutils \
    f2fs-tools \
    lvm2 \
    zip \
    timeshift \
    lutris \
    reiserfsprogs \
    nilfs-utils \
    udftools \
    e2fsprogs \
    kitty \
    gedit \
    gparted \
    mangohud \
    telegram-desktop \
    discord \
    wine \
    filelight \
    pacman-contrib \
    wine-gecko \
    wine-mono \
    winetricks \
    curl \
    deluge-gtk \
    xorg-xdpyinfo \
    mesa-utils \
    glfw \
    gnome-disk-utility \
    gnome-calendar \
    gnome-calculator \
    ksnip \
    swaync \
    hyprland \
    xorg-server \
    xorg-xinit \
    epapirus-icon-theme\
    unzip \
    gum \
    rofi \
    wofi \
    unrar \
    waybar \
    swww \
    firefox \
    xdg-desktop-portal \
    xdg-desktop-portal-hyprland \
    xdg-user-dirs \
    xdg-utils \
    btop \
    ttf-font-awesome \
    noto-fonts \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-firacode-nerd \
    ttf-jetbrains-mono-nerd \
    swayidle \
    polkit-gnome \
    bash-completion \
    ntfs-3g \
    ffmpegthumbnailer \
    wl-clipboard \
    wayland-utils \
    clinfo \
    alsa-utils \
    imagemagick \
    nwg-look \
    bluez \
    bluez-utils \
    bluez-tools \
    kio \
    sddm \
    xorg \
    exfat-utils \
    btrfs-progs \
    xfsprogs \
    lvm2 \
    zip \
    timeshift \
    lutris \
    steam \
    wine \
    vulkan-icd-loader \
    mesa-demos \
    glfw \
    gimp \
    antimicrox \
    linux-lts-headers \
    linux-zen-headers \
    celluloid \
    mpv \
    vlc \
    android-tools \
    hyprutils \
    hyprland-qtutils \
    qt6-5compat \
    qt6-declarative \
    qt6-svg \
    ksnip \
    swaync \
    hyprland \
    xorg-server \
    xorg-xinit \
    libva \
    libva-nvidia-driver \
    mesa \
    nvidia-dkms \
    nvidia-settings \
    nvidia-utils \
    vulkan-headers \
    vulkan-icd-loader \
    vulkan-tools \
    lib32-nvidia-utils \
    lib32-vulkan-icd-loader \
    flatpak \
    intel-ucode\
    net-tools \
    iproute2 \
    ufw \
    fail2ban \
    rsync \
    borgbackup \
    htop \
    nmon \
    iotop \
    sysstat \
    git \
    python python-pip \
    nodejs npm \
    go rust \
    cups \
    system-config-printer \
    tlp \
    powertop

# 3. Instalar suporte a Flatpak
echo "Instalando o suporte a Flatpak..."
sudo pacman -S --noconfirm flatpak

# 4. Adicionar o repositório Flathub
echo "Adicionando o repositório Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# 5. Instalar pacotes via Flatpak
echo "Instalando pacotes via Flatpak..."
flatpak install flathub org.torproject.torbrowser-launcher \
    org.kde.kdenlive \
    org.mozilla.Thunderbird \
    com.bitwarden.desktop \
    org.gimp.GIMP \
    com.discordapp.Discord \
    com.brave.Browser \
    org.onlyoffice.desktopeditors \
    it.mijorus.gearlever
# Clonar e instalar yay-bin do AUR
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..

# Instala pacotes do AUR
yay -S --noconfirm swayosd-git waypaper hyprswitch qt5ct-kde qt6ct-kde grimblast swaylock-effects wlogout protonup-qt-bin clipman clipse

# Adiciona o usuário aos grupos necessários
sudo usermod -aG wheel $USER
sudo usermod -aG lp $USER

# Atualiza diretórios do xdg
xdg-user-dirs-update

# Configura o Dolphin como gerenciador de arquivos
xdg-mime default org.kde.dolphin.desktop inode/directory

# Habilita serviços
systemctl enable sddm.service
systemctl start user@970.service
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# 6. Limpar pacotes desnecessários
echo "Limpando pacotes desnecessários..."
sudo pacman -Rns $(pacman -Qdtq) --noconfirm




# 6. Configurar GRUB e NVIDIA
echo "Configurando o GRUB e NVIDIA..."

# Adicionar os módulos no GRUB
echo "Adicionando módulos no GRUB..."
echo 'MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)' | sudo tee -a /etc/default/grub > /dev/null

# Adicionar configuração para a NVIDIA no modprobe
echo "Adicionando configuração para a NVIDIA no modprobe..."
echo "options nvidia_drm modeset=1 fbdev=1" | sudo tee -a /etc/modprobe.d/nvidia.conf > /dev/null

# Gerar o initramfs e atualizar o GRUB
echo "Gerando initramfs e atualizando o GRUB..."
sudo mkinitcpio -P &>/dev/null
sudo grub-mkconfig -o /boot/grub/grub.cfg

# 7. Limpar pacotes desnecessários
echo "Limpando pacotes desnecessários..."
sudo pacman -Rns $(pacman -Qdtq) --noconfirm

echo "Instalação concluída!"
