# Nix network module
# Provides basic network configuration
# Feel free to add, remove and modify anything here

{ hostname, pkgs, ... }: {
  networking = {
    # hostName = hostname;
    # timeServers = [
    #   "pool.ntp.org"
    # ];
    dhcpcd.enable = false;
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [22 80 443 59010 59011 8000 8080];
      allowedUDPPorts = [59010 59011];
    };
  };

  environment.systemPackages = with pkgs; [networkmanagerapplet];
}