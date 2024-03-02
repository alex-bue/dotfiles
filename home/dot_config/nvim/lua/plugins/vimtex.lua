return {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex_mappings_prefix = 'l'  -- Change the local leader for vimtex
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_compiler_method = 'latexmk'
  end,
}

