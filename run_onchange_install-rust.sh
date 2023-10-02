#!/bin/sh -e
# Install rustup
curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain stable -y

export PATH="$HOME/.cargo/bin:$PATH"

# Install tools
RUSTC_WRAPPER="" cargo install sccache --locked
cargo install cargo-binstall
cargo binstall -y \
	rbw \
	ripgrep \
	starship \
	fd-find \
	lsd
#cargo install kanidm_tools --version '1.1.0-beta.13'
cargo install helix-term --git https://github.com/helix-editor/helix

# Setup helix
mkdir -p ~/.config/helix
cp -rf ~/.cargo/git/checkouts/helix-*/*/runtime/ ~/.config/helix/
hx --grammar fetch && hx --grammar build
