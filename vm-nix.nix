{ config, pkgs, ... }:

{
  imports = [ ];

  networking.hostName = "vm-nix";
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;

  users.users.root.openssh.authorizedKeys.keys = [
    "<SSHKEY>"
  ];

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  system.stateVersion = "24.05";

  environment.systemPackages = with pkgs; [
    git
    neovim
    htop
    curl
  ];

  # Se quiser desktop: 
  # services.xserver.enable = true;
  # services.xserver.windowManager.qtile.enable = true;
}
