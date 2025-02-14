{ config, lib, pkgs, ... }:{
  users.users.tressa = {
    description = "Tressa Danvers";
    extraGroups = [ "wheel" "networkmanager" ];
    home = "/home/tressa";
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
