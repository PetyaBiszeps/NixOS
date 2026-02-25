# Avahi mDNS configuration
# Enables network discovery for local services
# Feel free to add, remove and modify anything here

{ ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}