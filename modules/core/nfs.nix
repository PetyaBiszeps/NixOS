# NFS configuration file
# This file provides NFS setup
# Feel free to add, remove and modify anything here

{ host, ... }: let inherit (import ../../hosts/${host}/variables.nix) enableNFS; in {
  services = {
    rpcbind.enable = enableNFS;
    nfs.server.enable = enableNFS;
  };
}