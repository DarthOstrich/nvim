#!/bin/bash
# Utility script to clear Neovim cache and plugin directories (lazy.nvim)
# Usage: Run this script from your nvim config directory

set -e

CACHE_DIR="$HOME/.cache/nvim"
SHARE_DIR="$HOME/.local/share/nvim"

# Remove Neovim cache
if [ -d "$CACHE_DIR" ]; then
  echo "Removing Neovim cache: $CACHE_DIR"
  rm -rf "$CACHE_DIR"
else
  echo "No Neovim cache directory found at $CACHE_DIR"
fi

# Remove lazy.nvim plugin directories
if [ -d "$SHARE_DIR/lazy" ]; then
  echo "Removing lazy.nvim plugin directory: $SHARE_DIR/lazy"
  rm -rf "$SHARE_DIR/lazy"
else
  echo "No lazy.nvim plugin directory found at $SHARE_DIR/lazy"
fi

echo "Neovim cache and lazy.nvim plugins cleared." 