math.randomseed(os.time())

local fortunes = {
	"Technology. Music. Travel. Whatever.",
	"' 1 = 1 --",
	"Drink all the things, hack all the booze!",
	"If you are not very careful, your possessions will possess you.",
	"Looking for an internship for the Summer of 2022.",
	"[object Object]",
	"undefined",
	"Use headphones for best experience.",
	"`base64 /dev/zero` is such a mood.",
	"My opinions are not my own.",
	"These fortunes have been cancelled.",
	"Division is futile. You will be approximated.",
	":(){ :|:& };:",
	"What do you want to debug today?",
	"I just steal some of these from radare2.",
	"Causing retinal damage till I figure out dark mode.",
	"* screams internally *",
	"Let's read Paul Allen's fortunes.",
	"Free, as in Freedom.",
	"LinkedIn is great for my mental health!",
	"Dayman - Fighter of the Nightman",
	"What are we breaking today?",
}

-- Starter
require("mini.starter").setup({
	header = [[
 _____        ___   _ _
|_ _\ \      / / \ | | |
 | | \ \ /\ / /|  \| | |
 | |  \ V  V / | |\  | |___
|___|  \_/\_/  |_| \_|_____|

  ]],
	footer = fortunes[math.random(0, #fortunes - 1)],
})
