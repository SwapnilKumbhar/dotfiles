return {
	{
		autoFixOnSave = true,
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		experimental = {
			useFlatConfig = false,
		},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		problems = {
			shortenToSingleLine = true,
		},
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "location",
		},
	},
}

