# Installation

This repository should be cloned into *$XDG_CONFIG_HOME/xmobar*. For example:

```sh
git clone git@github.com:illia-shkroba/xmobar-config.git "$XDG_CONFIG_HOME/xmobar"
```

After cloning continue with the installation of [GHCup](https://www.haskell.org/ghcup/):

```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

`ghcup tui` command could be used to install `stack` tool in order to build this project. The
project could be built with the following command:

```sh
stack build
```

The `xmobar` binary could be copied to *~/.local/bin/* with this command:

```sh
stack --local-bin-path ~/.local/bin/ install
```
