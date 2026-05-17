# NVF health module
# Provides compatibility files for Neovim health checks

{ ... }: {
  xdg.configFile."nvf/init.lua".text = ''
    -- This file is intentionally managed by Home Manager.
    -- NVF generates and loads the real Neovim config from the Nix store.
    --
    -- This stub exists only to satisfy :checkhealth vim.health.
  '';
}
