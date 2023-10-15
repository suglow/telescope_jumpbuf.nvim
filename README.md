# telescope_jumpbuf.nvim

Telescope extension provide the results of selecting different buffers in the jumplist

# Installation

### lazy

```lazy
{
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "suglow/telescope_jumpbuf.nvim",
      config = function()
        require("telescope").load_extension("telescope_jumpbuf")
      end,
    },
}
```

### Packer

```lua
use { "nvim-telescope/telescope.nvim" }
use { "suglow/telescope_jumpbuf.nvim" }
```

# Setup and Configuration

```lua
require('telescope').load_extension('telescope_jumpbuf')
```

# Usage
`:Telescope jumpbuf`

