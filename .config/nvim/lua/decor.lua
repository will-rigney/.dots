-- provides little text decoration strings

-- get_decoration() returns a little decorative string
-- get_face() returns a decorative face
-- get_ tile() returns a tiling decorative string

-- private list of all the decorations
local decorations = {
	'	˚₊· ͟͟͞͞➳❥',
	'✧･ﾟ: *✧･ﾟ:*',
	'*:･ﾟ✧*:･ﾟ✧',
	'.・゜゜・',
	'・゜゜・．',
	'｡･ﾟﾟ･',
	'･ﾟﾟ･｡',
	'༶•┈┈⛧┈♛',
	'✧༺♥༻∞',
	'⋆ ˚｡⋆୨୧˚',
	'*:..｡o○',
	'ﾟ+*:ꔫ:*﹤',
	'*+:｡.｡',
	'♥*♡∞:｡.｡',
	'‧̍̊˙˚˙ᵕ꒳ᵕ˙˚˙',
	'*°:⋆ₓₒ',
	'ₓ˚. ୭ ˚○◦˚.˚◦○˚ ୧ .˚ₓ',
	'༄ؘ ۪۪۫۫ ▹▫◃ ۪۪۫۫ ༄ؘ',
	'｡ₓ ू ₒ ु ˚',
	'˚ ₒ ु ₓ｡',
	'∞ ₒ ˚ ° 𐐒',
	'｡･:*:･ﾟ',
	',｡･:*:･ﾟ☆',
	'.・゜-: ✧ :-',
	'⋇⋆✦⋆⋇',
	'⭒❃.✮:▹',
	'‧͙⁺˚*･༓☾',
	'.｡*ﾟ+.*.｡',
	'ﾟ+..｡*ﾟ+',
	'☆.｡.:*',
	'☆○o',
	'【☆】★【☆】',
	'.・。.・゜✭・.・✫・゜・。.',
	'.｡❅*⋆⍋*∞*｡',
	'˱ 𓈒 𓈊 ┈ 𓈒 ˲',
	'✺✳ ┅ ⑅ ┅ ✳✺',
	'✧༝┉˚*❋',
	'❋*˚┉༝✧',
	'✲꘏ ꘏ ꘏ ꘏✲',
	'✧○ꊞ○ꊞ○ꊞ○✧',
	'✼　 ҉ 　✼　 ҉ 　✼',
	'✼　 ҉　 ҉　 ҉　 ҉　✼',
	'°。°。°。°。°。°。',
	'︵‿︵‿︵‿︵',
	'●～●～●～●～',
	'●・○・●・○・●',
	'■━■━■━■',
	'⌒⌒⌒⌒⌒⌒',
	'◇─◇──◇─◇',
	'˚ ༘♡ ⋆｡˚ ❀',
	'*･῾ ᵎ⌇ ⁺◦ 💮 ✧.*',
	'˚ ༘♡ ⋆｡˚ ꕥ',
	'-ˋˏ ༻❁༺ ˎˊ-',
	'*＊✿❀　❀✿＊*',
	'.•° ✿ °•.',
	'°•. ✿ .•°',
	'❀。• *₊°。 ❀°。',
	'ೋღ 🌺 ღೋ',
	'✧❁❁✧✿',
	'✿✧❁❁✧',
	'❛ ━━･❪ ❁ ❫ ･━━ ❜',
	'━。゜✿ฺ✿ฺ゜。━',
	'❁ ≖≖✿❁ ≖≖ ❁',
	'... ✿°•∘ɷ∘•°✿ ..',
	'....::::**•°✾°•**::::....',
	'*＊✿❀○❀✿＊*',
	'°˖✧✿✧˖°',
	'✯¸.•´*¨`*•✿',
	'✿•*`¨*`•.¸✯',
	'╱╲❀╱╲╱╲❀╱╲',
	'─•~❉᯽❉~•─',
	'➶-͙˚ ༘✶',
	'•◌•◌•★',
	'★•◌•◌•',
	-- these bar ones not that good
	'───※ ·❆',
	'❆· ※───',
	'════ ⋆★',
	'★⋆ ════',
	'*✧･ﾟ: *✧･ﾟ:',
	'─── ⋆⋅☆',
	'☆⋅⋆ ──',
	'.•*•.•*•.',
	'•┈••✦ ❤',
	'❤ ✦••┈•',
	'☾ ⋆*･ﾟ:⋆*･ﾟ',
	'✧⋄⋆⋅⋆⋄✧⋄⋆⋅⋆⋄✧',
	'≪ °❈° ≫≪ °❈° ≫',
	'∘₊✧──────✧₊∘',
	'＊*•̩̩͙✩•̩̩͙*˚',
	'┊͙✧˖*°࿐',
	'*ੈ✩‧₊˚',
	'✧˖*°࿐',
	'❝ ❞ ✧ ೃ༄',
	'｡･:*˚:✧｡',
	' ➶ ❁۪ ｡˚ ✧',
	'✧ ⁺ ⁺ 　°',
	'*. * ·',
	'⋆ ★',
	'✧ ˚ 　· 　　 .',
	'↶*ೃ✧˚. ❃ ↷ ˊ-',
	'✦✧✦✧',
	'☆。*。☆。',
	'*.·:·.✧ ✦',
	'✦ ✧.·:·.*',
	'•❅───✧❅✦',
	'✦❅✧───❅•',
	-- probably too many bar-type
	'◦◦,`°.✽✦✽.◦.✽✦✽.°`,◦◦',
	'───✱*.｡:｡✱*.:｡✧*.｡✰ ───',
	'─── ･ ｡ﾟ☆: *.☽ .* :☆ﾟ. ───',
	'══✿══╡°˖✧✿',
	'✿✧˖°╞══✿══',
	'* . °•★|•°∵ ',
	' ∵°•|☆•° . *',
	'₊˚ʚ ᗢ₊˚✧ ﾟ.',
}

