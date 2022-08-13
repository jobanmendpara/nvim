local keymap = vim.keymap.set

local function forwardChar()
  require('hop').hint_char1({
    direction = require('hop.hint').HintDirection.AFTER_CURSOR,
    current_line_only = true
  })
end

local function backwardChar()
  require('hop').hint_char1({
    direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
    current_line_only = true
  })
end

local function forwardReach()
  require('hop').hint_char1({
    direction = require('hop.hint').HintDirection.AFTER_CURSOR,
    current_line_only = true,
    hint_offset = -1
  })
end

local function backwardReach()
  require('hop').hint_char1({
    direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
    current_line_only = true,
    hint_offset = -1
  })
end

keymap('n', 'f', forwardChar)
keymap('n', 'F', backwardChar)
keymap('n', 't', forwardReach)
keymap('n', 'T', backwardReach)

keymap('v', 'f', forwardChar)
keymap('v', 'F', backwardChar)
keymap('v', 't', forwardReach)
keymap('v', 'T', backwardReach)

keymap('n', 'm', '<cmd>HopChar1<cr>')
keymap('n', 'M', '<cmd>HopChar2<cr>')

keymap('v', 'm', '<cmd>HopChar1<cr>')
keymap('v', 'M', '<cmd>HopChar2<cr>')
keymap('v', '<leader>/w', '<cmd>HopWord<cr>')
keymap('v', '<leader>/l', '<cmd>HopLine<cr>')
keymap('v', '<leader>/p', '<cmd>HopPattern<cr>')
