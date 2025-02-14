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

  documentation.nixos.enable = false;

  environment = {
    gnome.excludePackages = with pkgs; [ gnome-tour gnome-shell-extensions ];
    systemPackages = [ ];
  };

  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  programs = {
    zsh.enable = true;
  };

  services = {
    gnome = {
      core-utilities.enable = false;
    };
    openssh = {
      enable = true;
      settings.PermitRootLogin = "yes";
    };
    pipewire = {
      alsa = {
        enable = true;
        support32Bit = true;
      };
      enable = true;
      pulse.enable = true;
    };
    xserver = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      enable = true;
      excludePackages = with pkgs; [ xterm ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  time.timeZone = "America/New_York";

  users.users.root.shell = pkgs.zsh;


  system.stateVersion = "24.11";
}
