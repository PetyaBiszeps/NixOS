# Avahi mDNS configuration
# Enables network discovery for local services

{ ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
