if vim.g.vscode then
  local vscode = require('vscode-neovim')
  
  -- Define leader key
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- VSCode specific keybindings
  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  -- File Navigation
  map('n', '<leader>ff', function() vscode.call('workbench.action.quickOpen') end)
  map('n', '<leader>sf', function() vscode.call('workbench.action.files.openFile') end)
  map('n', '<leader>sg', function() vscode.call('workbench.action.findInFiles') end)
  map('n', '<leader>sw', function() vscode.call('editor.action.addSelectionToNextFindMatch') end)
  map('n', '<leader>sd', function() vscode.call('workbench.actions.view.problems') end)
  
  -- No highlight search
  map('n', '<leader>h', function() vscode.call('editor.action.clearSearchResults') end)
  
  -- Window Management
  map('n', '<leader>x', function() vscode.call('workbench.action.splitEditorDown') end)
  map('n', '<leader>v', function() vscode.call('workbench.action.splitEditorRight') end)
  
  -- Panel Navigation (Alt + hjkl)
  map('n', '<A-h>', function() vscode.call('workbench.action.navigateLeft') end)
  map('n', '<A-j>', function() vscode.call('workbench.action.navigateDown') end)
  map('n', '<A-k>', function() vscode.call('workbench.action.navigateUp') end)
  map('n', '<A-l>', function() vscode.call('workbench.action.navigateRight') end)
  
  -- LSP equivalents
  map('n', 'gd', function() vscode.call('editor.action.revealDefinition') end)
  map('n', 'gr', function() vscode.call('editor.action.goToReferences') end)
  map('n', 'gI', function() vscode.call('editor.action.goToImplementation') end)
  map('n', '<leader>rn', function() vscode.call('editor.action.rename') end)
  map('n', '<leader>ca', function() vscode.call('editor.action.quickFix') end)
  map('n', 'K', function() vscode.call('editor.action.showHover') end)
  
  -- File Explorer
  map('n', '<C-b>', function() vscode.call('workbench.action.toggleSidebarVisibility') end)
  map('n', '<leader><C-b>', function() vscode.call('workbench.files.action.showActiveFileInExplorer') end)
  
  -- Terminal
  map('n', '<C-n>', function() vscode.call('workbench.action.terminal.toggleTerminal') end)
  
  -- Tab navigation
  map('n', '<C-a>', function() vscode.call('workbench.action.previousEditor') end)
  
  -- File operations
  map('n', '<leader>cp', function() vscode.call('copyFilePath') end)
  
  -- Format document
  map('n', '<leader>f.', function() vscode.call('editor.action.formatDocument') end)
  
  -- Copy to clipboard
  map('v', 'Y', function() vscode.call('editor.action.clipboardCopyAction') end)
  
  -- Cursor movement
  map('n', '<C-d>', '<C-d>zz')
  map('n', '<C-u>', '<C-u>zz')
  
  -- Better line end and start navigation
  map('n', 'H', '^')
  map('n', 'L', '$')
  
  -- Configure which keys VS Code should handle
  vim.g.vscode_use_list = {
    "<C-w>", -- Let VS Code handle window management
    "<C-f>", -- Let VS Code handle find
    "<C-s>", -- Let VS Code handle save
    "<C-b>", -- Let VS Code handle file explorer
  }
end
