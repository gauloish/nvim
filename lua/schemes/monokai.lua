require('interface')

local ground = ''
local colors = {}

local manager = {}

manager.terminal = function()
	varglobal('terminal_color_0', colors[2])
	varglobal('terminal_color_1', colors[12])
	varglobal('terminal_color_2', colors[15])
	varglobal('terminal_color_3', colors[14])
	varglobal('terminal_color_4', colors[10])
	varglobal('terminal_color_5', colors[16])
	varglobal('terminal_color_6', colors[9])
	varglobal('terminal_color_7', colors[6])
	varglobal('terminal_color_8', colors[4])
	varglobal('terminal_color_9', colors[12])
	varglobal('terminal_color_10', colors[15])
	varglobal('terminal_color_11', colors[14])
	varglobal('terminal_color_12', colors[10])
	varglobal('terminal_color_13', colors[16])
	varglobal('terminal_color_14', colors[8])
	varglobal('terminal_color_15', colors[7])
end

manager.init = function(variat)
	execute('syntax reset')
	execute('highlight clear')

	ground = get('background')

	colors = require('schemes/palettes/monokai').palette(ground, variat)

	manager.terminal()

	varglobal('colors_name', 'monokai')
end

manager.load = function(module)
	local groups

	if module == 'syntax' then
		groups = {
			Type =           {fg = colors[9], bg = colors.none, style = colors.none},
			StorageClass =   {fg = colors[8], bg = colors.none, style = colors.none},
			Structure =      {fg = colors[4], bg = colors.none, style = colors.none},
			Constant =       {fg = colors[16], bg = colors.none, style = colors.none},
			Character =      {fg = colors[14], bg = colors.none, style = colors.none},
			Number =         {fg = colors[16], bg = colors.none, style = colors.none},
			Boolean =        {fg = colors[16], bg = colors.none, style = colors.none},
			Float =          {fg = colors[16], bg = colors.none, style = colors.none},
			Statement =      {fg = colors[8], bg = colors.none, style = colors.none},
			Label =          {fg = colors[16], bg = colors.none, style = colors.none},
			Operator =       {fg = colors[12], bg = colors.none, style = colors.none},
			Exception =      {fg = colors[16], bg = colors.none, style = colors.none},
			PreProc =        {fg = colors[8], bg = colors.none, style = colors.none},
			Include =        {fg = colors[16], bg = colors.none, style = colors.none},
			Define =         {fg = colors[16], bg = colors.none, style = colors.none},
			Macro =          {fg = colors[5], bg = colors.none, style = colors.none},
			Typedef =        {fg = colors[8], bg = colors.none, style = colors.none},
			PreCondit =      {fg = colors[14], bg = colors.none, style = colors.none},
			Special =        {fg = colors[13], bg = colors.none, style = colors.none},
			SpecialChar =    {fg = colors[14], bg = colors.none, style = colors.none},
			Tag =            {fg = colors[5], bg = colors.none, style = colors.none},
			Delimiter =      {fg = colors[7], bg = colors.none, style = colors.none},
			SpecialComment = {fg = colors[9], bg = colors.none, style = colors.none},
			Debug =          {fg = colors[12], bg = colors.none, style = colors.none},
			Underlined =     {fg = colors[15], bg = colors.none, style = 'underline'},
			Ignore =         {fg = colors[2], bg = colors.none, style = colors.none},
			Error =          {fg = colors[12], bg = colors.none, style = 'bold,underline'},
			Todo =           {fg = colors[14], bg = colors.none, style = 'bold,italic'},
			Conceal =        {fg = colors.none, bg = colors[1], style = colors.none},
			Comment =		 {fg = colors[4], bg = colors.none, style = colors.none},
			Conditional =	 {fg = colors[8], bg = colors.none, style = colors.none},
			Keyword =		 {fg = colors[12], bg = colors.none, style = colors.none},
			Repeat =	     {fg = colors[12], bg = colors.none, style = colors.none},
			Function =		 {fg = colors[9], bg = colors.none, style = colors.none},
			Identifier =	 {fg = colors[15], bg = colors.none, style = colors.none},
			String =		 {fg = colors[14], bg = colors.none, style = colors.none},
			MatchParen =	 {fg = colors[7], bg = colors.none, style = colors.none},

			htmlLink = {fg = colors[15], bg = colors.none, style = 'underline'},
			htmlH1 =   {fg = colors[9], bg = colors.none, style = 'bold'},
			htmlH2 =   {fg = colors[12], bg = colors.none, style = 'bold'},
			htmlH3 =   {fg = colors[15], bg = colors.none, style = 'bold'},
			htmlH4 =   {fg = colors[16], bg = colors.none, style = 'bold'},
			htmlH5 =   {fg = colors[10], bg = colors.none, style = 'bold'},
			markdownH1 = {fg = colors[9], bg = colors.none, style = 'bold'},
			markdownH2 = {fg = colors[12], bg = colors.none, style = 'bold'},
			markdownH3 = {fg = colors[15], bg = colors.none, style = 'bold'},
			markdownH1Delimiter = {fg = colors[4], bg = colors.none, style = colors.none},
			markdownH2Delimiter = {fg = colors[4], bg = colors.none, style = colors.none},
			markdownH3Delimiter = {fg = colors[4], bg = colors.none, style = colors.none},
		}

		return groups
	end

	if module == 'editor' then
		groups = {
			Normal =		   {fg = colors[5], bg = colors[1], style = colors.none},
			NormalFloat =      {fg = colors[5], bg = colors[2], style = colors.none},
			FloatBorder =      {fg = colors[5], bg = colors[2], style = colors.none},
			ColorColumn =      {fg = colors.none, bg = colors[2], style = colors.none},
			Conceal =          {fg = colors[2], bg = colors.none, style = colors.none},
			Cursor =           {fg = colors[5], bg = colors.none, style = 'reverse'},
			CursorIM =         {fg = colors[6], bg = colors.none, style = 'reverse'},
			Directory =        {fg = colors[8], bg = colors.none , style = colors.none},
			DiffAdd =          {fg = colors[15], bg = colors.none, style = 'reverse'},
			DiffChange =       {fg = colors[14], bg = colors.none, style = 'reverse'},
			DiffDelete =       {fg = colors[12], bg = colors.none, style = 'reverse'},
			DiffText =         {fg = colors[16], bg = colors.none, style = 'reverse'},
			EndOfBuffer =      {fg = colors[2], bg = colors.none, style = colors.none},
			ErrorMsg =         {fg = colors.none, bg = colors.none, style = colors.none},
			Folded =           {fg = colors[4], bg = colors.none, style = 'italic'},
			FoldColumn =       {fg = colors[8], bg = colors.none, style = colors.none},
			IncSearch =        {fg = colors[7], bg = colors[11], style = colors.none},
			LineNr =           {fg = colors[4], bg = colors.none, style = colors.none},
			CursorLineNr =     {fg = colors[5], bg = colors.none, style = colors.none},
			MatchParen =       {fg = colors[16], bg = colors.none, style = 'bold'},
			ModeMsg =          {fg = colors[5], bg = colors.none, style = colors.none},
			MoreMsg =          {fg = colors[5], bg = colors.none, style = colors.none},
			NonText =          {fg = colors[2], bg = colors.none, style = colors.none},
			Pmenu =            {fg = colors[5], bg = colors[2], style = colors.none},
			PmenuSel =         {fg = colors[6], bg = colors[3], style = colors.none},
			PmenuSbar =        {fg = colors[5], bg = colors[2], style = colors.none},
			PmenuThumb =       {fg = colors[5], bg = colors[2], style = colors.none},
			Question =         {fg = colors[15], bg = colors.none, style = colors.none},
			QuickFixLine =     {fg = colors[5], bg = colors.none, style = 'reverse'},
			qfLineNr =         {fg = colors[5], bg = colors.none, style = 'reverse'},
			Search =           {fg = colors[11], bg = colors[7], style = 'reverse'},
			SignColumn =	   {fg = colors[5], bg = colors[1], style = colors.none},
			SpecialKey =       {fg = colors[10], bg = colors.none, style = colors.none},
			SpellBad =         {fg = colors[12], bg = colors.none, style = 'italic,undercurl'},
			SpellCap =         {fg = colors[8], bg = colors.none, style = 'italic,undercurl'},
			SpellLocal =       {fg = colors[9], bg = colors.none, style = 'italic,undercurl'},
			SpellRare =        {fg = colors[10], bg = colors.none, style = 'italic,undercurl'},
			StatusLine =       {fg = colors[5], bg = colors[3], style = colors.none},
			StatusLineNC =     {fg = colors[5], bg = colors[2], style = colors.none},
			StatusLineTerm =   {fg = colors[5], bg = colors[3], style = colors.none},
			StatusLineTermNC = {fg = colors[5], bg = colors[2], style = colors.none},
			TabLineFill =      {fg = colors[5], bg = colors.none, style = colors.none},
			TablineSel =       {fg = colors[2], bg = colors[10], style = colors.none},
			Tabline =          {fg = colors[5], bg = colors[2], style = colors.none},
			Title =            {fg = colors[15], bg = colors.none, style = 'bold'},
			Visual =           {fg = colors.none, bg = colors[3], style = colors.none},
			VisualNOS =        {fg = colors.none, bg = colors[3], style = colors.none},
			VertSplit =		   {fg = colors[3], bg = colors.none, style = colors.none},
			WarningMsg =       {fg = colors[16], bg = colors.none, style = colors.none},
			WildMenu =         {fg = colors[13], bg = colors.none, style = 'bold'},
			CursorColumn =     {fg = colors.none, bg = colors[2], style = colors.none},
			CursorLine =       {fg = colors.none, bg = colors[2], style = colors.none},
			ToolbarLine =      {fg = colors[5], bg = colors[2], style = colors.none},
			ToolbarButton =    {fg = colors[5], bg = colors.none, style = 'bold'},
			NormalMode =       {fg = colors[5], bg = colors.none, style = 'reverse'},
			InsertMode =       {fg = colors[15], bg = colors.none, style = 'reverse'},
			ReplacelMode =     {fg = colors[12], bg = colors.none, style = 'reverse'},
			VisualMode =       {fg = colors[10], bg = colors.none, style = 'reverse'},
			CommandMode =      {fg = colors[5], bg = colors.none, style = 'reverse'},
			Warnings =         {fg = colors[16], bg = colors.none, style = colors.none},

			healthError =   {fg = colors[12], bg = colors.none, style = colors.none},
			healthSuccess = {fg = colors[15], bg = colors.none, style = colors.none},
			healthWarning = {fg = colors[16], bg = colors.none, style = colors.none},

			-- dashboard
			DashboardShortCut = {fg = colors[8], bg = colors.none, style = colors.none},
			DashboardHeader =   {fg = colors[10], bg = colors.none, style = colors.none},
			DashboardCenter =   {fg = colors[9], bg = colors.none, style = colors.none},
			DashboardFooter =   {fg = colors[15], style = 'italic'},

			-- BufferLine
			BufferLineIndicatorSelected = {fg = colors[1], bg = colors.none, style = colors.none},
			BufferLineFill =              {bg = colors[1], style = colors.none},
		}

		return groups
	end

	if module == 'treesitter' then
		groups = {
			TSAnnotation =        {fg = colors[13], bg = colors.none, style = colors.none},
			TSCharacter =         {fg = colors[14], bg = colors.none, style = colors.none},
			TSConstructor =       {fg = colors[8], bg = colors.none, style = colors.none},
			TSConstant =          {fg = colors[16], bg = colors.none, style = colors.none},
			TSFloat =             {fg = colors[16], bg = colors.none, style = colors.none},
			TSNumber =            {fg = colors[16], bg = colors.none, style = colors.none},
			TSString =            {fg = colors[14], bg = colors.none, style = colors.none},

			TSAttribute =          {fg = colors[16], bg = colors.none, style = colors.none},
			TSBoolean =            {fg = colors[16], bg = colors.none, style = colors.none},
			TSConstBuiltin =       {fg = colors[16], bg = colors.none, style = colors.none},
			TSConstMacro =         {fg = colors[16], bg = colors.none, style = colors.none},
			TSError =              {fg = colors[12], bg = colors.none, style = colors.none},
			TSException =          {fg = colors[16], bg = colors.none, style = colors.none},
			TSField =              {fg = colors[7], bg = colors.none, style = colors.none},
			TSFuncMacro =          {fg = colors[8], bg = colors.none, style = colors.none},
			TSInclude =            {fg = colors[12], bg = colors.none, style = colors.none},
			TSLabel =              {fg = colors[16], bg = colors.none, style = colors.none},
			TSNamespace =          {fg = colors[8], bg = colors.none, style = colors.none},
			TSOperator =           {fg = colors[12], bg = colors.none, style = colors.none},
			TSParameter =          {fg = colors[13], bg = colors.none, style = colors.none},
			TSParameterReference = {fg = colors[13], bg = colors.none, style = colors.none},
			TSProperty =           {fg = colors[13], bg = colors.none, style = colors.none},
			TSPunctDelimiter =     {fg = colors[4], bg = colors.none, style = colors.none},
			TSPunctBracket =       {fg = colors[4], bg = colors.none, style = colors.none},
			TSPunctSpecial =       {fg = colors[4], bg = colors.none, style = colors.none},
			TSStringRegex =        {fg = colors[8], bg = colors.none, style = colors.none},
			TSStringEscape =       {fg = colors[16], bg = colors.none, style = colors.none},
			TSSymbol =             {fg = colors[16], bg = colors.none, style = colors.none},
			TSType =               {fg = colors[9], bg = colors.none, style = colors.none},
			TSTypeBuiltin =        {fg = colors[9], bg = colors.none, style = colors.none},
			TSTag =                {fg = colors[5], bg = colors.none, style = colors.none},
			TSTagDelimiter =       {fg = colors[7], bg = colors.none, style = colors.none},
			TSText =               {fg = colors[5], bg = colors.none, style = colors.none},
			TSTextReference =      {fg = colors[16], bg = colors.none, style = colors.none},
			TSEmphasis =           {fg = colors[11], bg = colors.none, style = colors.none},
			TSUnderline =          {fg = colors[5], bg = colors.none, style = 'underline'},
			TSTitle =              {fg = colors[11], bg = colors.none, style = 'bold'},
			TSLiteral =            {fg = colors[5], bg = colors.none, style = colors.none},
			TSURI =                {fg = colors[15], bg = colors.none, style = colors.none},

			TSComment=          {fg = colors[4], bg = colors.none, style = colors.none},
			TSConditional =     {fg = colors[12], bg = colors.none, style = colors.none},
			TSKeyword =         {fg = colors[12], bg = colors.none, style = colors.none},
			TSRepeat =          {fg = colors[12], bg = colors.none, style = colors.none},
			TSKeywordFunction = {fg = colors[9], bg = colors.none, style = colors.none},
			TSFunction =        {fg = colors[15], bg = colors.none, style = colors.none},
			TSMethod =          {fg = colors[15], bg = colors.none, style = colors.none},
			TSFuncBuiltin =     {fg = colors[8], bg = colors.none, style = colors.none},
			TSVariable =        {fg = colors[7], bg = colors.none, style = colors.none},
			TSVariableBuiltin = {fg = colors[8], bg = colors.none, style = colors.none}
		}

		return groups
	end

	if module == 'languages' then
		groups = {
			LspDiagnosticsDefaultError =           {fg = colors[12]},
			LspDiagnosticsSignError =              {fg = colors[12]},
			LspDiagnosticsFloatingError =          {fg = colors[12]},
			LspDiagnosticsVirtualTextError =       {fg = colors[12]},
			LspDiagnosticsUnderlineError =         {style = 'undercurl', sp = colors[12]},
			LspDiagnosticsDefaultWarning =         {fg = colors[16]},
			LspDiagnosticsSignWarning =            {fg = colors[16]},
			LspDiagnosticsFloatingWarning =        {fg = colors[16]},
			LspDiagnosticsVirtualTextWarning =     {fg = colors[16]},
			LspDiagnosticsUnderlineWarning =       {style = 'undercurl', sp = colors[16]},
			LspDiagnosticsDefaultInformation =     {fg = colors[11]},
			LspDiagnosticsSignInformation =        {fg = colors[11]},
			LspDiagnosticsFloatingInformation =    {fg = colors[11]},
			LspDiagnosticsVirtualTextInformation = {fg = colors[11]},
			LspDiagnosticsUnderlineInformation =   {style = 'undercurl', sp = colors[11]},
			LspDiagnosticsDefaultHint =            {fg = colors[10]  },
			LspDiagnosticsSignHint =               {fg = colors[10]  },
			LspDiagnosticsFloatingHint =           {fg = colors[10]  },
			LspDiagnosticsVirtualTextHint =        {fg = colors[10]  },
			LspDiagnosticsUnderlineHint =          {style = 'undercurl', sp = colors[11]},
			LspReferenceText =                     {fg = colors[5], bg = colors[2]},
			LspReferenceRead =                     {fg = colors[5], bg = colors[2]},
			LspReferenceWrite =                    {fg = colors[5], bg = colors[2]},

			-- Links
			DiagnosticError            = {link = 'LspDiagnosticsDefaultError'},
			DiagnosticWarn             = {link = 'LspDiagnosticsDefaultWarning'},
			DiagnosticInfo             = {link = 'LspDiagnosticsDefaultInformation'},
			DiagnosticHint             = {link = 'LspDiagnosticsDefaultHint'},
			DiagnosticVirtualTextWarn  = {link = 'LspDiagnosticsVirtualTextWarning'},
			DiagnosticUnderlineWarn    = {link = 'LspDiagnosticsUnderlineWarning'},
			DiagnosticFloatingWarn     = {link = 'LspDiagnosticsFloatingWarning'},
			DiagnosticSignWarn         = {link = 'LspDiagnosticsSignWarning'},
			DiagnosticVirtualTextError = {link = 'LspDiagnosticsVirtualTextError'},
			DiagnosticUnderlineError   = {link = 'LspDiagnosticsUnderlineError'},
			DiagnosticFloatingError    = {link = 'LspDiagnosticsFloatingError'},
			DiagnosticSignError        = {link = 'LspDiagnosticsSignError'},
			DiagnosticVirtualTextInfo  = {link = 'LspDiagnosticsVirtualTextInformation'},
			DiagnosticUnderlineInfo    = {link = 'LspDiagnosticsUnderlineInformation'},
			DiagnosticFloatingInfo     = {link = 'LspDiagnosticsFloatingInformation'},
			DiagnosticSignInfo         = {link = 'LspDiagnosticsSignInformation'},
			DiagnosticVirtualTextHint  = {link = 'LspDiagnosticsVirtualTextHint'},
			DiagnosticUnderlineHint    = {link = 'LspDiagnosticsUnderlineHint'},
			DiagnosticFloatingHint     = {link = 'LspDiagnosticsFloatingHint'},
			DiagnosticSignHint         = {link = 'LspDiagnosticsSignHint'},
		}

		return groups
	end

	if module == 'plugins' then
		groups = {
			-- LspTrouble
			LspTroubleText =   {fg = colors[5]},
			LspTroubleCount =  {fg = colors[10], bg = colors[11]},
			LspTroubleNormal = {fg = colors[5], bg = colors[2]},

			-- Diff
			diffAdded =     {fg = colors[15]},
			diffRemoved =   {fg = colors[12]},
			diffChanged =   {fg = colors[16]},
			diffOldFile =   {fg = colors[14]},
			diffNewFile =   {fg = colors[13]},
			diffFile =      {fg = colors[8]},
			diffLine =      {fg = colors[4]},
			diffIndexLine = {fg = colors[10]},

			-- Neogit
			NeogitBranch =               {fg = colors[11]},
			NeogitRemote =               {fg = colors[10]},
			NeogitHunkHeader =           {fg = colors[9]},
			NeogitHunkHeaderHighlight =  {fg = colors[9], bg = colors[2]},
			NeogitDiffContextHighlight = {bg = colors[2]},
			NeogitDiffDeleteHighlight =  {fg = colors[12], style='reverse'},
			NeogitDiffAddHighlight =     {fg = colors[15], style='reverse'},

			-- GitGutter
			GitGutterAdd =    {fg = colors[15]}, -- diff mode: Added line |diff.txt|
			GitGutterChange = {fg = colors[16]}, -- diff mode: Changed line |diff.txt|
			GitGutterDelete = {fg = colors[12]}, -- diff mode: Deleted line |diff.txt|

			-- GitSigns
			GitSignsAdd =      {fg = colors[15]}, -- diff mode: Added line |diff.txt|
			GitSignsAddNr =    {fg = colors[15]}, -- diff mode: Added line |diff.txt|
			GitSignsAddLn =    {fg = colors[15]}, -- diff mode: Added line |diff.txt|
			GitSignsChange =   {fg = colors[16]}, -- diff mode: Changed line |diff.txt|
			GitSignsChangeNr = {fg = colors[16]}, -- diff mode: Changed line |diff.txt|
			GitSignsChangeLn = {fg = colors[16]}, -- diff mode: Changed line |diff.txt|
			GitSignsDelete =   {fg = colors[12]}, -- diff mode: Deleted line |diff.txt|
			GitSignsDeleteNr = {fg = colors[12]}, -- diff mode: Deleted line |diff.txt|
			GitSignsDeleteLn = {fg = colors[12]}, -- diff mode: Deleted line |diff.txt|

			-- Telescope
			TelescopePromptBorder =   {fg = colors[9]},
			TelescopeResultsBorder =  {fg = colors[10]},
			TelescopePreviewBorder =  {fg = colors[15]},
			TelescopeSelectionCaret = {fg = colors[10]},
			TelescopeSelection =      {fg = colors[10]},
			TelescopeMatching =       {fg = colors[9]},

			-- NvimTree
			NvimTreeNormal =			{fg = colors[5]},
			NvimTreeRootFolder =        {fg = colors[8]},
			NvimTreeGitDirty =          {fg = colors[16]},
			NvimTreeGitNew =            {fg = colors[15]},
			NvimTreeImageFile =         {fg = colors[16]},
			NvimTreeExecFile =          {fg = colors[15]},
			NvimTreeSpecialFile =       {fg = colors[10]},
			NvimTreeFolderName =        {fg = colors[11]},
			NvimTreeEmptyFolderName =   {fg = colors[2]},
			NvimTreeFolderIcon =        {fg = colors[5]},
			NvimTreeIndentMarker =      {fg = colors[2]},
			LspDiagnosticsError =       {fg = colors[12]},
			LspDiagnosticsWarning =     {fg = colors[16]},
			LspDiagnosticsInformation = {fg = colors[11]},
			LspDiagnosticsHint =        {fg = colors[10]},

			-- WhichKey
			WhichKey =          {fg = colors[5] , style = 'bold'},
			WhichKeyGroup =     {fg = colors[5]},
			WhichKeyDesc =      {fg = colors[8], style = 'italic'},
			WhichKeySeperator = {fg = colors[5]},
			WhichKeyFloating =  {bg = colors[2]},
			WhichKeyFloat =     {bg = colors[2]},

			-- LspSaga
			DiagnosticError =            {fg = colors[12]},
			DiagnosticWarning =          {fg = colors[16]},
			DiagnosticInformation =      {fg = colors[11]},
			DiagnosticHint =             {fg = colors[10]},
			DiagnosticTruncateLine =     {fg = colors[5]},
			LspFloatWinNormal =          {bg = colors[3]},
			LspFloatWinBorder =          {fg = colors[10]},
			LspSagaBorderTitle =         {fg = colors[9]},
			LspSagaHoverBorder =         {fg = colors[11]},
			LspSagaRenameBorder =        {fg = colors[15]},
			LspSagaDefPreviewBorder =    {fg = colors[15]},
			LspSagaCodeActionBorder =    {fg = colors[8]},
			LspSagaFinderSelection =     {fg = colors[15]},
			LspSagaCodeActionTitle =     {fg = colors[11]},
			LspSagaCodeActionContent =   {fg = colors[10]},
			LspSagaSignatureHelpBorder = {fg = colors[14]},
			ReferencesCount =            {fg = colors[10]},
			DefinitionCount =            {fg = colors[10]},
			DefinitionIcon =             {fg = colors[8]},
			ReferencesIcon =             {fg = colors[8]},
			TargetWord =                 {fg = colors[9]},

				-- Sneak
			Sneak =      {fg = colors[1], bg = colors[5]},
			SneakScope = {bg = colors[2]},

			-- Cmp
			CmpItemKind =	        {fg = colors[16]},
			CmpItemAbbrMatch =	    {fg = colors[6], style = 'bold'},
			CmpItemAbbrMatchFuzzy = {fg = colors[6], style = 'bold'},
			CmpItemAbbr =	        {fg = colors[5]},
			CmpItemMenu =           {fg = colors[15]},

			-- Indent Blankline
			IndentBlanklineChar =        {fg = colors[4]},
			IndentBlanklineContextChar = {fg = colors[11]},

			-- Illuminate
			illuminatedWord =    {bg = colors[4]},
			illuminatedCurWord = {bg = colors[4]},

			-- nvim-dap
			DapBreakpoint = {fg = colors[15]},
			DapStopped =    {fg = colors[16]},

			-- Hop
			HopNextKey =   {fg = colors[5], style = 'bold'},
			HopNextKey1 =  {fg = colors[9], style = 'bold'},
			HopNextKey2 =  {fg = colors[5]},
			HopUnmatched = {fg = colors[4]},

			-- Fern
			FernBranchText = {fg = colors[4]},

			-- nvim-ts-rainbow
			rainbowcol1 = {fg = colors[16]},
			rainbowcol2 = {fg = colors[14]},
			rainbowcol3 = {fg = colors[12]},
			rainbowcol4 = {fg = colors[8]},
			rainbowcol5 = {fg = colors[9]},
			rainbowcol6 = {fg = colors[16]},
			rainbowcol7 = {fg = colors[14]},

			-- lightspeed
			LightspeedLabel =                  {fg = colors[9], style = 'bold'},
			LightspeedLabelOverlapped =        {fg = colors[9], style = 'bold,underline'},
			LightspeedLabelDistant =           {fg = colors[16], style = 'bold'},
			LightspeedLabelDistantOverlapped = {fg = colors[16], style = 'bold,underline'},
			LightspeedShortcut =               {fg = colors[11], style = 'bold'},
			LightspeedShortcutOverlapped =     {fg = colors[11], style = 'bold,underline'},
			LightspeedMaskedChar =             {fg = colors[5], bg = colors[3], style = 'bold'},
			LightspeedGreyWash =               {fg = colors[4]},
			LightspeedUnlabeledMatch =         {fg = colors[5], bg = colors[2]},
			LightspeedOneCharMatch =           {fg = colors[9], style = 'bold,reverse'},
			LightspeedUniqueChar =             {style = 'bold,underline'},
		}

		return groups
	end
end

manager.set = function(variat)
	manager.init(variat)

	local theme = {
		syntax = manager.load('syntax'),
		editor = manager.load('editor'),
		plugins = manager.load('plugins'),
		languages = manager.load('languages'),
		treesitter = manager.load('treesitter')
	}

	for module, groups in pairs(theme) do
		for group, content in pairs(groups) do
			highlight(group, content)
		end
	end
end

return manager
