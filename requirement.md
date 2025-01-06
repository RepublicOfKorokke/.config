# Requirement for this conf

## vivid

https://github.com/sharkdp/vivid

### On Debian-based systems

Download one of the Debian packages from the [release page](https://github.com/sharkdp/vivid/releases)
and install it via `dpkg -i`:

```bash
wget "https://github.com/sharkdp/vivid/releases/download/v0.8.0/vivid_0.8.0_amd64.deb"
sudo dpkg -i vivid_0.8.0_amd64.deb
```

### On macOS

You can install `vivid` from [Homebrew](https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/vivid.rb):

```bash
brew install vivid
```

## FZF

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## tmux

```
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && sudo make install
```

## ripgrep

### Debian-based

```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

### macOS

```
brew install ripgrep
```

## fd

### Debian-based

```
curl -LO https://github.com/sharkdp/fd/releases/download/v8.7.0/fd_8.7.0_amd64.deb
sudo dpkg -i fd_8.7.0_amd64.deb
```

### macOS

```
brew install fd
```
