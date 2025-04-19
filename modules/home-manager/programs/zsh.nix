{
  lib,
  pkgs,
  ...
}: {
  # Zsh shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
    # kubectl auto-complete
    source <(kubectl completion zsh)

    # bindings
    bindkey -e
    bindkey '^H' backward-delete-word
    bindkey '^[[1;5C' forward-word
    bindkey '^[[1;5D' backward-word

    # open commands in $EDITOR with C-e
    autoload -z edit-command-line
    zle -N edit-command-line
    bindkey "^v" edit-command-line

    ${lib.optionalString pkgs.stdenv.hostPlatform.isDarwin ''
      # Enable ALT-C fzf keybinding on Mac
      bindkey 'ć' fzf-cd-widget
    ''}
  '';
  }
}
