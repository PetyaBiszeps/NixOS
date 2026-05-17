# NVF Options module
# Provides general Neovim editor options

{ ... }: {
  programs.nvf.settings.vim = {
    options = {
      wrap = false;
      number = true;
      tabstop = 2;
      scrolloff = 8;
      expandtab = true;
      shiftwidth = 2;
      cursorline = true;
      signcolumn = "yes";
      softtabstop = 2;
      colorcolumn = "120";
      sidescrolloff = 8;
      relativenumber = true;
    };
  };
}
