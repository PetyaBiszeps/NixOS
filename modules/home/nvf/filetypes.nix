# NVF Filetypes module
# Provides filetype-specific settings for NVF configuration

{ ... }: {
  programs.nvf.settings.vim.luaConfigRC.filetypes = ''
    vim.filetype.add({
      extension = {
        ash = "ash",
        dash = "dash",
        gotmpl = "gotmpl",
        mdx = "mdx",
        shtml = "shtml",
        htm = "htm",
      },
      pattern = {
        [".*%.tsx"] = "typescript.tsx",
        [".*%.jsx"] = "javascript.jsx",
      },
    })
  '';
}
