# github:nix-ontouchstart/bun

[flake.nix](flake.nix) based on https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/bu/bun/package.nix

```
% nix run github:nix-ontouchstart/bun/aarch64-darwin -- --version
1.4.3

```
```
% nix shell github:nix-ontouchstart/bun/aarch64-darwin
% bun --version
1.4.3
% exit

Saving session...
...copying shared history...
...saving history...truncating history files...
...completed.
% bun
zsh: command not found: bun
```
