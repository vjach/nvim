return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    -- Remove or comment this line if you don't want icon support at all
    -- "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      hijack_netrw = true,
      sync_root_with_cwd = true,
      view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      renderer = {
        indent_markers = {
          enable = true, -- 👈 NERDTree-style ├─ └─ tree structure
        },
        icons = {
          webdev_colors = false,
          show = {
            file = false,
            folder = false,
            folder_arrow = false,
            git = false,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "",
              untracked = "",
              deleted = "",
              ignored = "",
            },
          },
        },
      },
    })

    -- Open tree on startup but keep focus on the file
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("nvim-tree.api").tree.open()
        vim.cmd.wincmd("p")
      end,
    })

    -- Optional keymap to toggle file tree without losing focus
    vim.keymap.set("n", "<leader>e", function()
      require("nvim-tree.api").tree.toggle()
      vim.cmd.wincmd("p")
    end, { desc = "Toggle file tree (keep focus in buffer)" })
  end,
}

