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

    # configure key keybindings
    bindkey -e                                        # emacs key bindings
    bindkey ' ' magic-space                           # do history expansion on space
    bindkey '^U' backward-kill-line                   # ctrl + U
    bindkey '^[[3;5~' kill-word                       # ctrl + Supr
    bindkey '^[[3~' delete-char                       # delete
    bindkey '^[[1;5C' forward-word                    # ctrl + ->
    bindkey '^[[1;5D' backward-word                   # ctrl + <-
    bindkey '^[[5~' beginning-of-buffer-or-history    # page up
    bindkey '^[[6~' end-of-buffer-or-history          # page down
    bindkey '^[[H' beginning-of-line                  # home
    bindkey '^[[F' end-of-line                        # end
    bindkey '^[[Z' undo                               # shift + tab undo last action
    
    # enable completion features
    autoload -Uz compinit
    compinit -d ~/.cache/zcompdump
    zstyle ':completion:*:*:*:*:*' menu select
    zstyle ':completion:*' auto-description 'specify: %d'
    zstyle ':completion:*' completer _expand _complete
    zstyle ':completion:*' format 'Completing %d'
    zstyle ':completion:*' group-name ' '
    zstyle ':completion:*' list-colors ' '
    zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    zstyle ':completion:*' rehash true
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    zstyle ':completion:*' use-compctl false
    zstyle ':completion:*' verbose true
    zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

    # History configurations
    HISTFILE=~/.zsh_history
    HISTSIZE=1000
    SAVEHIST=2000
    setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
    setopt hist_ignore_dups       # ignore duplicated commands history list
    setopt hist_ignore_space      # ignore commands that start with space
    setopt hist_verify            # show command with history expansion to user before running it
    #setopt share_history         # share command history data

    # open commands in $EDITOR with C-e
    autoload -z edit-command-line
    zle -N edit-command-line
    bindkey "^v" edit-command-line
    
    eval "$(starship init zsh)"

    ${lib.optionalString pkgs.stdenv.hostPlatform.isDarwin ''
      # Enable ALT-C fzf keybinding on Mac
      bindkey 'ć' fzf-cd-widget
    ''}
  '';
  };
}
