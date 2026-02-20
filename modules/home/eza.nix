# eza home config
# Provides eza configuration
# Feel free to add, remove and modify anything here

{ ... }: {
  programs.eza = {
    enable = true;
    enableAliases = true;
  };
}