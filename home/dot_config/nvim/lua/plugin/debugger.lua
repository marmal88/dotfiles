-- debuggers
require('dap-python').setup('uv')

-- import icon pack
local icons = require('core.icons')

-- configurations
local dap = require('dap')
local dapui = require('dapui')
local icons = {
	Stopped = { icons.debugger.STOPPED, 'DiagnosticWarn', 'DapStoppedLine' },
	Breakpoint = { icons.debugger.BREAKPOINT, 'DiagnosticInfo', 'DapBreakpoint' },
	BreakpointCondition = { icons.debugger.BREAKPOINT_CONDITION, 'DiagnosticInfo', 'DapBreakpoint' },
	BreakpointRejected = { icons.diagnostics.INFO, 'DiagnosticError' },
	LogPoint = { icons.arrows.right, 'DiagnosticInfo', 'DapLogPoint' },
}
for name, sign in pairs(icons) do
	sign = type(sign) == 'table' and sign or { sign }
	vim.fn.sign_define('Dap' .. name, {
		-- stylua: ignore
		text = sign[1] --[[@as string]] .. ' ',
		texthl = sign[2] or 'DiagnosticInfo',
		linehl = sign[3],
		numhl = sign[3],
	})
end
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
vim.api.nvim_create_user_command("DapCloseUI", function()
	require("dapui").close()
end, {})
vim.keymap.set({ 'n', 'v' }, '<M-e>', function() require('dapui').eval() end)
vim.keymap.set('n', '<F1>', dap.continue)
vim.keymap.set('n', '<F2>', dap.step_into)
vim.keymap.set('n', '<F3>', dap.step_out)
vim.keymap.set('n', '<F4>', dap.step_over)
vim.keymap.set('n', '<F10>', dap.restart)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
vim.keymap.set('n', '<leader>du', dapui.toggle)

return dap, dapui
