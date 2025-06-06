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

    # kubectl
    k = "kubectl";
    kgno = "kubectl get node";
    kdno = "kubectl describe node";
    kgp = "kubectl get pods";
    kep = "kubectl edit pods";
    kdp = "kubectl describe pods";
    kdelp = "kubectl delete pods";
    kgs = "kubectl get svc";
    kes = "kubectl edit svc";
    kds = "kubectl describe svc";
    kdels = "kubectl delete svc";
    kgi = "kubectl get ingress";
    kei = "kubectl edit ingress";
    kdi = "kubectl describe ingress";
    kdeli = "kubectl delete ingress";
    kgns = "kubectl get namespaces";
    kens = "kubectl edit namespace";
    kdns = "kubectl describe namespace";
    kdelns = "kubectl delete namespace";
    kgd = "kubectl get deployment";
    ked = "kubectl edit deployment";
    kdd = "kubectl describe deployment";
    kdeld = "kubectl delete deployment";
    kgsec = "kubectl get secret";
    kdsec = "kubectl describe secret";
    kdelsec = "kubectl delete secret";

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