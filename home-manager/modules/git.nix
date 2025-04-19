{
  programs.git = {
    enable = true;
    userName = "blake";
    userEmail = "bh.nixos@iasus.io";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}