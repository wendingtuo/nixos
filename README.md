`nix-shell -p git`
`git clone https://github.com/wendingtuo/nix-config.git`
`cd nix-config`
`sudo nixos-rebuild switch --flake .#hostname`
`home-manager switch --flake .#user.hostname`
