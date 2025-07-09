{
  home.shellAliases = {
    ".." = "cd ..";
    ff = "fastfetch";
    hf = "hyfetch";

    # nixos
    nixvm-up = "sudo nixos-rebuild switch --impure --flake .#nixvm";
    # nixmac-up "sudo nixos-rebuild switch --impure --flake .#nixmac"
    home-up = "home-manager switch --flake";

    # git
    gaa = "git add --all";
    gcam = "git commit --all --message";
    gcl = "git clone";
    gco = "git checkout";
    ggl = "git pull";
    ggp = "git push";

    ld = "lazydocker";
    lg = "lazygit";

    v = "nvim";
    vi = "nvim";
    vim = "nvim";

    ls = "eza --icons always"; # default view
    ll = "eza -bhl --icons --group-directories-first"; # long list
    la = "eza -abhl --icons --group-directories-first"; # all list
    lt = "eza --tree --level=2 --icons"; # tree
  };
}