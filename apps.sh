#!/bin/bash

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
    intel-ucode

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
