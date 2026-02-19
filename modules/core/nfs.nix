# NFS configuration file
# This file provides NFS setup
# Feel free to add, remove and modify anything here

{ config, lib, ... }:
  let enableNFS = config.variables.enableNFS or false;
in {
  services = {
    rpcbind.enable = enableNFS;
    nfs.server.enable = enableNFS;
  };
}