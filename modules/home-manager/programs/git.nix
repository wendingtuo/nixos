{userConfig, ...}: {
  programs = {
    git = {
      enable = true;
      settings = {
        user.name = userConfig.name;
        user.email = userConfig.email;
        pull.rebase = "true";
        init.defaultBranch = "main";
      };
    };
    # signing = {
    #   key = userConfig.gitKey;
    #   signByDefault = true;
    # };
    delta = {
      enableGitIntegration = true;
      options = {
        keep-plus-minus-markers = true;
        light = false;
        line-numbers = true;
        navigate = true;
        width = 280;
      };
    };
  };

  # Enable catppuccin theming for git delta
  catppuccin.delta.enable = true;
}
