#!/bin/sh -e
# Install rustup
curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y

export PATH="$HOME/.cargo/bin:$PATH"

# Install tools
if ! [ -f "$HOME/.cargo/bin/sccache" ]; then
	RUSTC_WRAPPER="" cargo install sccache --locked
fi
if ! [ -f "$HOME/.cargo/bin/cargo-binstall" ]; then
	cargo install cargo-binstall
fi
cargo binstall -y \
	rbw \
	ripgrep \
	starship \
	fd-find \
	lsd
if ! [ -f "$HOME/.cargo/bin/hx" ]; then
	cargo install helix-term --git https://github.com/helix-editor/helix
fi

# Setup helix
mkdir -p ~/.config/helix
cp -rf ~/.cargo/git/checkouts/helix-*/*/runtime/ ~/.config/helix/
hx --grammar fetch && hx --grammar build
