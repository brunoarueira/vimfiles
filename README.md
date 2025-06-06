# Neovim Configuration

This repository contains my personal Neovim configuration, tailored for daily use. It's designed to be functional and efficient, providing a comfortable coding environment.

## Features

*   **Plugin Management:** Uses [LazyVim](https://github.com/LazyVim/LazyVim) for plugin management. Plugin configurations are located under `lua/plugins`.
*   **Custom Theme:** Includes a custom theme (likely located in `lua/config/theme.lua`).
*   **LSP Support:** Configured with [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) for Language Server Protocol support (see `lua/plugins/lsp-zero.lua`).
*   **Treesitter Integration:** Uses [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for improved syntax highlighting and code parsing (see `lua/plugins/treesitter.lua`).
*   **Other Plugins:** Includes configurations for various plugins, such as:
    *   [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) (status line)
    *   [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) (terminal management)
    *   [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim) (headline support)
    *   And many more (see the files within the `lua/plugins/` directory for individual configurations).

## Prerequisites

*   [Neovim](https://neovim.io/) (version 0.8 or higher recommended)
*   [LazyVim](https://github.com/LazyVim/LazyVim)
*   A Nerd Font (for icons in the status line, etc.)

## Installation

1.  Clone this repository to your Neovim configuration directory (usually `~/.config/nvim`):

    ```bash
    git clone <repository_url> ~/.config/nvim
    ```

2.  Install the plugins using LazyVim.  Open Neovim and run:

    ```vim
    :Lazy sync
    ```

## Configuration

*   **`init.lua`:** The main entry point for Neovim configuration.
*   **`lua/config/`:** Contains general settings and configurations (keymaps, options, etc.).
*   **`lua/plugins/`:** Contains individual plugin specifications and configurations for LazyVim.

## Usage

After installation, Neovim should be configured with the settings and plugins defined in this repository.  You can customize the configuration by modifying the files in the `lua/` directory.

## Contributing

Feel free to contribute to this configuration by submitting pull requests.

## Author

Bruno Arueira