-- private list of all the faces
local faces = {
	'(* ^ ω ^)',
	' (´ ∀ ` *)',
	' ٩(◕‿◕｡)۶',
	'☆*:.｡.o(≧▽≦)o.｡.:*☆',
	'(o^▽^o)',
	'(⌒▽⌒)☆',
	'<(￣︶￣)>',
	".:☆*:･'",
	' (*⌒―⌒*)))',
	'ヽ(・∀・)ﾉ',
	'(´｡• ω •｡`)',
	'(￣ω￣)',
	';:゛;｀;･(°ε° )',
	'(o･ω･o)',
	'(＠＾◡＾)',
	'ヽ(*・ω・)ﾉ',
	'(o_ _)ﾉ彡☆',
	'(´• ω •`)',
	'(＾▽＾)',
	'(⌒ω⌒)a',
	' ∑d(°∀°d)',
	'(*°▽°*)',
	'٩(｡•́‿•̀｡)۶',
	'(✧ω✧)',
	'ヽ(*⌒▽⌒*)ﾉ',
	'( = ⩊ = )',
	'( ´ ꒳ ` )',
	'⸜( ´ ꒳ ` )⸝',
	'⸜(⸝⸝⸝´꒳`⸝⸝⸝)⸝',
	'⸜(*ˊᗜˋ*)⸝',
	'⸜( *ˊᵕˋ* )⸝',
	'(>⩊<)',
	'(ᗒ⩊ᗕ)',
	'(ᵔ⩊ᵔ)',
	'( ᵔ ⩊ ᵔ )',
	'(•⩊•)',
	'( • ⩊ • )',
	"'(^人^)",
	'(o´▽`o)',
	'(*´▽`*)',
	'｡ﾟ( ﾟ^∀^ﾟ)ﾟ｡',
	'( ´ ω ` )',
	'(((o(*°▽°*)o)))',
	'(≧◡≦)',
	'(o´∀`o)',
	'╰(▔∀▔)╯ ',
	'(─‿‿─) ',
	'(*^‿^*) ',
	'ヽ(o^ ^o)ﾉ',
	'(✯◡✯) ',
	'(◕‿◕) ',
	'(*≧ω≦*) ',
	'(☆▽☆)',
	'(⌒‿⌒) ',
	'＼(≧▽≦)／ ',
	'ヽ(o＾▽＾o)ノ ',
	"☆ ～('▽^人)",
	'(´｡• ᵕ •｡`) ',
	'( ´ ▽ ` ) ',
	'(￣▽￣) ',
	'╰(*´︶`*)╯',
	'ヽ(>∀<☆)ノ ',
	'o(≧▽≦)o ',
	'(☆ω☆) ',
	'(っ˘ω˘ς )',
	'＼(￣▽￣)／ ',
	'(*¯︶¯*) ',
	'＼(＾▽＾)／ ',
	'٩(◕‿◕)۶',
	'(o˘◡˘o) ',
	'\\(★ω★)/ ',
	'\\(^ヮ^)/ ',
	'(〃＾▽＾〃)',
	'(╯✧▽✧)╯ ',
	'o(>ω<)o ',
	'o( ❛ᴗ❛ )o ',
	'｡ﾟ(TヮT)ﾟ｡',
	'( ‾́ ◡ ‾́ ) ',
	'(ﾉ´ヮ`)ﾉ*: ･ﾟ ',
	'(b ᵔ▽ᵔ)b ',
	'(๑˃ᴗ˂)ﻭ',
	'(๑˘︶˘๑) ',
	'( ˙꒳˙ ) ',
	'(*꒦ິ꒳꒦ີ) ',
	'°˖✧◝(⁰▿⁰)◜✧˖°',
	'(´･ᴗ･ ` ) ',
	'(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧ ',
	'(„• ֊ •„) ',
	'(.❛ ᴗ ❛.)',
	'(⁀ᗢ⁀) ',
	'(￢‿￢ ) ',
	'(¬‿¬ ) ',
	'(*￣▽￣)b',
	'( ˙▿˙ ) ',
	'(¯▿¯) ',
	'( ◕▿◕ ) ',
	'＼(٥⁀▽⁀ )／',
	'(„• ᴗ •„) ',
	'(ᵔ◡ᵔ) ',
	'( ´ ▿ ` ) ',
	'(๑>◡<๑)',
}

local tiles = {
	-- space always on the left as it looks more even
	'‿ ⁀ ',
	'ᐯᐯᐯ',
	' ⁄ ⁄ ⁄',
	' ☆',
	' *',
	' ✧',
	' ❤',
	'⋆୨୧˚',
}

-- pick something random from input and return
local function get_random_decoration(decor_list) return decor_list[math.random(#decor_list)] end

return {
	get_decoration = function() return get_random_decoration(decorations) end,
	get_face = function() return get_random_decoration(faces) end,
	get_tile = function() return get_random_decoration(tiles) end,
}
