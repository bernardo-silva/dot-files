return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (Root Dir)" },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (Root Dir)" },
    },
  },
}
