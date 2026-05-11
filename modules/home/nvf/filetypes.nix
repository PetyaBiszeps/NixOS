# NVF Filetypes module
# Provides filetype-specific settings for NVF configuration
# Be careful modifying this file, as it can break your NVF health

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
