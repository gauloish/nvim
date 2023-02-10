--------------- General Commands ----------------

require("interface")

-- Change Mode

command("Visual", "normal! v")

command("Insert", "normal! i")
command("Append", "normal! a")

command("Replace", "normal! R")

-- Change Style Separators

--command('Round', 'lua ChangeStyleSeparators("round")')
--command('Slant', 'lua ChangeStyleSeparators("slant")')
--command('Arrow', 'lua ChangeStyleSeparators("arrow")')
--command('Blank', 'lua ChangeStyleSeparators("blank")')

-- Open Help

cabbrev("help", "vertical help")
