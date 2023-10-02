#!/bin/sh -e

# Install bw CLI

# RPM OStree packages
rpm-ostree install --idempotent --assumeyes \
	clang \
	openssl-devel \
	vim \
	systemd-devel \
	pipx \
	golang \
	python3-lsp-server \
	python3-lsp-black \
	kubernetes-client \
	helm

sudo rpm-ostree apply-live --allow-replacement

# Install flatpaks
flatpak remote-add --if-not-exists flathub --user https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user -y --noninteractive \
	com.github.tchx84.Flatseal \
	io.gitlab.librewolf-community \
	org.mozilla.Thunderbird \
	md.obsidian.Obsidian

# Install fonts
mkdir -p ~/.local/share/fonts
if ! [ -d "$HOME/.local/share/fonts/FiraCode" ]; then
	wget -O /tmp/FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
	unzip -d ~/.local/share/fonts/FiraCode /tmp/FiraCode.zip
fi