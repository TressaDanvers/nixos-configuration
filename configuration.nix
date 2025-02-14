{ config, lib, pkgs, ... }:{
  imports = [ ./hardware-configuration.nix ./users.nix ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      configurationLimit = 2;
      enable = true;
      editor = false;
    };
  };

  environment.systemPackages = [ ];

  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    zsh.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      settings.PermitRootLogin = "yes";
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  time.timeZone = "America/New_York";

  users.users.root.shell = pkgs.zsh;


  system.stateVersion = "24.11";
}
