{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      dracula-theme.theme-dracula
      redhat.vscode-yaml
      redhat.ansible
      ms-azuretools.vscode-docker
      # ms-kubernetes-tools.vscode-kubernetes-tools
      # ms-vscode-remote.remote-ssh
      # hashicorp.terraform
    # ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    #   {
    #     name = "remote-ssh-edit";
    #     publisher = "ms-vscode-remote";
    #     version = "0.47.2";
    #     sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
    #   }
    ];
  };
}