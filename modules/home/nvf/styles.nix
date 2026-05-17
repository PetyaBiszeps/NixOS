# NVF Styles module
# Provides custom styles for NVF

{ lib, ... }: {
  programs.nvf.settings.vim.luaConfigRC.ui = lib.mkAfter ''
    -- Global floating window border for Neovim
    pcall(function()
      vim.o.winborder = "rounded"
    end)

    -- Diagnostic floating windows
    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = "if_many",
      },
    })
  '';
}
