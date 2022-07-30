local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

local nmap = bind("n", { noremap = false })
local nnoremap = bind("n")
local vnoremap = bind("v")
local xnoremap = bind("x")
local inoremap = bind("i")

nmap("<leader>y", ":StripWhitespace<CR>")
nmap("<leader>w", ":w<CR>")
nnoremap("<CR>", ":noh<CR><CR>")

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ps", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ") })
end)
nnoremap("<C-p>", function()
	require("telescope.builtin").git_files()
end)
nnoremap("<Leader>pf", function()
	require("telescope.builtin").find_files()
end)

nnoremap("<leader>pw", function()
	require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end)
nnoremap("<leader>pb", function()
	require("telescope.builtin").buffers()
end)
nnoremap("<leader>vh", function()
	require("telescope.builtin").help_tags()
end)
nnoremap("<leader>gw", function()
	require("telescope").extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
	require("telescope").extensions.git_worktree.create_git_worktree()
end)
