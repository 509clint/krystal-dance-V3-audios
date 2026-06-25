local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "FEARLESS BYPASS CRACKED BY CLINT",
    LoadingTitle = "fuck fearless",
    LoadingSubtitle = "dont skid this btw",
    ConfigurationSaving = {
        Enabled = false
    }
})

local Tab = Window:CreateTab("cool ass fucking bypass", 4483362458)

local InputText = ""

local convertMap = {
	a="ล",
	b="lว",
	c="ჺ",
	d="Ԁ",
	e="ɐ",
	f="f",
	g="ဌ",
	h="lา",
	i="ị",
	j="ɉ",
	k="k",
	l="Ɩ",
	m="ıาา",
	n="ıา",
	o="ჿ",
	p="ꞁว",
	q="ɋ",
	r="ꞅ",
	s="ร",
	t="ϯ",
	u="เɹ",
	v="ν",
	w="พ",
	x="ꭖ",
	y="ყ",
	z="ʑ",
	[" "]=""
}

local function transform(text)
	local result = ""

	for char in text:lower():gmatch(".") do
		result ..= (convertMap[char] or char)
	end

	return "(့、" .. result .. "、 (့)`"
end

Tab:CreateInput({
    Name = "coolio chat bypasser yes yes",
    PlaceholderText = "enter nigga text here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        InputText = Text
    end
})

local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

Tab:CreateButton({
    Name = "send",
    Callback = function()
        local converted = transform(InputText)

        -- Modern chat
        local success = pcall(function()
            local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if channel then
                channel:SendAsync(converted)
            else
                error("No RBXGeneral channel")
            end
        end)

        -- Fallback to legacy chat
        if not success then
            local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                chatEvents.SayMessageRequest:FireServer(converted, "All")
            end
        end

        Rayfield:Notify({
            Title = "your a nigger",
            Content = converted,
            Duration = 5
        })
    end
})

Tab:CreateButton({
    Name = "copy",
    Callback = function()
        local converted = transform(InputText)

        if setclipboard then
            setclipboard(Output)
            Rayfield:Notify({
                Title = "u might get banned lowkey",
                Content = converted,
                Duration = 8,
                Image = 4483362458
            })
        else
            Rayfield:Notify({
                Title = "super cool bypassed text",
                Content = converted,
                Duration = 10,
                Image = 4483362458
            })
        end
    end
})

Tab:CreateParagraph({
    Title = "made by clint",
    Content = "fuck all niggers"
})
