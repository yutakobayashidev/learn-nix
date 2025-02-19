{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  username = "yuta";
in {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
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