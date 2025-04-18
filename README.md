After NixOS installation, in your `~/` directory:

1. Copy config:
```
git clone git@github.com:wendingtuo/nixos.git
cd ~/nixos/hosts
cp -r nixos <your_hostname>
cd <your_hostname>
cp /etc/nixos/hardware-configuration.nix ./
sudo nixos-rebuild switch --flake ./
home-manager switch --flake ./
```
2. Change `user = "blake";` and `{ hostname = "nixos"; stateVersion = "24.11"; }` lines in `flake.nix` to match your system.

3. Rebuild: 

```
cd nixos
git add .
sudo nixos-rebuild switch --flake .
home-manager switch --flake .
```
