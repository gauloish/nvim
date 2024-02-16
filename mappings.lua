local M = {}

local options = {
    move = {silent = false, noremap = true},
    copy = {silent = false, noremap = true},
    cut = {silent = false, noremap = true},
    delete = {silent = false, noremap = true},
}

M.move = {
    n = {
        ["<a-h>"] = {[[<c-w>h]], "Move cursor to left window", opts = options.move},
        ["<a-j>"] = {[[<c-w>j]], "Move cursor to down window", opts = options.move},
        ["<a-k>"] = {[[<c-w>k]], "Move cursor to up window", opts = options.move},
        ["<a-l>"] = {[[<c-w>l]], "Move cursor to right window", opts = options.move},
    },
    i = {
        ["<a-h>"] = {[[<Left>]], "Move cursor to left", opts = options.move},
        ["<a-j>"] = {[[<Down>]], "Move cursor to down", opts = options.move},
        ["<a-k>"] = {[[<Up>]], "Move cursor to up", opts = options.move},
        ["<a-l>"] = {[[<Right>]], "Move cursor to right", opts = options.move},
    },
}

M.copy = {
    n = {
        -- Copy Texts
        ["yw"] = {[[mayiw`a]], "Copy a word", opts = options.copy},
        ["ye"] = {[[mayiW`a]], "Copy a expression", opts = options.copy},
        ["yy"] = {[[maVy`a]], "Copy a line", opts = options.copy},
        ["yp"] = {[[mayap`a]], "Copy a paragraph", opts = options.copy},
        -- Copy Partials
        ["yfw"] = {[[maye`a]], "Copy front of word", opts = options.copy},
        ["yfe"] = {[[mayE`a]], "Copy Front of expression", opts = options.copy},
        ["yfl"] = {[[may$`a]], "Copy Front of line", opts = options.copy},
        ["ybw"] = {[[mayb`a]], "Copy Back of word", opts = options.copy},
        ["ybe"] = {[[mayB`a]], "Copy Back of expression", opts = options.copy},
        ["ybl"] = {[[may0`a]], "Copy Back of line", opts = options.copy},
    }
}

M.cut = {
    n = {
        -- Cut Texts
        ["cw"] = {[[wbdw]], "Cut a word", opts = options.cut},
        ["ce"] = {[[WBdW]], "Cut a expression", opts = options.cut},
        ["cc"] = {[[VyVd]], "Cut a line", opts = options.cut},
        ["cp"] = {[[dap]], "Cut a paragraph", opts = options.cut},
        -- Cut Partials
        ["cfw"] = {[[de]], "Cut front of word", opts = options.cut},
        ["cfe"] = {[[dE]], "Cut front of expression", opts = options.cut},
        ["cfl"] = {[[d$]], "Cut front of line", opts = options.cut},
        ["cbw"] = {[[db]], "Cut back of word", opts = options.cut},
        ["cbe"] = {[[dB]], "Cut back of expression", opts = options.cut},
        ["cbl"] = {[[d0]], "Cut back of line", opts = options.cut},
    }
}

M.delete = {
    n = {
        -- Delete Texts
        ["dw"] = {[[wb"_dw]], "Delete a word", opts = options.delete},
        ["de"] = {[[WB"_dW]], "Delete a expression", opts = options.delete},
        ["dd"] = {[[V"_d]], "Delete a line", opts = options.delete},
        ["dp"] = {[["_dap]], "Delete a paragraph", opts = options.delete},
        -- Delete Partials
        ["dfw"] = {[["_de]], "Delete front of word", opts = options.delete},
        ["dfe"] = {[["_dE]], "Delete front of expression", opts = options.delete},
        ["dfl"] = {[["_d$]], "Delete front of line", opts = options.delete},
        ["dbw"] = {[["_db]], "Delete back of word", opts = options.delete},
        ["dbe"] = {[["_dB]], "Delete back of expression", opts = options.delete},
        ["dbl"] = {[["_d0]], "Delete back of line", opts = options.delete},
    }
}

return M
