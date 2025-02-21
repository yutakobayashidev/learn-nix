{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  username = "yuta";
in {
  
  imports = [ inputs._1password-shell-plugins.hmModules.default ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # https://developer.1password.com/docs/cli/shell-plugins/nix/
  programs._1password-shell-plugins = {
    # enable 1Password shell plugins for bash, zsh, and fish shell
    enable = true;
    # the specified packages as well as 1Password CLI will be
    # automatically installed and configured to use shell plugins
    plugins = with pkgs; [ gh awscli2 openai ];
  };

  home = {
    username = username;

    # TODO: os specific
    homeDirectory = "/Users/${username}";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "25.05";

    packages = with pkgs; [
      git
      curl
    ];

  };

  programs.home-manager.enable = true;
}