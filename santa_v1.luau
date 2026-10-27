--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=[==[
local uis = game:GetService("UserInputService")
local players = game:GetService("Players")
local ws = game:GetService("Workspace")
local http_service = game:GetService("HttpService")
local gui_service = game:GetService("GuiService")
local lighting = game:GetService("Lighting")
local run = game:GetService("RunService")
local stats = game:GetService("Stats")
local coregui = game:GetService("CoreGui")
local debris = game:GetService("Debris")
local tween_service = game:GetService("TweenService")
local rs = game:GetService("ReplicatedStorage")
local vec2 = Vector2.new
local vec3 = Vector3.new
local dim2 = UDim2.new
local dim = UDim.new
local rect = Rect.new
local cfr = CFrame.new
local color = Color3.new
local rgb = Color3.fromRGB
local hex = Color3.fromHex
local hsv = Color3.fromHSV
local rgbseq = ColorSequence.new
local rgbkey = ColorSequenceKeypoint.new
local camera = ws.CurrentCamera
local lp = players.LocalPlayer
local mouse = lp:GetMouse()
local gui_offset = gui_service:GetGuiInset().Y
local max = math.max
local floor = math.floor
local min = math.min
local abs = math.abs
if getgenv().library then
	getgenv().library:unload()
end
getgenv().library = {
	flags = {},
	config_flags = {},
	connections = {},
	notifications = {},
	instances = {},
	main_frame = {},
	config_holder,
	current_tab,
	current_element_open,
	dock_button_holder,
	gui,
	sin = 0,
	keybind_path,
	panel_open = false,
	directory = "sample_new",
	folders = {
		"/fonts",
		"/configs",
	},
	font,
}
local flags = library.flags
local config_flags = library.config_flags
local themes = {
	preset = {
		["outline"] = rgb(32, 32, 38), --
		["inline"] = rgb(60, 55, 75), --
		["accent"] = rgb(255, 128, 0), --
		["contrast"] = rgb(35, 35, 47),
		["text"] = rgb(170, 170, 170),
		["unselected_text"] = rgb(90, 90, 90),
		["text_outline"] = rgb(0, 0, 0),
		["glow"] = rgb(255, 128, 0),
	},
	utility = {
		["outline"] = {
			["BackgroundColor3"] = {},
			["Color"] = {},
		},
		["inline"] = {
			["BackgroundColor3"] = {},
		},
		["accent"] = {
			["BackgroundColor3"] = {},
			["TextColor3"] = {},
			["ImageColor3"] = {},
			["BorderColor3"] = {},
			["ScrollBarImageColor3"] = {},
		},
		["contrast"] = {
			["Color"] = {},
		},
		["text"] = {
			["TextColor3"] = {},
		},
		["text_outline"] = {
			["Color"] = {},
		},
		["glow"] = {
			["ImageColor3"] = {},
		},
	},
}
local keys = {
	[Enum.KeyCode.LeftShift] = "LS",
	[Enum.KeyCode.RightShift] = "RS",
	[Enum.KeyCode.LeftControl] = "LC",
	[Enum.KeyCode.RightControl] = "RC",
	[Enum.KeyCode.Insert] = "INS",
	[Enum.KeyCode.Backspace] = "BS",
	[Enum.KeyCode.Return] = "Ent",
	[Enum.KeyCode.LeftAlt] = "LA",
	[Enum.KeyCode.RightAlt] = "RA",
	[Enum.KeyCode.CapsLock] = "CAPS",
	[Enum.KeyCode.One] = "1",
	[Enum.KeyCode.Two] = "2",
	[Enum.KeyCode.Three] = "3",
	[Enum.KeyCode.Four] = "4",
	[Enum.KeyCode.Five] = "5",
	[Enum.KeyCode.Six] = "6",
	[Enum.KeyCode.Seven] = "7",
	[Enum.KeyCode.Eight] = "8",
	[Enum.KeyCode.Nine] = "9",
	[Enum.KeyCode.Zero] = "0",
	[Enum.KeyCode.KeypadOne] = "Num1",
	[Enum.KeyCode.KeypadTwo] = "Num2",
	[Enum.KeyCode.KeypadThree] = "Num3",
	[Enum.KeyCode.KeypadFour] = "Num4",
	[Enum.KeyCode.KeypadFive] = "Num5",
	[Enum.KeyCode.KeypadSix] = "Num6",
	[Enum.KeyCode.KeypadSeven] = "Num7",
	[Enum.KeyCode.KeypadEight] = "Num8",
	[Enum.KeyCode.KeypadNine] = "Num9",
	[Enum.KeyCode.KeypadZero] = "Num0",
	[Enum.KeyCode.Minus] = "-",
	[Enum.KeyCode.Equals] = "=",
	[Enum.KeyCode.Tilde] = "~",
	[Enum.KeyCode.LeftBracket] = "[",
	[Enum.KeyCode.RightBracket] = "]",
	[Enum.KeyCode.RightParenthesis] = ")",
	[Enum.KeyCode.LeftParenthesis] = "(",
	[Enum.KeyCode.Semicolon] = ",",
	[Enum.KeyCode.Quote] = "'",
	[Enum.KeyCode.BackSlash] = "\\",
	[Enum.KeyCode.Comma] = ",",
	[Enum.KeyCode.Period] = ".",
	[Enum.KeyCode.Slash] = "/",
	[Enum.KeyCode.Asterisk] = "*",
	[Enum.KeyCode.Plus] = "+",
	[Enum.KeyCode.Period] = ".",
	[Enum.KeyCode.Backquote] = "`",
	[Enum.UserInputType.MouseButton1] = "MB1",
	[Enum.UserInputType.MouseButton2] = "MB2",
	[Enum.UserInputType.MouseButton3] = "MB3",
	[Enum.KeyCode.Escape] = "ESC",
	[Enum.KeyCode.Space] = "SPC",
}
library.__index = library
for _, path in next, library.folders do
	makefolder(library.directory .. path)
end
if not isfile(library.directory .. "/fonts/main.ttf") then
	writefile(
		library.directory .. "/fonts/main.ttf",
		game:HttpGet("https://github.com/i77lhm/storage/raw/refs/heads/main/fonts/fs-tahoma-8px.ttf")
	)
end
local tahoma = {
	name = "SmallestPixel7",
	faces = {
		{
			name = "Regular",
			weight = 400,
			style = "normal",
			assetId = getcustomasset(library.directory .. "/fonts/main.ttf"),
		},
	},
}
if not isfile(library.directory .. "/fonts/main_encoded.ttf") then
	writefile(library.directory .. "/fonts/main_encoded.ttf", http_service:JSONEncode(tahoma))
end
library.font = Font.new(getcustomasset(library.directory .. "/fonts/main_encoded.ttf"), Enum.FontWeight.Regular)
-- functions
-- misc functions
function library.to_screen_point(position)
	return camera:WorldToViewportPoint(position)
end
function library:unload()
	library.gui:Destroy()
	for _, connection in library.connections do
		connection:Disconnect()
	end
	for _, item in library.instances do
		item:Destroy()
	end
	getgenv().library = nil
end
function library:convert_string_rgb(str)
	local values = {}
	for value in string.gmatch(str, "[^,]+") do
		table.insert(values, tonumber(value))
	end
	if #values == 4 then
		local r, g, b, a = values[1], values[2], values[3], values[4]

		return r, g, b, a
	else
		library:notification({ text = "Input a correct RGBA value (in the format 255, 255, 255, 0.5)" })
	end
end
function library:connection(signal, callback)
	local connection = signal:Connect(callback)
	table.insert(library.connections, connection)
	return connection
end
function library:make_resizable(frame)
	local Frame = Instance.new("TextButton")
	Frame.Position = dim2(1, -10, 1, -10)
	Frame.BorderColor3 = rgb(0, 0, 0)
	Frame.Size = dim2(0, 10, 0, 10)
	Frame.BorderSizePixel = 0
	Frame.BackgroundColor3 = rgb(255, 255, 255)
	Frame.Parent = frame
	Frame.BackgroundTransparency = 1
	Frame.Text = ""
	local resizing = false
	local start_size
	local start
	local og_size = frame.Size
	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			resizing = true
			start = input.Position
			start_size = frame.Size
		end
	end)
	Frame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			resizing = false
		end
	end)
	library:connection(uis.InputChanged, function(input, game_event)
		if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
			local mouse_pos = vec2(mouse.X, mouse.Y)
			local viewport_x = camera.ViewportSize.X
			local viewport_y = camera.ViewportSize.Y

			current_size = dim2(
				start_size.X.Scale,
				math.clamp(start_size.X.Offset + (input.Position.X - start.X), og_size.X.Offset, viewport_x),
				start_size.Y.Scale,
				math.clamp(start_size.Y.Offset + (input.Position.Y - start.Y), og_size.Y.Offset, viewport_y)
			)
			frame.Size = current_size
		end
	end)
end
function library:new_item(class, properties)
	local ins = Instance.new(class)
	for _, v in next, properties do
		ins[_] = v
	end
	table.insert(library.instances, ins)
	return ins
end
function library:animation(text)
	local pattern = {}
	for i = 1, tonumber(text:len()) do
		table.insert(pattern, string.sub(text, 1, i))
	end
	for i = tonumber(text:len()) - 1, 0, -1 do
		table.insert(pattern, string.sub(text, 1, i))
	end
	return pattern
end

function library:convert_enum(enum)
	local enum_parts = {}

	for part in string.gmatch(enum, "[%w_]+") do
		table.insert(enum_parts, part)
	end

	local enum_table = Enum
	for i = 2, #enum_parts do
		local enum_item = enum_table[enum_parts[i]]

		enum_table = enum_item
	end

	return enum_table
end

local http_service = game:GetService("HttpService")

function library:config_list_update()
	if not library.config_holder then
		return
	end

	local list = {}
	local config_path = library.directory .. "/configs"

	if not isfolder(config_path) then
		makefolder(config_path)
	end

	for _, file in next, listfiles(config_path) do
		local normalized = file:gsub("\\", "/")
		local parts = normalized:split("/")
		local filename = parts[#parts]

		if filename:sub(-4) == ".cfg" then
			local name = filename:sub(1, -5)
			table.insert(list, name)
		end
	end

	library.config_holder:refresh_options(list)
end

function library:get_config()
	local Config = {}

	for i, v in next, flags do
		if type(v) == "table" and v.key then
			Config[i] = { active = v.active, mode = v.mode, key = tostring(v.key) }
		elseif type(v) == "table" and v.Transparency and v.Color then
			local color_hex = "ffffff"
			if typeof(v.Color) == "Color3" then
				color_hex = v.Color:ToHex()
			end
			Config[i] = { Transparency = v.Transparency, Color = color_hex }
		else
			Config[i] = v
		end
	end

	return http_service:JSONEncode(Config)
end

function library:load_config(config_json)
	local success, config = pcall(function()
		return http_service:JSONDecode(config_json)
	end)

	if not success then return end

	for i, v in next, config do
		local function_set = library.config_flags[i]

		if function_set then
			if type(v) == "table" and v.Transparency and v.Color then
				function_set(Color3.fromHex(v.Color), v.Transparency)
			elseif type(v) == "table" and v.active ~= nil then
				function_set(v)
			else
				function_set(v)
			end
		end
	end
end

function library:round(number, float)
	local multiplier = 1 / (float or 1)
	return math.floor(number * multiplier + 0.5) / multiplier
end

function library:apply_theme(instance, theme, property)
	table.insert(themes.utility[theme][property], instance)
end

function library:update_theme(theme, color)
	for _, property in next, themes.utility[theme] do
		for m, object in next, property do
			if object[_] == themes.preset[theme] or object.ClassName == "UIGradient" then
				object[_] = color
			end
		end
	end

	themes.preset[theme] = color
end

function library:connection(signal, callback)
	local connection = signal:Connect(callback)

	table.insert(library.connections, connection)

	return connection
end

function library:create(instance, options)
	local ins = Instance.new(instance)

	for prop, value in next, options do
		ins[prop] = value
	end

	return ins
end
library.gui = library:create("ScreenGui", {
	Enabled = true,
	Parent = coregui,
	Name = "",
	DisplayOrder = 2,
	ZIndexBehavior = 1,
})
function library:window(properties)
	local cfg = {
		name = properties.Name or properties.name or properties.Title or properties.title or "sp4m.wtf",
		size = properties.Size or properties.size or dim2(0, 500, 0, 650),
	}
	local animated_text = library:animation(cfg.name)
	local __holder = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 20, 0, 20),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		ZIndex = 2,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	})

	local inline1 = library:create("Frame", {
		Parent = __holder,
		Name = "",
		Active = true,
		Draggable = true,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, ((#animated_text / 2) * 9) + 40, 0, 40),
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	})

	local accent_line = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BorderColor3 = Color3.fromRGB(34, 34, 34),
		Size = UDim2.new(1, 0, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = themes.preset.accent,
	})

	library:apply_theme(accent_line, "accent", "BackgroundColor3")

	local depth = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BackgroundTransparency = 0.5,
		Position = UDim2.new(0, 0, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 0, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	local inline2 = library:create("Frame", {
		Parent = inline1,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -4, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local main = library:create("Frame", {
		Parent = inline2,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(57, 57, 57),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local tab_inline = library:create("Frame", {
		Parent = main,
		Name = "",
		Position = UDim2.new(0, 6, 0, 6),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -12, 1, -12),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(19, 19, 19),
	})

	local tabs = library:create("Frame", {
		Parent = tab_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local name = library:create("TextLabel", {
		Parent = tabs,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(0, 8, 0, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local TEXT_ANIMATION_GRADIENT = library:create("UIGradient", {
		Parent = name,
		Name = "",
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(0.01, themes.preset.accent),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
		}),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = tabs,
		Name = "",
		PaddingRight = UDim.new(0, 21),
	})

	local glow = library:create("ImageLabel", {
		Parent = accent_line,
		Name = "",
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -20, 0, -20),
		Size = UDim2.new(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})

	library:apply_theme(glow, "accent", "ImageColor3")

	task.spawn(function()
		while true do
			if __holder.Visible then
				for i = 1, #animated_text do
					task.wait(0.2)
					name.Text = animated_text[i]
				end
			end
			task.wait(0.2)
		end
	end)
	--

	-- window
	local inline1 = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		Active = true,
		Draggable = true,
		Position = UDim2.new(0.5, -cfg.size.X.Offset / 2, 0.5, -cfg.size.Y.Offset / 2),
		BorderColor3 = Color3.fromRGB(8, 8, 8),
		ZIndex = 2,
		Size = cfg.size,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	})
	table.insert(library.main_frame, inline1)
	local WINDOW_PATH = inline1
	library:make_resizable(inline1)

	local inline2 = library:create("Frame", {
		Parent = inline1,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -4, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local main = library:create("Frame", {
		Parent = inline2,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(57, 57, 57),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local tab_buttons = library:create("Frame", {
		Parent = main,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 16, 0, 4),
		Size = UDim2.new(1, -32, 0, 0),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	cfg["tab_holder"] = tab_buttons

	local list = library:create("UIListLayout", {
		Parent = tab_buttons,
		Name = "",
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local tab_inline = library:create("Frame", {
		Parent = main,
		Name = "",
		Position = UDim2.new(0, 15, 0, 33),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -30, 1, -48),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(19, 19, 19),
	})

	local tabs = library:create("Frame", {
		Parent = tab_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	cfg["tab_instance_holder"] = tabs

	local accent_line = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BorderColor3 = Color3.fromRGB(34, 34, 34),
		Size = UDim2.new(1, 0, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = themes.preset.accent,
	})

	library:apply_theme(accent_line, "accent", "BackgroundColor3")

	local name = library:create("TextLabel", {
		Parent = inline1,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = cfg.name,
		TextStrokeTransparency = 0.5,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, -1),
		Size = UDim2.new(1, 0, 0, 1),
		ZIndex = 2,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local glow = library:create("ImageLabel", {
		Parent = inline1,
		Name = "",
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -20, 0, -20),
		Size = UDim2.new(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})
	library:apply_theme(glow, "accent", "ImageColor3")

	local depth = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BackgroundTransparency = 0.5,
		Position = UDim2.new(0, 0, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 0, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	local holder = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(1, 20, 0, 0),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		ZIndex = 2,
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	})

	task.spawn(function()
		while true do
			if flags["color_picker_anim_speed"] then
				library.sin = math.abs(math.sin(tick() * flags["color_picker_anim_speed"]))

				TEXT_ANIMATION_GRADIENT.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
					ColorSequenceKeypoint.new(math.abs(math.sin(tick())), themes.preset.accent),
					ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
				})
			end
			task.wait()
		end
	end)
	--

	-- esp preview
	local esp_preview = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		Visible = false,
		Active = true,
		Draggable = true,
		Position = UDim2.new(
			0,
			inline1.AbsolutePosition.X + inline1.AbsoluteSize.X + 8,
			0,
			inline1.AbsolutePosition.Y + 1
		),
		BorderColor3 = Color3.fromRGB(8, 8, 8),
		Size = UDim2.new(0, 328, 0, 376),
		BackgroundColor3 = Color3.fromRGB(56, 56, 56),
	})
	library:make_resizable(esp_preview)

	local name = library:create("TextLabel", {
		Parent = esp_preview,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "esp preview",
		TextStrokeTransparency = 0.5,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, -1),
		Size = UDim2.new(1, 0, 0, 1),
		ZIndex = 2,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = name,
		Name = "",
	})

	local main = library:create("Frame", {
		Parent = esp_preview,
		Name = "",
		Position = UDim2.new(0, 4, 0, 4),
		BorderColor3 = Color3.fromRGB(26, 26, 26),
		Size = UDim2.new(1, -8, 1, -8),
		BorderSizePixel = 2,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	library:create("UIStroke", {
		Parent = main,
		Name = "",
		Color = Color3.fromRGB(57, 57, 57),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local tabs = library:create("Frame", {
		Parent = main,
		Name = "",
		Position = UDim2.new(0, 8, 0, 8),
		BorderColor3 = Color3.fromRGB(8, 8, 8),
		Size = UDim2.new(1, -16, 1, -16),
		BorderSizePixel = 2,
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	library:create("UIStroke", {
		Parent = tabs,
		Name = "",
		Color = Color3.fromRGB(57, 57, 57),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local hitpart = library:create("Frame", {
		Parent = tabs,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 2, 0, 20),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local head = library:create("Frame", {
		Parent = hitpart,
		Name = "",
		Position = UDim2.new(0.5, -25, 0, 16),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, 50, 0, 44),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local torso = library:create("Frame", {
		Parent = hitpart,
		Name = "",
		Position = UDim2.new(0.5, -42, 0, 64),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, 84, 0, 90),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local l_arm = library:create("Frame", {
		Parent = hitpart,
		Name = "",
		Position = UDim2.new(0.5, -86, 0, 64),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, 40, 0, 90),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local r_arm = library:create("Frame", {
		Parent = hitpart,
		Name = "",
		Position = UDim2.new(0.5, 46, 0, 64),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, 40, 0, 90),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local r_leg = library:create("Frame", {
		Parent = hitpart,
		Name = "",
		Position = UDim2.new(0.5, 2, 0, 158),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, 40, 0, 90),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local l_leg = library:create("Frame", {
		Parent = hitpart,
		Name = "",
		Position = UDim2.new(0.5, -42, 0, 158),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, 40, 0, 90),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local hrp = library:create("Frame", {
		Parent = hrp_out,
		Name = "",
		Position = UDim2.new(0, 4, 0, 4),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -8, 1, -8),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local glow_patterns = {}

	for _, v in next, hitpart:GetChildren() do
		local glow = library:create("ImageLabel", {
			Parent = v,
			Name = "",
			Visible = false,
			ImageColor3 = themes.preset.accent,
			ScaleType = Enum.ScaleType.Slice,
			ImageTransparency = 0.8999999761581421,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Image = "http://www.roblox.com/asset/?id=18245826428",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, -20, 0, -20),
			Size = UDim2.new(1, 40, 1, 40),
			ZIndex = 2,
			BorderSizePixel = 0,
			SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
		})

		library:apply_theme(glow, "accent", "ImageColor3")

		table.insert(glow_patterns, glow)
	end

	function cfg.preview_chams(bool)
		for _, glow in next, glow_patterns do
			glow.Visible = bool
		end

		for _, part in next, hitpart:GetChildren() do
			part.BackgroundColor3 = bool and themes.preset.accent or Color3.fromRGB(38, 38, 38)
		end
	end

	local player = library:create("Frame", {
		Parent = tabs,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 43, 0, 28),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -86, 1, -106),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local line_holder = library:create("Frame", {
		Parent = player,
		Name = "",
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = 50,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local box_outline = library:create("Frame", {
		Parent = line_holder,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -1, 0, -1),
		ZIndex = 50,
		Size = UDim2.new(1, 2, 1, 2),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local BoxLine2 = library:create("UIStroke", {
		Parent = box_outline,
		Name = "",
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local box_color = library:create("UIStroke", {
		Parent = line_holder,
		Name = "",
		Color = Color3.fromRGB(255, 255, 255),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local corner_box = library:create("Frame", {
		Parent = line_holder,
		Name = "",
		Visible = false,
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local top_left = library:create("Frame", {
		Parent = corner_box,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 50,
		Size = UDim2.new(0, 1, 0.30000001192092896, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local top_right = library:create("Frame", {
		Parent = corner_box,
		Name = "",
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -1, 0, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 50,
		Size = UDim2.new(0, 1, 0.30000001192092896, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local bottom_left = library:create("Frame", {
		Parent = corner_box,
		Name = "",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 50,
		Size = UDim2.new(0.4000000059604645, 0, 0, 1),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local bottom_right = library:create("Frame", {
		Parent = corner_box,
		Name = "",
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -1, 1, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 50,
		Size = UDim2.new(0.4000000059604645, 0, 0, 1),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local bottom_left2 = library:create("Frame", {
		Parent = corner_box,
		Name = "",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 50,
		Size = UDim2.new(0, 1, 0.30000001192092896, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local bottom_right2 = library:create("Frame", {
		Parent = corner_box,
		Name = "",
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 50,
		Size = UDim2.new(0, 1, 0.30000001192092896, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local top_left2 = library:create("Frame", {
		Parent = corner_box,
		Name = "",
		AnchorPoint = Vector2.new(0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 50,
		Size = UDim2.new(0.4000000059604645, 0, 0, 1),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local top_right2 = library:create("Frame", {
		Parent = corner_box,
		Name = "",
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -1, 0, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 50,
		Size = UDim2.new(0.4000000059604645, 0, 0, 1),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	function cfg.preview_corner_boxes(bool)
		corner_box.Visible = bool == "Corner" and true or false
		BoxLine2.Enabled = bool == "Corner" and false or true
		box_outline.Visible = bool == "Corner" and false or true
		box_color.Enabled = bool == "Corner" and false or true
	end

	function cfg.preview_bounding_box(bool)
		BoxLine2.Enabled = bool
		box_outline.Visible = bool
		box_color.Enabled = bool
	end

	local bottom_holder = library:create("Frame", {
		Parent = line_holder,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -1, 1, 3),
		Size = UDim2.new(1, 2, 0, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = bottom_holder,
		Name = "",
		Padding = UDim.new(0, 2),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local UIPadding = library:create("UIPadding", {
		Parent = bottom_holder,
		Name = "",
		PaddingTop = UDim.new(0, 1),
	})

	local bar_holder = library:create("Frame", {
		Parent = bottom_holder,
		Name = "",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 4),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local reload_bar = library:create("Frame", {
		Parent = bar_holder,
		Name = "",
		Size = UDim2.new(1, 0, 0, 4),
		ZIndex = 50,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	function cfg.preview_reload_bar(bool)
		bar_holder.Visible = bool
	end

	local reload_slider = library:create("Frame", {
		Parent = reload_bar,
		Name = "",
		Size = UDim2.new(0.5, -2, 0, 2),
		Position = UDim2.new(0, 1, 0, 1),
		ZIndex = 50,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(28, 145, 255),
	})

	local gradient = library:create("UIGradient", {
		Parent = reload_slider,
		Name = "",
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 238)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 238)),
		}),
	})

	local UIStroke = library:create("UIStroke", {
		Parent = distance,
		Name = "",
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local weapon = library:create("TextLabel", {
		Parent = bottom_holder,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Text = "double barrel",
		TextStrokeTransparency = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.031031031161546707, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ZIndex = 50,
		TextSize = 12,
		Size = UDim2.new(1, 0, 0, 4),
	})

	function cfg.preview_weapon(bool)
		weapon.Visible = bool
	end

	local UIStroke = library:create("UIStroke", {
		Parent = weapon,
		Name = "",
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local UIStroke = library:create("UIStroke", {
		Parent = distance,
		Name = "",
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local image_holder = library:create("Frame", {
		Parent = bottom_holder,
		Name = "",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	function cfg.preview_icons(bool)
		image_holder.Visible = bool
	end

	local ImageLabel = library:create("ImageLabel", {
		Parent = image_holder,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		Image = "rbxassetid://130516018594923",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0, 0),
		Size = UDim2.new(0, 64, 0, 27),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local armor = library:create("Frame", {
		Parent = line_holder,
		Name = "",
		Position = UDim2.new(0, -14, 0, -2),
		Size = UDim2.new(0, 4, 1, 4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	function cfg.preview_armor(bool)
		armor.Visible = bool
	end

	local armor_slider = library:create("Frame", {
		Parent = armor,
		Name = "",
		Position = UDim2.new(0, 1, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.5, 0, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 13, 255),
	})

	local armor_gradient = library:create("UIGradient", {
		Parent = armor_slider,
		Name = "",
		Rotation = 90,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 242, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 17, 255)),
		}),
		Enabled = false,
	})

	local armor_text = library:create("TextLabel", {
		Parent = armor_slider,
		Name = "",
		ZIndex = 99,
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(0, 13, 255),
		Text = "100",
		Position = UDim2.new(0, -2, 0.75, -2),
		TextStrokeTransparency = 0,
		AnchorPoint = Vector2.new(1, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Right,
		Active = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(26, 255, 0),
	})

	library:create("UIStroke", {
		Parent = armor_text,
		Name = "",
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local health = library:create("Frame", {
		Parent = line_holder,
		Name = "",
		Position = UDim2.new(0, -8, 0, -2),
		Size = UDim2.new(0, 4, 1, 4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	function cfg.preview_health(bool)
		health.Visible = bool
	end

	local health_slider = library:create("Frame", {
		Parent = health,
		Name = "",
		Position = UDim2.new(0, 1, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.5, 0, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 255, 42),
	})

	local health_text = library:create("TextLabel", {
		Parent = health_slider,
		Name = "",
		Visible = false,
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(0, 255, 0),
		Text = "100",
		ZIndex = 99,
		TextStrokeTransparency = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0, -4, 0.5, -2),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Right,
		Active = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(26, 255, 0),
	})

	local UIStroke = library:create("UIStroke", {
		Parent = health_text,
		Name = "",
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local box_inline = library:create("Frame", {
		Parent = line_holder,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 1, 0, 1),
		ZIndex = 50,
		Size = UDim2.new(1, -2, 1, -2),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local BoxLine3 = library:create("UIStroke", {
		Parent = box_inline,
		Name = "",
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local gradient = library:create("UIGradient", {
		Parent = line_holder,
		Name = "",
		Rotation = -180,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.5),
			NumberSequenceKeypoint.new(1, 0.5),
		}),
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
		}),
	})

	function cfg.preview_filler(bool)
		line_holder.BackgroundTransparency = bool and 0 or 1
		gradient.Enabled = bool
	end

	local top_holder = library:create("Frame", {
		Parent = line_holder,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		AnchorPoint = Vector2.new(0, 1),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -2, 0, -4),
		Size = UDim2.new(1, 4, 0, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	library:create("UIListLayout", {
		Parent = top_holder,
		Name = "",
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	library:create("UIPadding", {
		Parent = top_holder,
		Name = "",
		PaddingTop = UDim.new(0, 1),
	})

	local player_name = library:create("TextLabel", {
		Parent = top_holder,
		Name = "",
		RichText = true,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Text = "hello there",
		FontFace = library.font,
		AnchorPoint = Vector2.new(0, 1),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, -2),
		BorderSizePixel = 0,
		ZIndex = 50,
		TextSize = 12,
		Size = UDim2.new(1, 0, 0, 0),
	})

	function cfg.preview_names(bool)
		player_name.Visible = bool
	end

	local UIStroke = library:create("UIStroke", {
		Parent = player_name,
		Name = "",
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local accent_line = library:create("Frame", {
		Parent = esp_preview,
		Name = "",
		BorderColor3 = Color3.fromRGB(34, 34, 34),
		Size = UDim2.new(1, 0, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = themes.preset.accent,
	})

	library:apply_theme(accent_line, "accent", "BackgroundColor3")

	local depth = library:create("Frame", {
		Parent = esp_preview,
		Name = "",
		BackgroundTransparency = 0.5,
		Position = UDim2.new(0, 0, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 0, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	local glow = library:create("ImageLabel", {
		Parent = esp_preview,
		Name = "",
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -20, 0, -20),
		Size = UDim2.new(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})

	library:apply_theme(glow, "accent", "ImageColor3")
	--

	-- playerlist
	local selected_button
	local selected_player
	local player_buttons = {}
	function library.get_priority(player)
		return player_buttons[player.Name].priority.Text
	end
	local playerlist = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		Active = true,
		Draggable = true,
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, inline1.AbsolutePosition.X - 358 - 8, 0, inline1.AbsolutePosition.Y + 1),
		BorderColor3 = Color3.fromRGB(8, 8, 8),
		Size = UDim2.new(0, 358, 0, 328),
		BackgroundColor3 = Color3.fromRGB(56, 56, 56),
	})
	library:make_resizable(playerlist)
	table.insert(library.main_frame, playerlist)
	getgenv().__RagebotList = playerlist
	local name = library:create("TextLabel", {
		Parent = playerlist,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "ragebot list",
		TextStrokeTransparency = 0.5,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, -1),
		Size = UDim2.new(1, 0, 0, 1),
		ZIndex = 2,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})
	local UIPadding = library:create("UIPadding", {
		Parent = name,
		Name = "",
	})
	local main = library:create("Frame", {
		Parent = playerlist,
		Name = "",
		Position = UDim2.new(0, 4, 0, 4),
		BorderColor3 = Color3.fromRGB(26, 26, 26),
		Size = UDim2.new(1, -8, 1, -8),
		BorderSizePixel = 2,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	library:create("UIStroke", {
		Parent = main,
		Name = "",
		Color = Color3.fromRGB(57, 57, 57),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local tabs = library:create("Frame", {
		Parent = main,
		Name = "",
		Position = UDim2.new(0, 8, 0, 8),
		BorderColor3 = Color3.fromRGB(8, 8, 8),
		Size = UDim2.new(1, -16, 1, -16),
		BorderSizePixel = 2,
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	library:create("UIStroke", {
		Parent = tabs,
		Name = "",
		Color = Color3.fromRGB(57, 57, 57),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local list = library:create("Frame", {
		Parent = tabs,
		Name = "",
		Position = UDim2.new(0, 14, 0, 14),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -28, 0.75, -28),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local inline = library:create("Frame", {
		Parent = list,
		Name = "",
		Position = UDim2.new(0, 1, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(57, 57, 57),
	})

	local background = library:create("Frame", {
		Parent = inline,
		Name = "",
		Position = UDim2.new(0, 1, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local UIGradient = library:create("UIGradient", {
		Parent = background,
		Name = "",
		Rotation = 90,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(167, 167, 167)),
		}),
	})

	local contrast = library:create("Frame", {
		Parent = background,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local __ScrollingFrame = library:create("ScrollingFrame", {
		Parent = contrast,
		Name = "",
		ScrollBarImageColor3 = themes.preset.accent,
		MidImage = "rbxassetid://18406573371",
		Active = true,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 2,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		TopImage = "rbxassetid://18406573371",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1.0099999904632568,
		BottomImage = "rbxassetid://18406573371",
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 0),
	})

	library:apply_theme(__ScrollingFrame, "accent", "ScrollBarImageColor3")

	local UIPadding = library:create("UIPadding", {
		Parent = __ScrollingFrame,
		Name = "",
		PaddingTop = UDim.new(0, 4),
		PaddingBottom = UDim.new(0, 4),
		PaddingRight = UDim.new(0, 4),
		PaddingLeft = UDim.new(0, 4),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = __ScrollingFrame,
		Name = "",
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local info = library:create("Frame", {
		Parent = tabs,
		Name = "",
		Position = UDim2.new(0, 14, 0.75, -5),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -28, 0.30000001192092896, -23),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local inline = library:create("Frame", {
		Parent = info,
		Name = "",
		Position = UDim2.new(0, 1, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(57, 57, 57),
	})

	local background = library:create("Frame", {
		Parent = inline,
		Name = "",
		Position = UDim2.new(0, 1, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -2, 1, -2),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local UIGradient = library:create("UIGradient", {
		Parent = background,
		Name = "",
		Rotation = 90,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(167, 167, 167)),
		}),
	})

	local contrast = library:create("Frame", {
		Parent = background,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local ScrollingFrame = library:create("ScrollingFrame", {
		Parent = contrast,
		Name = "",
		ScrollBarImageColor3 = Color3.fromRGB(155, 125, 175),
		Active = true,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 3,
		BackgroundTransparency = 1.0099999904632568,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 0),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = ScrollingFrame,
		Name = "",
		PaddingTop = UDim.new(0, 7),
		PaddingBottom = UDim.new(0, 4),
		PaddingRight = UDim.new(0, 4),
		PaddingLeft = UDim.new(0, 10),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = ScrollingFrame,
		Name = "",
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local display_name_label = library:create("TextLabel", {
		Parent = ScrollingFrame,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(180, 180, 180),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "display name: ...",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	library:create("UIStroke", {
		Parent = display_name_label,
		Name = "",
	})

	local name_label = library:create("TextLabel", {
		Parent = ScrollingFrame,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(180, 180, 180),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "name: ...",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	library:create("UIStroke", {
		Parent = name_label,
		Name = "",
	})

	local priority_label = library:create("TextLabel", {
		Parent = ScrollingFrame,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(180, 180, 180),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "priority: Friendly",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		AutomaticSize = Enum.AutomaticSize.XY,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	library:create("UIStroke", {
		Parent = priority_label,
		Name = "",
	})

	local Frame = library:create("Frame", {
		Parent = contrast,
		Name = "",
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, -10, 0, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -200, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local button_inline = library:create("Frame", {
		Parent = Frame,
		Name = "",
		Position = UDim2.new(0, -15, 0, 2),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -26, 0, 16),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local button = library:create("TextButton", {
		Parent = button_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "Neutral",
		TextStrokeTransparency = 0.5,
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(1, -4, 1, -4),
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	button.MouseButton1Click:Connect(function()
		player_buttons[selected_player.Name].priority.Text = "Neutral"
		player_buttons[selected_player.Name].priority.TextColor3 = rgb(180, 180, 180)
	end)

	local button_inline = library:create("Frame", {
		Parent = Frame,
		Name = "",
		Position = UDim2.new(0, -15, 0, 2),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -26, 0, 16),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local button = library:create("TextButton", {
		Parent = button_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "Friendly",
		TextStrokeTransparency = 0.5,
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(1, -4, 1, -4),
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	button.MouseButton1Click:Connect(function()
		player_buttons[selected_player.Name].priority.Text = "Friendly"
		player_buttons[selected_player.Name].priority.TextColor3 = rgb(15, 179, 255)
	end)

	local button_inline = library:create("Frame", {
		Parent = Frame,
		Name = "",
		Position = UDim2.new(0, -15, 0, 2),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -26, 0, 16),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local button = library:create("TextButton", {
		Parent = button_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "Enemy",
		TextStrokeTransparency = 0.5,
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(1, -4, 1, -4),
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	button.MouseButton1Click:Connect(function()
		player_buttons[selected_player.Name].priority.Text = "Enemy"
		player_buttons[selected_player.Name].priority.TextColor3 = rgb(255, 44, 44)
	end)

	local UIListLayout = library:create("UIListLayout", {
		Parent = Frame,
		Name = "",
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = UDim.new(0, 4),
	})

	local accent_line = library:create("Frame", {
		Parent = playerlist,
		Name = "",
		BorderColor3 = Color3.fromRGB(34, 34, 34),
		Size = UDim2.new(1, 0, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = themes.preset.accent,
	})

	library:apply_theme(accent_line, "accent", "BackgroundColor3")

	local depth = library:create("Frame", {
		Parent = playerlist,
		Name = "",
		BackgroundTransparency = 0.5,
		Position = UDim2.new(0, 0, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 0, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	local glow = library:create("ImageLabel", {
		Parent = playerlist,
		Name = "",
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -20, 0, -20),
		Size = UDim2.new(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})

	library:apply_theme(glow, "accent", "ImageColor3")

	local function create_player(player)
		local TextButton = library:create("TextButton", {
			Parent = __ScrollingFrame,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(180, 180, 180),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = "",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		player_buttons[player.Name] = {}
		player_buttons[player.Name].instance = TextButton

		local TextLabel = library:create("TextLabel", {
			Parent = TextButton,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(180, 180, 180),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = player.Name,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		library:create("UIStroke", {
			Parent = TextLabel,
			Name = "",
		})

		local TextLabel = library:create("TextLabel", {
			Parent = TextButton,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(180, 180, 180),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = player.Team and tostring(player.Team) or "None",
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		library:create("UIStroke", {
			Parent = TextLabel,
			Name = "",
		})

		local Frame = library:create("Frame", {
			Parent = TextLabel,
			Name = "",
			Position = UDim2.new(0, -10, 0, 0),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 1, 0, 12),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(32, 32, 38),
		})

		local TextLabel = library:create("TextLabel", {
			Parent = TextButton,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(180, 180, 180),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = "Neutral",
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		player_buttons[player.Name].priority = TextLabel

		library:create("UIStroke", {
			Parent = TextLabel,
			Name = "",
		})

		local Frame = library:create("Frame", {
			Parent = TextLabel,
			Name = "",
			Position = UDim2.new(0, -10, 0, 0),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 1, 0, 12),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(32, 32, 38),
		})

		local UIListLayout = library:create("UIListLayout", {
			Parent = TextButton,
			Name = "",
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalFlex = Enum.UIFlexAlignment.Fill,
		})

		local UIPadding = library:create("UIPadding", {
			Parent = TextButton,
			Name = "",
			PaddingRight = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 2),
		})

		local line = library:create("Frame", {
			Parent = tabs,
			Name = "",
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(1, 0, 0, 1),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(32, 32, 38),
		})

		TextButton.MouseButton1Click:Connect(function()
			if selected_button then
				selected_button.BackgroundTransparency = 1
			end

			selected_button = TextButton
			selected_player = player
			TextButton.BackgroundTransparency = 0.85

			priority_label.Text = "Priority: " .. library.get_priority(player)
			name_label.Text = "Name: " .. player.Name
			display_name_label.Text = "Display: " .. player.DisplayName
		end)
	end

	for _, player in next, players:GetPlayers() do
		create_player(player)
	end

	library:connection(players.PlayerAdded, function(player)
		create_player(player)
	end)

	library:connection(players.PlayerRemoving, function(player)
		player_buttons[player.Name].instance:Destroy()
	end)
	--

	-- keybind list
	local old_kblist = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 20, 0.5, 0),
		ZIndex = 2,
		Active = true,
		Draggable = true,
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	})

	local glow = library:create("ImageLabel", {
		Parent = old_kblist,
		Name = "",
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -20, 0, -20),
		Size = UDim2.new(1, 40, 0, 42),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})

	library:apply_theme(glow, "accent", "ImageColor3")

	local inline1 = library:create("Frame", {
		Parent = old_kblist,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	})

	local accent_line = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BorderColor3 = Color3.fromRGB(34, 34, 34),
		Size = UDim2.new(1, 0, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = themes.preset.accent,
	})

	library:apply_theme(accent_line, "accent", "BackgroundColor3")

	local name = library:create("TextLabel", {
		Parent = inline1,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "keybinds",
		TextStrokeTransparency = 0.5,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, -1),
		Size = UDim2.new(1, 0, 0, 1),
		ZIndex = 2,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local inline2 = library:create("Frame", {
		Parent = inline1,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -4, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local main = library:create("Frame", {
		Parent = inline2,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(57, 57, 57),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local tab_inline = library:create("Frame", {
		Parent = main,
		Name = "",
		Position = UDim2.new(0, 6, 0, 6),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -12, 1, -12),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(19, 19, 19),
	})

	local tabs = library:create("Frame", {
		Parent = tab_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = tabs,
		Name = "",
		PaddingBottom = UDim.new(0, 22),
		PaddingRight = UDim.new(0, 20),
		PaddingLeft = UDim.new(0, 20),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = tabs,
		Name = "",
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0, 3),
	})

	local UIStroke = library:create("UIStroke", {
		Parent = tabs,
		Name = "",
		Color = Color3.fromRGB(57, 57, 57),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local depth = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.5,
		Position = UDim2.new(0, 0, 0, 1),
		Size = UDim2.new(1, 0, 0, 1),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	library.keybind_path = tabs
	--

	function cfg.toggle_list(bool)
		old_kblist.Visible = bool
	end

	function cfg.toggle_playerlist(bool)
		playerlist.Visible = bool
	end

	function cfg.toggle_watermark(bool)
		__holder.Visible = bool
	end

	function cfg.set_menu_visibility(bool, pl)
		WINDOW_PATH.Visible = bool

		playerlist.Visible = flags["player_list"] and bool or false
	end

	return setmetatable(cfg, library)
end

function library:new_keybind(properties)
	local cfg = {
		text = properties.name or properties.text or "aimbot",
		key = properties.key or nil,
		mode = properties.mode or "hold",
	}

	local keybind_text = library:create("TextLabel", {
		Parent = library.keybind_path,
		Name = "",
		FontFace = library.font,
		LineHeight = 1.2000000476837158,
		TextStrokeTransparency = 0.5,
		AnchorPoint = Vector2.new(0.5, 0),
		TextSize = 12,
		Size = UDim2.new(0, 0, 0, 11),
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0, 8),
		BorderSizePixel = 0,
		Visible = true,
		TextYAlignment = Enum.TextYAlignment.Top,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = keybind_text,
		Name = "",
		PaddingTop = UDim.new(0, 6),
	})

	function cfg.set_visible(bool)
		keybind_text.Visible = bool
	end

	function cfg.change_text(text)
		keybind_text.Text = text
	end

	function keyName(key)
		local text = tostring(key) ~= "Enums" and (keys[key] or tostring(key):gsub("Enum.", "")) or nil
		local __text = text and (tostring(text):gsub("KeyCode.", ""):gsub("UserInputType.", ""))

		return __text or "..."
	end

	-- Shit ass function
	function cfg.update(n_properties)
		cfg.change_text(
			"["
				.. tostring(keyName(n_properties.key))
				.. "] "
				.. tostring(n_properties.text)
				.. " ("
				.. tostring(n_properties.mode)
				.. ")"
		)
	end

	cfg.change_text(
		"[" .. tostring(keyName(cfg.key)) .. "] " .. tostring(cfg.text) .. " (" .. tostring(cfg.mode) .. ")"
	)

	return cfg
end

function library:notification(properties)
	local cfg = {
		time = properties.time or 5,
		text = properties.text or properties.name,
	}

	-- 28 offset

	function cfg:refresh_notifications()
		for _, notif in next, library.notifications do
			tween_service
				:Create(
					notif,
					TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
					{ Position = dim2(0, 20, 0, 72 + (_ * 28)) }
				)
				:Play()
		end
	end

	-- Instances
	local holder = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 20, 0, 72 + (#library.notifications * 28)),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		ZIndex = 2,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		AnchorPoint = Vector2.new(1, 0),
	})

	local inline1 = library:create("Frame", {
		Parent = holder,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, 0, 0, 24),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	})

	local inline2 = library:create("Frame", {
		Parent = inline1,
		Name = "",
		Position = UDim2.new(0, 0, 0, 2),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -4, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local main = library:create("Frame", {
		Parent = inline2,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(57, 57, 57),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local tab_inline = library:create("Frame", {
		Parent = main,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -4, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(19, 19, 19),
	})

	local name = library:create("TextLabel", {
		Parent = tab_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = cfg.text,
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(0, 8, 0, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = tab_inline,
		Name = "",
		PaddingRight = UDim.new(0, 14),
	})

	local depth = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.5,
		Position = UDim2.new(0, 1, 0, 0),
		Size = UDim2.new(0, 1, 1, 0),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	local accent_line = library:create("Frame", {
		Parent = inline1,
		Name = "",
		BorderColor3 = Color3.fromRGB(34, 34, 34),
		Size = UDim2.new(0, 2, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = themes.preset.accent,
	})

	library:apply_theme(accent_line, "accent", "BackgroundColor3")

	local glow = library:create("ImageLabel", {
		Parent = holder,
		Name = "",
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -20, 0, 0),
		Size = UDim2.new(0, 42, 1, 40),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})

	library:apply_theme(glow, "accent", "ImageColor3")
	--

	task.spawn(function()
		tween_service
			:Create(
				holder,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
				{ AnchorPoint = Vector2.new(0, 0) }
			)
			:Play()

		task.wait(cfg.time)

		tween_service
			:Create(
				holder,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
				{ AnchorPoint = Vector2.new(1, 0) }
			)
			:Play()
		for _, v in next, holder:GetDescendants() do
			if v:IsA("TextLabel") then
				tween_service
					:Create(
						v,
						TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{ TextTransparency = 1 }
					)
					:Play()
			elseif v:IsA("Frame") then
				tween_service
					:Create(
						v,
						TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{ BackgroundTransparency = 1 }
					)
					:Play()
			elseif v:IsA("ImageLabel") then
				tween_service
					:Create(
						v,
						TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{ ImageTransparency = 1 }
					)
					:Play()
			end
		end
	end)

	task.delay(cfg.time + 0.1, function()
		table.remove(library.notifications, table.find(library.notifications, holder))
		cfg:refresh_notifications()
		task.wait(0.5)
		holder:Destroy()
	end)

	table.insert(library.notifications, holder)
end

function library:tab(properties)
	local cfg = {
		name = properties.name or "tab",
		enabled = false,
	}

	-- Button
	local TAB_BUTTON = library:create("TextButton", {
		Parent = self.tab_holder,
		Name = "",
		FontFace = library.font,
		TextColor3 = themes.preset.unselected_text,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = cfg.name,
		TextStrokeTransparency = 0.5,
		BackgroundTransparency = 1,
		Size = UDim2.new(0.3330000042915344, -4, 0, 22),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local line = library:create("Frame", {
		Parent = TAB_BUTTON,
		Name = "",
		Position = UDim2.new(0, 0, 1, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 0, 2),
		BorderSizePixel = 0,
		BackgroundColor3 = rgb(57, 57, 57),
	})

	library:apply_theme(line, "accent", "BackgroundColor3")

	local glow = library:create("ImageLabel", {
		Parent = line,
		Name = "",
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -20, 0, -20),
		Size = UDim2.new(1, 40, 1, 40),
		ZIndex = 2,
		Visible = false,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})

	library:apply_theme(glow, "accent", "ImageColor3")

	local depth = library:create("Frame", {
		Parent = line,
		Name = "",
		BackgroundTransparency = 0.5,
		Position = UDim2.new(0, 0, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 0, 1),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})
	--

	-- Tab Instances
	local TAB = library:create("Frame", {
		Parent = self.tab_instance_holder,
		Name = "",
		Visible = false,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local scrolling_columns = library:create("Frame", {
		Parent = TAB,
		Name = "",
		ClipsDescendants = true,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 6, 0, 6),
		Size = UDim2.new(1, -12, 1, -12),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	cfg["column_holder"] = scrolling_columns

	local UIListLayout = library:create("UIListLayout", {
		Parent = scrolling_columns,
		Name = "",
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		Padding = UDim.new(0, 5),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local left = library:create("ScrollingFrame", {
		Parent = scrolling_columns,
		Name = "",
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		Active = true,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 0,
		Size = UDim2.new(0.5, -64, 1, 0),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 4, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 0),
	})

	left:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		if library.current_element_open then
			library.current_element_open.set_visible(false)
			library.current_element_open.open = false
			library.current_element_open = nil
		end
	end)

	cfg["left"] = left

	local UIListLayout = library:create("UIListLayout", {
		Parent = left,
		Name = "",
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local UIPadding = library:create("UIPadding", {
		Parent = left,
		Name = "",
		PaddingBottom = UDim.new(0, 15),
	})

	local right = library:create("ScrollingFrame", {
		Parent = scrolling_columns,
		Name = "",
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		Active = true,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 0,
		Size = UDim2.new(0.5, -64, 1, 0),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, -50, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 0),
	})

	right:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		if library.current_element_open then
			library.current_element_open.set_visible(false)
			library.current_element_open.open = false
			library.current_element_open = nil
		end
	end)

	cfg["right"] = right

	local UIListLayout = library:create("UIListLayout", {
		Parent = right,
		Name = "",
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local UIPadding = library:create("UIPadding", {
		Parent = right,
		Name = "",
		PaddingBottom = UDim.new(0, 15),
	})
	--

	function cfg.open_tab()
		if library.current_tab and library.current_tab[1] ~= TAB_BUTTON then
			local button = library.current_tab[1]
			button.TextColor3 = themes.preset.unselected_text

			local parent = button:FindFirstChildOfClass("Frame")
			parent.BackgroundColor3 = rgb(57, 57, 57)
			parent:FindFirstChildOfClass("ImageLabel").Visible = false

			library.current_tab[2].Visible = false
		end

		library.current_tab = {
			TAB_BUTTON,
			TAB,
		}

		line.BackgroundColor3 = themes.preset.accent
		glow.Visible = true
		TAB_BUTTON.TextColor3 = themes.preset.text
		TAB.Visible = true

		if library.current_element_open and library.current_element_open ~= cfg then
			library.current_element_open.set_visible(false)
			library.current_element_open.open = false
			library.current_element_open = nil
		end
	end

	TAB_BUTTON.MouseButton1Click:Connect(cfg.open_tab)

	return setmetatable(cfg, library)
end

function library:section(properties)
	local cfg = {
		name = properties.name or properties.Name or "Section",
		side = properties.side or properties.Side or "left",
	}

	-- Instances
	local section = library:create("Frame", {
		Parent = self[cfg.side],
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		ZIndex = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local section_inline = library:create("Frame", {
		Parent = section,
		Name = "",
		Position = UDim2.new(0, 0, 0, 4),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, 0, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local name = library:create("TextLabel", {
		Parent = section_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = cfg.name,
		TextStrokeTransparency = 0.5,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 8, 0, 0),
		ZIndex = 2,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local section = library:create("Frame", {
		Parent = section_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local elements = library:create("Frame", {
		Parent = section,
		Name = "",
		Position = UDim2.new(0, 12, 0, 12),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -24, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = elements,
		Name = "",
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0, 3),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = section,
		Name = "",
		PaddingBottom = UDim.new(0, 13),
	})
	--

	cfg["holder"] = elements

	return setmetatable(cfg, library)
end

function library:hitpart_picker(properties)
	local cfg = {
		name = properties.name or properties.Name or "Hitpart",
		side = properties.side or properties.Side or "left",
		flag = properties.flag or "Hitpart",
		default = properties.default or { "Head" },
		type_char = properties.type or "R6",
		multi = properties.multi or false,
		callback = properties.callback or function() end,
		previous_holder = self,
	}

	flags[cfg.flag] = {}

	local bodyparts = {}
	local bools = {}

	local r15_hitpart_holder = library:create("Frame", {
		Parent = self[cfg.side],
		Name = "",
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 0, 272),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local hitpart_inline = library:create("Frame", {
		Parent = r15_hitpart_holder,
		Name = "",
		Position = UDim2.new(0, 0, 0, 4),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, 0, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local hitpart = library:create("Frame", {
		Parent = hitpart_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	if cfg.type_char == "R15" then
		bodyparts.Head = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -25, 0, 16),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 50, 0, 44),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.UpperTorso = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -42, 0, 64),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 84, 0, 76),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LeftUpperArm = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -86, 0, 64),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 34),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.RightUpperArm = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, 46, 0, 64),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 34),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LeftUpperLeg = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -42, 0, 158),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 34),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LeftLowerLeg = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -42, 0, 196),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 42),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.RightFoot = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, 2, 0, 242),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 6),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LeftFoot = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -42, 0, 242),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 6),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.RightLowerLeg = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, 2, 0, 196),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 42),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.RightUpperLeg = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, 2, 0, 158),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 34),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LeftHand = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -86, 0, 148),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 6),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.RightHand = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, 46, 0, 148),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 6),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LowerTorso = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -42, 0, 144),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 84, 0, 10),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.RightLowerArm = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, 46, 0, 102),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 42),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LeftLowerArm = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -86, 0, 102),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 42),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		local outline = library:create("TextButton", {
			Text = "",
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -10, 0, 96),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 20, 0, 20),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(22, 22, 22),
		})

		bodyparts.HumanoidRootPart = library:create("TextButton", {
			Text = "",
			Parent = outline,
			Name = "",
			Position = UDim2.new(0, 4, 0, 4),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(1, -8, 1, -8),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})
	else
		bodyparts.Head = library:create("TextButton", {
			Parent = hitpart,
			Name = "",
			Text = "",
			Position = UDim2.new(0.5, -25, 0, 16),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 50, 0, 44),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.Torso = library:create("TextButton", {
			Parent = hitpart,
			Name = "",
			Text = "",
			Position = UDim2.new(0.5, -42, 0, 64),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 84, 0, 90),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LeftArm = library:create("TextButton", {
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -86, 0, 64),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 90),
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.RightArm = library:create("TextButton", {
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, 46, 0, 64),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 90),
			Text = "",
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.RightLeg = library:create("TextButton", {
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, 2, 0, 158),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 90),
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		bodyparts.LeftLeg = library:create("TextButton", {
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -42, 0, 158),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 40, 0, 90),
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})

		local hrp_out = library:create("TextButton", {
			Parent = hitpart,
			Name = "",
			Position = UDim2.new(0.5, -10, 0, 99),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 20, 0, 20),
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = Color3.fromRGB(22, 22, 22),
		})

		bodyparts.HumanoidRootPart = library:create("TextButton", {
			Parent = hrp_out,
			Name = "",
			Position = UDim2.new(0, 4, 0, 4),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(1, -8, 1, -8),
			BorderSizePixel = 0,
			Text = "",
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})
	end

	local name = library:create("TextLabel", {
		Parent = hitpart_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = cfg.name,
		TextStrokeTransparency = 0.5,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 8, 0, 0),
		ZIndex = 2,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	function cfg.set(parts)
		flags[cfg.flag] = {}
		for name, button in pairs(bodyparts) do
			bools[name] = false
			local glow = button:FindFirstChildOfClass("ImageLabel")
			if glow then
				glow.Visible = false
			end
			button.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
		end

		for _, part in pairs(parts) do
			if bodyparts[part] then
				bools[part] = true
				table.insert(flags[cfg.flag], part)
				local glow = bodyparts[part]:FindFirstChildOfClass("ImageLabel")
				if glow then
					glow.Visible = true
				end
				bodyparts[part].BackgroundColor3 = themes.preset.accent
			end
		end

		cfg.callback(flags[cfg.flag])
	end

	for name, button in next, bodyparts do
		bools[name] = false

		library:apply_theme(button, "accent", "BackgroundColor3")

		local glow = library:create("ImageLabel", {
			Parent = button,
			Name = "",
			Visible = false,
			ImageColor3 = themes.preset.accent,
			ScaleType = Enum.ScaleType.Slice,
			ImageTransparency = 0.8999999761581421,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Image = "http://www.roblox.com/asset/?id=18245826428",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, -20, 0, -20),
			Size = UDim2.new(1, 40, 1, 40),
			ZIndex = 2,
			BorderSizePixel = 0,
			SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
		})

		library:apply_theme(glow, "accent", "ImageColor3")

		library:connection(button.MouseButton1Click, function()
			if not cfg.multi then
				cfg.set({ name })
			else
				bools[name] = not bools[name]

				if bools[name] then
					table.insert(flags[cfg.flag], name)
				else
					local index = table.find(flags[cfg.flag], name)
					table.remove(flags[cfg.flag], index)
				end

				glow.Visible = bools[name]
				button.BackgroundColor3 = bools[name] and themes.preset.accent or Color3.fromRGB(38, 38, 38)

				cfg.callback(flags[cfg.flag])
			end
		end)
	end

	if #cfg.default > 1 and not cfg.multi then
		cfg.default = { cfg.default[1] }
	end

	cfg.set(cfg.default)
	config_flags[cfg.flag] = cfg.set
	return setmetatable(cfg, library)
end

function library:toggle(properties)
	local cfg = {
		enabled = properties.enabled or nil,
		name = properties.name or "Toggle",
		flag = properties.flag or tostring(math.random(1, 9999999)),
		callback = properties.callback or function() end,
		default = properties.default or false,
		previous_holder = self,
	}

	-- Instances
	local object = library:create("TextButton", {
		Parent = self.holder,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = cfg.name,
		TextStrokeTransparency = 0.5,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -26, 0, 12),
		ZIndex = 1,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local right_components = library:create("Frame", {
		Parent = object,
		Name = "",
		Position = UDim2.new(1, 15, 0, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local list = library:create("UIListLayout", {
		Parent = right_components,
		Name = "",
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		Padding = UDim.new(0, 3),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local icon_inline = library:create("TextButton", {
		Parent = object,
		Name = "",
		Position = UDim2.new(0, -15, 0, 1),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(0, 10, 0, 10),
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local icon = library:create("Frame", {
		Parent = icon_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local icon_2 = library:create("Frame", {
		Parent = icon,
		Name = "",
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = themes.preset.accent,
	})
	library:apply_theme(icon_2, "accent", "BackgroundColor3")

	local glow = library:create("ImageLabel", {
		Parent = icon_inline,
		Name = "",
		Visible = false,
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.75,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -12, 0, -12),
		Size = UDim2.new(1, 24, 1, 24),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})

	library:apply_theme(glow, "accent", "ImageColor3")

	local bottom_components = library:create("Frame", {
		Parent = object,
		Name = "",
		Visible = true,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Position = UDim2.new(0, 0, 0, 13),
		Size = UDim2.new(1, 26, 0, 0),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local list = library:create("UIListLayout", {
		Parent = bottom_components,
		Name = "",
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	--

	function cfg.set(bool)
		icon_2.Visible = bool
		glow.Visible = bool

		flags[cfg.flag] = bool

		cfg.callback(bool)
	end

	library:connection(object.MouseButton1Click, function()
		cfg.enabled = not cfg.enabled

		cfg.set(cfg.enabled)
	end)

	library:connection(icon_inline.MouseButton1Click, function()
		cfg.enabled = not cfg.enabled

		cfg.set(cfg.enabled)
	end)

	cfg.set(cfg.default)

	self.previous_holder = left_components
	self.bottom_holder = bottom_components
	self.right_holder = right_components

	config_flags[cfg.flag] = cfg.set

	return setmetatable(cfg, library)
end

function library:slider(properties)
	local cfg = {
		name = properties.name or nil,
		suffix = properties.suffix or "",
		flag = properties.flag or tostring(2 ^ 789),
		callback = properties.callback or function() end,

		min = properties.min or properties.minimum or 0,
		max = properties.max or properties.maximum or 100,
		intervals = properties.interval or properties.decimal or 1,
		default = properties.default or 10,

		dragging = false,
		value = properties.default or 10,

		previous_holder = self,
	}

	local bottom_components
	if cfg.name then
		object = library:create("TextLabel", {
			Parent = self.holder,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(170, 170, 170),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = cfg.name,
			TextStrokeTransparency = 0.5,
			Size = UDim2.new(1, -26, 0, 12),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		bottom_components = library:create("Frame", {
			Parent = object,
			Name = "",
			Visible = true,
			Position = UDim2.new(0, 0, 0, 13),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(1, 26, 0, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		local list = library:create("UIListLayout", {
			Parent = bottom_components,
			Name = "",
			Padding = UDim.new(0, 4),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})
	else
		self.bottom_holder.Parent.AutomaticSize = Enum.AutomaticSize.Y
		self.bottom_holder.Parent.TextYAlignment = Enum.TextYAlignment.Top
	end

	local slider_holder = library:create("Frame", {
		Parent = cfg.name and bottom_components or self.bottom_holder,
		Name = "",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local slider_inline = library:create("TextButton", {
		Parent = slider_holder,
		Name = "",
		Position = UDim2.new(0, 0, 0, 1),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -26, 0, 8),
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local fill_inline = library:create("Frame", {
		Parent = slider_inline,
		Name = "",
		Size = UDim2.new(0.5, 0, 1, 0),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(19, 19, 19),
	})

	local fill = library:create("Frame", {
		Parent = fill_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(1, 0, 1, -4),
		BackgroundColor3 = themes.preset.accent,
	})

	library:apply_theme(fill, "accent", "BackgroundColor3")
	library:apply_theme(fill, "accent", "BorderColor3")

	local VALUE_TEXT = library:create("TextLabel", {
		Parent = fill_inline,
		Name = "",
		RichText = true,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(0, 1, 0, 11),
		BackgroundTransparency = 1,
		Position = UDim2.new(1, 0, 0, 1),
		BorderSizePixel = 0,
		FontFace = library.font,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local glow = library:create("ImageLabel", {
		Parent = fill_inline,
		Name = "",
		ImageColor3 = themes.preset.accent,
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -18, 0, -18),
		Size = UDim2.new(1, 36, 1, 36),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})

	library:apply_theme(glow, "accent", "ImageColor3")

	local add = library:create("TextButton", {
		Parent = slider_inline,
		Name = "",
		TextWrapped = true,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "+",
		TextStrokeTransparency = 0.5,
		BackgroundTransparency = 1,
		Position = UDim2.new(1, 5, 0, -1),
		Size = UDim2.new(0, 8, 0, 8),
		FontFace = library.font,
		TextSize = 8,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local sub = library:create("TextButton", {
		Parent = slider_inline,
		Name = "",
		TextWrapped = true,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "-",
		TextStrokeTransparency = 0.5,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -15, 0, -1),
		Size = UDim2.new(0, 8, 0, 8),
		FontFace = library.font,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local slider = library:create("Frame", {
		Parent = slider_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local pad = library:create("UIPadding", {
		Parent = slider_holder,
		Name = "",
		PaddingBottom = UDim.new(0, -17),
	})

	function cfg.set(value)
		if type(value) ~= "number" then
			return
		end

		cfg.value = math.clamp(library:round(value, cfg.intervals), cfg.min, cfg.max)

		fill_inline.Size = dim2((cfg.value - cfg.min) / (cfg.max - cfg.min), 0, 1, 0)
		VALUE_TEXT.Text = tostring(cfg.value) .. cfg.suffix
		flags[cfg.flag] = cfg.value

		cfg.callback(flags[cfg.flag])
	end

	library:connection(uis.InputChanged, function(input)
		if cfg.dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local size_x = (input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X
			local value = ((cfg.max - cfg.min) * size_x) + cfg.min
			cfg.set(value)
		end
	end)

	library:connection(uis.InputEnded, function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			cfg.dragging = false
		end
	end)

	slider_inline.MouseButton1Down:Connect(function()
		cfg.dragging = true
	end)

	add.MouseButton1Down:Connect(function()
		cfg.value += cfg.intervals
		cfg.set(cfg.value)
	end)

	sub.MouseButton1Down:Connect(function()
		cfg.value -= cfg.intervals
		cfg.set(cfg.value)
	end)

	cfg.set(cfg.default)

	config_flags[cfg.flag] = cfg.set

	library.config_flags[cfg.flag] = cfg.set

	return setmetatable(cfg, library)
end

function library:dropdown(properties)
	local cfg = {
		name = properties.name or nil,
		flag = properties.flag or tostring(math.random(1, 9999999)),
		items = properties.items or { "1", "2", "3" },
		callback = properties.callback or function() end,
		multi = properties.multi or false,
		open = false,
		option_instances = {},
		multi_items = {},
		previous_holder = self,
	}
	cfg.default = properties.default or (cfg.multi and { cfg.items[1] }) or cfg.items[1] or nil

	local bottom_components
	local object
	if cfg.name then
		object = library:create("TextLabel", {
			Parent = self.holder,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(170, 170, 170),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = cfg.name,
			TextStrokeTransparency = 0.5,
			Size = UDim2.new(1, -26, 0, 12),
			BorderSizePixel = 0,
			ZIndex = 2,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		bottom_components = library:create("Frame", {
			Parent = object,
			Name = "",
			Visible = true,
			Position = UDim2.new(0, 0, 0, 13),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(1, 26, 0, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		local list = library:create("UIListLayout", {
			Parent = bottom_components,
			Name = "",
			Padding = UDim.new(0, 4),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})
	else
		self.bottom_holder.Parent.AutomaticSize = Enum.AutomaticSize.Y
		self.bottom_holder.Parent.TextYAlignment = Enum.TextYAlignment.Top
	end

	local dropdown_inline = library:create("Frame", {
		Parent = cfg.name and bottom_components or self.bottom_holder,
		Name = "",
		Position = UDim2.new(0, -15, 0, 2),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -26, 0, 16),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local dropdown = library:create("TextButton", {
		Parent = dropdown_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "",
		TextStrokeTransparency = 0.5,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.new(1, -4, 1, -4),
		Position = UDim2.new(0, 2, 0, 2),
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = dropdown,
		Name = "",
		PaddingLeft = UDim.new(0, 5),
	})

	local icon = library:create("TextLabel", {
		Parent = dropdown,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "+",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(0, 1, 1, 0),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Right,
		Position = UDim2.new(1, -6, 0, -1),
		BorderSizePixel = 0,
		TextSize = 8,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local content_inline = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(0, dropdown_inline.AbsoluteSize.X, 0, 0),
		Position = UDim2.new(
			0,
			dropdown_inline.AbsolutePosition.X,
			0,
			dropdown_inline.AbsolutePosition.Y + dropdown_inline.AbsoluteSize.Y + 2
		),
		BorderSizePixel = 0,
		ZIndex = 5,
		Visible = false,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	dropdown_inline:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
		content_inline.Position = UDim2.new(
			0,
			dropdown_inline.AbsolutePosition.X,
			0,
			dropdown_inline.AbsolutePosition.Y + dropdown_inline.AbsoluteSize.Y + 2
		)
	end)

	dropdown_inline:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		content_inline.Size = UDim2.new(0, dropdown_inline.AbsoluteSize.X, 0, 0)
	end)

	local content = library:create("Frame", {
		Parent = content_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local options = library:create("Frame", {
		Parent = content,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -4, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = options,
		Name = "",
		Padding = UDim.new(0, 2),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local UIPadding = library:create("UIPadding", {
		Parent = options,
		Name = "",
		PaddingBottom = UDim.new(0, 4),
	})

	function cfg.set_visible(bool)
		content_inline.Visible = bool
		icon.Text = bool and "-" or "+"
		icon.TextSize = bool and 12 or 8

		if cfg.name then
			object.ZIndex = bool and 9999 or 3
		end

		if bool then
			if library.current_element_open and library.current_element_open ~= cfg then
				library.current_element_open.set_visible(false)
				library.current_element_open.open = false
			end
			library.current_element_open = cfg
		end
	end

	function cfg.set(value)
		local selected = {}
		local is_table = type(value) == "table"

		for _, v in next, cfg.option_instances do
			local match = false
			if is_table then
				for _, val in next, value do
					if v.Text == tostring(val) then
						match = true
						break
					end
				end
			elseif v.Text == tostring(value) then
				match = true
			end

			if match then
				table.insert(selected, v.Text)
				v.BackgroundTransparency = 0
			else
				v.BackgroundTransparency = 1
			end
		end

		cfg.multi_items = selected
		dropdown.Text = table.concat(selected, ", ")
		flags[cfg.flag] = cfg.multi and selected or selected[1]
		cfg.callback(flags[cfg.flag])
	end

	function cfg:refresh_options(refreshed_list)
		for _, v in next, cfg.option_instances do
			v:Destroy()
		end
		cfg.option_instances = {}
		cfg.items = refreshed_list

		for i, v in next, refreshed_list do
			local op = library:create("TextButton", {
				Parent = options,
				Name = "",
				FontFace = library.font,
				TextColor3 = Color3.fromRGB(170, 170, 170),
				BorderColor3 = Color3.fromRGB(56, 56, 56),
				Text = tostring(v),
				BackgroundTransparency = 1,
				TextStrokeTransparency = 0.5,
				Size = UDim2.new(1, 0, 0, 14),
				TextXAlignment = Enum.TextXAlignment.Left,
				Position = UDim2.new(0, 2, 0, 2),
				BorderSizePixel = 0,
				TextSize = 12,
				BackgroundColor3 = Color3.fromRGB(65, 65, 65),
			})

			library:create("UIPadding", {
				Parent = op,
				Name = "",
				PaddingLeft = UDim.new(0, 5),
			})

			table.insert(cfg.option_instances, op)

			op.MouseButton1Down:Connect(function()
				if cfg.multi then
					local selected_index = table.find(cfg.multi_items, op.Text)
					if selected_index then
						table.remove(cfg.multi_items, selected_index)
					else
						table.insert(cfg.multi_items, op.Text)
					end
					cfg.set(cfg.multi_items)
				else
					cfg.set(op.Text)
					cfg.set_visible(false)
					cfg.open = false
				end
			end)
		end
	end

	function cfg:list(new_list)
		cfg:refresh_options(new_list)
		local current = flags[cfg.flag]
		if current then
			cfg.set(current)
		end
	end

	dropdown.MouseButton1Click:Connect(function()
		cfg.open = not cfg.open
		cfg.set_visible(cfg.open)
	end)

	cfg:refresh_options(cfg.items)
	cfg.set(cfg.default)
	library.config_flags[cfg.flag] = cfg.set

	return setmetatable(cfg, library)
end

function library:colorpicker(properties)
	local cfg = {
		name = properties.name or nil,
		flag = properties.flag or tostring(2 ^ 789),
		color = properties.color or properties.default or Color3.new(1, 1, 1), -- Default to white color if not provided
		alpha = properties.alpha or 1,
		callback = properties.callback or function() end,
		animation = "normal",
		saved_color,
		right_holder = self.right_holder or nil,
		holder = self.holder or nil,
	}

	flags[cfg.flag] = {}

	local dragging_sat = false
	local dragging_hue = false
	local dragging_alpha = false

	local h, s, v = cfg.color:ToHSV()
	local a = cfg.alpha

	-- Button Instances
	local right_components
	if cfg.name then
		local object = library:create("TextLabel", {
			Parent = self.holder,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(170, 170, 170),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = cfg.name,
			TextStrokeTransparency = 0.5,
			Size = UDim2.new(1, -26, 0, 12),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		right_components = library:create("Frame", {
			Parent = object,
			Name = "",
			Position = UDim2.new(1, 15, 0, 1),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 0, 1, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		local list = library:create("UIListLayout", {
			Parent = right_components,
			Name = "",
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, 3),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})
	end

	local icon_inline = library:create("TextButton", {
		Parent = cfg.name and right_components or self.right_holder,
		Name = "",
		Text = "",
		Size = UDim2.new(0, 16, 0, 10),
		Position = UDim2.new(0, -15, 0, 1),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		ZIndex = 3,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(9, 9, 44),
	})

	local icon = library:create("Frame", {
		Parent = icon_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(22, 22, 108),
		ZIndex = 2,
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(41, 41, 204),
	})

	local glow = library:create("ImageLabel", {
		Parent = icon_inline,
		Name = "",
		ImageColor3 = Color3.fromRGB(41, 41, 204),
		ScaleType = Enum.ScaleType.Slice,
		ImageTransparency = 0.8999999761581421,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Image = "http://www.roblox.com/asset/?id=18245826428",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, -20, 0, -20),
		Size = UDim2.new(1, 40, 1, 40),
		ZIndex = 2,
		BorderSizePixel = 0,
		SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79)),
	})
	--

	-- Colorpicker Instances
	local picker_inline = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		Size = UDim2.new(0, 142, 0, 146),
		Position = dim2(0, icon_inline.AbsolutePosition.X + 1, 0, icon_inline.AbsolutePosition.Y + 17),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		ZIndex = 9999,
		BorderSizePixel = 0,
		Visible = false,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local picker = library:create("Frame", {
		Parent = picker_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local sat_inline = library:create("TextButton", {
		Parent = picker,
		Name = "",
		Text = "",
		Position = UDim2.new(0, 4, 0, 4),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -8, 1, -50),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local sat = library:create("Frame", {
		Parent = sat_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(255, 0, 0),
	})

	local sat_white = library:create("Frame", {
		Parent = sat,
		Name = "",
		Size = UDim2.new(1, 0, 1, 0),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIGradient = library:create("UIGradient", {
		Parent = sat_white,
		Name = "",
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 1),
		}),
	})

	local sat_black = library:create("Frame", {
		Parent = sat_white,
		Name = "",
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIGradient = library:create("UIGradient", {
		Parent = sat_black,
		Name = "",
		Rotation = 90,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0),
		}),
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
		}),
	})

	local sat_black_cursor = library:create("Frame", {
		Parent = sat_black,
		Name = "",
		Position = UDim2.new(0.800000011920929, 0, 0.20000000298023224, 0),
		BorderColor3 = Color3.fromRGB(108, 22, 22),
		Size = UDim2.new(0, 1, 0, 1),
		BackgroundColor3 = Color3.fromRGB(204, 41, 41),
	})

	local preview_inline = library:create("Frame", {
		Parent = picker,
		Name = "",
		Position = UDim2.new(1, -20, 1, -20),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(0, 16, 0, 16),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(35, 35, 35),
	})

	local preview = library:create("Frame", {
		Parent = preview_inline,
		Name = "",
		BackgroundTransparency = 0,
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 2,
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(204, 41, 41),
	})

	local preview_image = library:create("ImageLabel", {
		Parent = preview_inline,
		Name = "",
		ScaleType = Enum.ScaleType.Tile,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Image = "http://www.roblox.com/asset/?id=18274452449",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(1, -4, 1, -4),
		TileSize = UDim2.new(0, 6, 0, 6),
		BorderSizePixel = 0,
		ZIndex = 3,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local hue_inline = library:create("TextButton", {
		Parent = picker,
		Text = "",
		Name = "",
		Position = UDim2.new(0, 4, 1, -44),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -8, 0, 10),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local hue_border = library:create("Frame", {
		Parent = hue_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local hue = library:create("Frame", {
		Parent = hue_border,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIGradient = library:create("UIGradient", {
		Parent = hue,
		Name = "",
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(0.16699999570846558, Color3.fromRGB(255, 255, 0)),
			ColorSequenceKeypoint.new(0.3330000042915344, Color3.fromRGB(0, 255, 0)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
			ColorSequenceKeypoint.new(0.6669999957084656, Color3.fromRGB(0, 0, 255)),
			ColorSequenceKeypoint.new(0.8330000042915344, Color3.fromRGB(255, 0, 255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
		}),
	})

	local hue_cursor = library:create("Frame", {
		Parent = hue,
		Name = "",
		BorderColor3 = Color3.fromRGB(108, 22, 22),
		Size = UDim2.new(0, 1, 1, 0),
		BackgroundColor3 = Color3.fromRGB(204, 41, 41),
	})

	local input_inline = library:create("Frame", {
		Parent = picker,
		Name = "",
		Position = UDim2.new(0, 4, 1, -20),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -26, 0, 16),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local __input = library:create("TextBox", {
		Parent = input_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "204, 41, 41, 0.5",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(1, -4, 1, -4),
		PlaceholderColor3 = Color3.fromRGB(90, 90, 90),
		Position = UDim2.new(0, 2, 0, 2),
		PlaceholderText = "r, g, b, a",
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local alpha_inline = library:create("TextButton", {
		Parent = picker,
		Name = "",
		Text = "",
		Position = UDim2.new(0, 4, 1, -32),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -8, 0, 10),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local alpha = library:create("Frame", {
		Parent = alpha_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(204, 41, 41),
	})

	local alpha_image = library:create("ImageLabel", {
		Parent = alpha,
		Name = "",
		ScaleType = Enum.ScaleType.Tile,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Image = "http://www.roblox.com/asset/?id=18343135386",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		TileSize = UDim2.new(0, 6, 0, 6),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIGradient = library:create("UIGradient", {
		Parent = alpha_image,
		Name = "",
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0),
		}),
	})

	local alpha_cursor = library:create("Frame", {
		Parent = alpha_image,
		Name = "",
		Position = UDim2.new(0.5, 0, 0, 0),
		BorderColor3 = Color3.fromRGB(108, 22, 22),
		Size = UDim2.new(0, 1, 1, 0),
		BackgroundColor3 = Color3.fromRGB(204, 41, 41),
	})

	--

	-- Animation Handling
	local content_inline = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(0, 73, 0, 0),
		Position = dim2(0, icon_inline.AbsolutePosition.X + 20, 0, icon_inline.AbsolutePosition.Y),
		BorderSizePixel = 0,
		ZIndex = 2,
		Visible = false,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local content = library:create("Frame", {
		Parent = content_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local options = library:create("Frame", {
		Parent = content,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -4, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = options,
		Name = "",
		Padding = UDim.new(0, 2),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local normal = library:create("TextButton", {
		Parent = options,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "normal",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(1, 0, 0, 12),
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 2, 0, 2),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(65, 65, 65),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = normal,
		Name = "",
		PaddingBottom = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 5),
	})

	local rainbow = library:create("TextButton", {
		Parent = options,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "rainbow",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(1, 0, 0, 12),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 2, 0, 2),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(65, 65, 65),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = rainbow,
		Name = "",
		PaddingBottom = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 5),
	})

	local fade = library:create("TextButton", {
		Parent = options,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "fade",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(1, 0, 0, 12),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 2, 0, 2),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(65, 65, 65),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = fade,
		Name = "",
		PaddingBottom = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 5),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = options,
		Name = "",
		PaddingBottom = UDim.new(0, 4),
	})

	local fade_alpha = library:create("TextButton", {
		Parent = options,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "fade alpha",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(1, 0, 0, 12),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 2, 0, 2),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(65, 65, 65),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = fade_alpha,
		Name = "",
		PaddingBottom = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 5),
	})
	--

	function cfg.set_visible(bool)
		picker_inline.Visible = bool
		content_inline.Visible = false

		if bool then
			if library.current_element_open and library.current_element_open ~= cfg then
				library.current_element_open.set_visible(false)
				library.current_element_open.open = false
			end

			library.current_element_open = cfg
		end

		picker_inline.Position = dim2(0, icon_inline.AbsolutePosition.X + 1, 0, icon_inline.AbsolutePosition.Y + 17)
		content_inline.Position = dim2(0, icon_inline.AbsolutePosition.X + 20, 0, icon_inline.AbsolutePosition.Y)
	end

	icon_inline.MouseButton1Click:Connect(function()
		cfg.open = not cfg.open

		cfg.set_visible(cfg.open)
	end)

	icon_inline.MouseButton2Click:Connect(function()
		if cfg.open then
			cfg.open = false
			cfg.set_visible(false)
		end

		content_inline.Visible = not content_inline.Visible

		picker_inline.Position = dim2(0, icon_inline.AbsolutePosition.X + 1, 0, icon_inline.AbsolutePosition.Y + 17)
		content_inline.Position = dim2(0, icon_inline.AbsolutePosition.X + 20, 0, icon_inline.AbsolutePosition.Y)
	end)

	function cfg.set(color, alpha)
		if color then
			h, s, v = color:ToHSV()
		else
			cfg.saved_color = hsv(s, s, v)
		end

		if alpha then
			a = alpha
		end

		local visual = alpha_inline:FindFirstChildOfClass("Frame")

		if not visual then
			return
		end

		local hsv_position = Color3.fromHSV(h, s, v)
		local Color = Color3.fromHSV(h, s, v)

		local value = h
		local offset = (value < 1) and 0 or -4
		hue_cursor.Position = dim2(value, offset, 0, 0)

		local offset = (a < 1) and 0 or -4
		alpha_cursor.Position = dim2(a, offset, 0, 0)

		visual.BackgroundColor3 = Color
		glow.ImageColor3 = Color

		local RGB_Format = visual.BackgroundColor3

		icon_inline.BackgroundColor3 = Color3.fromRGB(RGB_Format.R / 4, RGB_Format.G / 4, RGB_Format.B / 4)
		icon.BorderColor3 = Color3.fromRGB(
			math.floor((Color.R * 255) + 0.5) / 2,
			math.floor((Color.G * 255) + 0.5) / 2,
			math.floor((Color.B * 255) + 0.5) / 2
		)
		icon.BackgroundColor3 = Color

		__input.Text = math.floor(RGB_Format.R * 255)
			.. ", "
			.. math.floor(RGB_Format.G * 255)
			.. ", "
			.. math.floor(RGB_Format.B * 255)
			.. ", "
			.. library:round(a, 0.01)
		preview.BackgroundColor3 = Color
		preview_image.ImageTransparency = 1 - a

		sat.BackgroundColor3 = Color3.fromHSV(h, 1, 1)

		local s_offset = (s < 1) and 0 or -3
		local v_offset = (1 - v < 1) and 0 or -3
		sat_black_cursor.Position = dim2(s, s_offset, 1 - v, v_offset)

		cfg.color = Color
		cfg.alpha = a

		flags[cfg.flag] = {
			Color = Color,
			Transparency = a,
		}
		cfg.saved_color = hsv(s, s, v)

		cfg.callback(Color, a)
	end

	__input.FocusLost:Connect(function()
		local text = __input.Text
		local r, g, b, a = library:convert_string_rgb(text)

		if r and g and b and a then
			cfg.set(rgb(r, g, b), a)
		end
	end)

	function cfg.update_color()
		local mouse = uis:GetMouseLocation()

		if dragging_sat then
			s = math.clamp(
				(vec2(mouse.X, mouse.Y - gui_offset) - sat_white.AbsolutePosition).X / sat_white.AbsoluteSize.X,
				0,
				1
			)
			v = 1
				- math.clamp(
					(vec2(mouse.X, mouse.Y - gui_offset) - sat_black.AbsolutePosition).Y / sat_black.AbsoluteSize.Y,
					0,
					1
				)
		elseif dragging_hue then
			h = 1
				- math.clamp(
					1
						- (vec2(mouse.X, mouse.Y - gui_offset) - hue_inline.AbsolutePosition).X
							/ hue_inline.AbsoluteSize.X,
					0,
					1
				)
		elseif dragging_alpha then
			a = math.clamp(
				(vec2(mouse.X, mouse.Y - gui_offset) - alpha_inline.AbsolutePosition).X / alpha_inline.AbsoluteSize.X,
				0,
				1
			)
		end

		cfg.set(nil, nil)
	end

	alpha_inline.MouseButton1Down:Connect(function()
		dragging_alpha = true
	end)

	hue_inline.MouseButton1Down:Connect(function()
		dragging_hue = true
	end)

	sat_inline.MouseButton1Down:Connect(function()
		dragging_sat = true
	end)

	cfg.saved_color = hsv(h, s, v)
	local selected = normal
	flags[cfg.flag]["animation"] = "normal"

	rainbow.MouseButton1Down:Connect(function()
		selected.BackgroundTransparency = 1
		selected = "rainbow"
		rainbow.BackgroundTransparency = 0

		flags[cfg.flag]["animation"] = "rainbow"
		cfg.saved_color = hsv(s, s, v)
	end)

	fade_alpha.MouseButton1Down:Connect(function()
		selected.BackgroundTransparency = 1
		selected = "fade_alpha"
		fade_alpha.BackgroundTransparency = 0

		flags[cfg.flag]["animation"] = "fade_alpha"
		cfg.saved_color = hsv(s, s, v)
	end)

	fade.MouseButton1Down:Connect(function()
		selected.BackgroundTransparency = 1
		selected = "fade"
		fade.BackgroundTransparency = 0

		flags[cfg.flag]["animation"] = "fade"
		cfg.saved_color = hsv(s, s, v)
	end)

	normal.MouseButton1Down:Connect(function()
		selected.BackgroundTransparency = 1
		selected = "normal"
		normal.BackgroundTransparency = 0

		flags[cfg.flag]["animation"] = "normal"
		cfg.set(cfg.saved_color)
	end)

	uis.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging_sat = false
			dragging_hue = false
			dragging_alpha = false
		end
	end)

	uis.InputChanged:Connect(function(input)
		if
			(dragging_sat or dragging_hue or dragging_alpha)
			and input.UserInputType == Enum.UserInputType.MouseMovement
		then
			cfg.update_color()
		end
	end)

	cfg.set(cfg.color, cfg.alpha)

	self.previous_holder = parent

	library.config_flags[cfg.flag] = cfg.set

	task.spawn(function()
		while true do
			if selected ~= "normal" then
				cfg.set(
					hsv(
						selected == "rainbow" and library.sin or h,
						selected == "rainbow" and 1 or s,
						selected == "fade" and library.sin or v
					),
					selected == "fade_alpha" and library.sin
				)
			end
			task.wait()
		end
	end)

	return setmetatable(cfg, library)
end

function library:keybind(properties)
	local cfg = {
		flag = properties.flag or tostring(2 ^ math.random(1, 30) * 3),
		keybind_name = properties.keybind_name or nil,
		callback = properties.callback or function() end,
		open = false,
		binding = nil,
		name = properties.name or nil,
		key = properties.default or properties.key or nil,
		mode = properties.mode or "toggle",
		active = properties.default or false,
		display = properties.displayName or properties.display or properties.name or nil,
		hold_instances = {},
	}

	flags[cfg.flag] = {}

	local key = library:new_keybind({
		text = cfg.display,
		key = cfg.key,
		mode = cfg.mode,
	})

	-- Instances
	local right_components
	if cfg.name then
		local object = library:create("TextLabel", {
			Parent = self.holder,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(170, 170, 170),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = cfg.name,
			TextStrokeTransparency = 0.5,
			Size = UDim2.new(1, -26, 0, 12),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		right_components = library:create("Frame", {
			Parent = object,
			Name = "",
			Position = UDim2.new(1, 15, 0, 1),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0, 0, 1, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})

		local list = library:create("UIListLayout", {
			Parent = right_components,
			Name = "",
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, 3),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})
	end

	local keybind = library:create("TextButton", {
		Parent = cfg.name and right_components or self.right_holder,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = "ERROR",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(0, 16, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local content_inline = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(0, 57, 0, 0),
		Position = dim2(0, keybind.AbsolutePosition.X, 0, keybind.AbsolutePosition.Y - 5),
		BorderSizePixel = 0,
		ZIndex = 2,
		AutomaticSize = Enum.AutomaticSize.Y,
		Visible = false,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	keybind:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
		content_inline.Position = UDim2.new(0, keybind.AbsolutePosition.X, 0, keybind.AbsolutePosition.Y + 15)
	end)

	local content = library:create("Frame", {
		Parent = content_inline,
		Name = "",
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Size = UDim2.new(1, -4, 1, -4),
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	local options = library:create("Frame", {
		Parent = content,
		Name = "",
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 2, 0, 2),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, -4, 1, -4),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = options,
		Name = "",
		Padding = UDim.new(0, 2),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local press = library:create("TextButton", {
		Parent = options,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "press",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(1, 0, 0, 12),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 2, 0, 2),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(65, 65, 65),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = press,
		Name = "",
		PaddingBottom = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 5),
	})

	local hold = library:create("TextButton", {
		Parent = options,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "hold",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(1, 0, 0, 12),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 2, 0, 2),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(65, 65, 65),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = hold,
		Name = "",
		PaddingBottom = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 5),
	})

	local always = library:create("TextButton", {
		Parent = options,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "always",
		TextStrokeTransparency = 0.5,
		Size = UDim2.new(1, 0, 0, 12),
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Position = UDim2.new(0, 2, 0, 2),
		BorderSizePixel = 0,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(65, 65, 65),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = always,
		Name = "",
		PaddingBottom = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 5),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = options,
		Name = "",
		PaddingBottom = UDim.new(0, 4),
	})
	--

	function cfg.set_visible(bool)
		content_inline.Visible = bool

		if bool then
			if library.current_element_open and library.current_element_open ~= cfg then
				library.current_element_open.set_visible(false)
				library.current_element_open.open = false
			end

			library.current_element_open = cfg
		end
	end

	function cfg.set_mode(mode)
		cfg.mode = mode

		if mode == "always" then
			cfg.set(true)
		elseif mode == "hold" then
			cfg.set(false)
		end

		flags[cfg.flag] = {
			mode = cfg.mode,
			key = cfg.key,
			active = cfg.active,
		}

		flags[cfg.flag]["mode"] = mode
	end

	function cfg.set(input)
		if type(input) == "boolean" then
			local __cached = input

			if cfg.mode == "always" then
				__cached = true
			end

			cfg.active = __cached
			flags[cfg.flag]["active"] = __cached
			cfg.callback(__cached)

			flags[cfg.flag] = {
				mode = cfg.mode,
				key = cfg.key,
				active = cfg.active,
			}
		elseif tostring(input):find("Enum") then
			input = input.Name == "Escape" and "..." or input

			cfg.key = input or "..."

			local _text = keys[cfg.key] or tostring(cfg.key):gsub("Enum.", "")
			local _text2 = (tostring(_text):gsub("KeyCode.", ""):gsub("UserInputType.", "")) or "..."
			cfg.key_name = _text2

			flags[cfg.flag]["mode"] = cfg.mode
			flags[cfg.flag]["key"] = cfg.key

			keybind.Text = "[" .. string.lower(_text2) .. "]"

			cfg.callback(cfg.active or false)

			flags[cfg.flag] = {
				mode = cfg.mode,
				key = cfg.key,
				active = cfg.active,
			}
		elseif table.find({ "toggle", "hold", "always" }, input) then
			cfg.set_mode(input)

			if input == "always" then
				cfg.active = true
			end

			cfg.callback(cfg.active or false)

			flags[cfg.flag] = {
				mode = cfg.mode,
				key = cfg.key,
				active = cfg.active,
			}
		elseif type(input) == "table" then
			input.key = type(input.key) == "string" and input.key ~= "..." and library:convert_enum(input.key)
				or input.key

			input.key = input.key == Enum.KeyCode.Escape and "..." or input.key
			cfg.key = input.key or "..."

			cfg.mode = input.mode or "toggle"

			if input.active then
				cfg.active = input.active
			end

			flags[cfg.flag] = {
				mode = cfg.mode,
				key = cfg.key,
				active = cfg.active,
			}

			local text = tostring(cfg.key) ~= "Enums" and (keys[cfg.key] or tostring(cfg.key):gsub("Enum.", "")) or nil
			local __text = text and (tostring(text):gsub("KeyCode.", ""):gsub("UserInputType.", ""))

			keybind.Text = "[" .. string.lower(__text) .. "]" or "..."
			cfg.key_name = __text
		end

		if cfg.keybind_name then
			key.change_text(keybind.Text .. " " .. cfg.keybind_name .. " (" .. flags[cfg.flag].mode .. ")")
			key.set_visible(cfg.active)
		end
	end

	local selected

	hold.MouseButton1Click:Connect(function()
		if selected then
			selected.BackgroundTransparency = 1
		end
		selected = hold
		hold.BackgroundTransparency = 0

		cfg.set_mode("hold")
		cfg.set_visible(false)
		cfg.open = false

		key.update({
			text = cfg.display,
			key = cfg.key,
			mode = cfg.mode,
		})
	end)

	press.MouseButton1Click:Connect(function()
		if selected then
			selected.BackgroundTransparency = 1
		end
		selected = press
		press.BackgroundTransparency = 0

		cfg.set_mode("toggle")
		cfg.set_visible(false)
		cfg.open = false

		key.update({
			text = cfg.display,
			key = cfg.key,
			mode = cfg.mode,
		})
	end)

	always.MouseButton1Click:Connect(function()
		if selected then
			selected.BackgroundTransparency = 1
		end
		selected = always

		always.BackgroundTransparency = 0
		cfg.set_mode("always")
		cfg.set_visible(false)
		cfg.open = false

		key.update({
			text = cfg.display,
			key = cfg.key,
			mode = cfg.mode,
		})
	end)

	keybind.MouseButton2Click:Connect(function()
		cfg.open = not cfg.open

		cfg.set_visible(cfg.open)
	end)

	keybind.MouseButton1Down:Connect(function()
		task.wait()
		keybind.Text = "..."

		cfg.binding = library:connection(uis.InputBegan, function(input, game_event)
			if input.UserInputType == Enum.UserInputType.Keyboard then
				cfg.set(input.KeyCode)
			elseif
				input.UserInputType == Enum.UserInputType.MouseButton1
				or Enum.UserInputType.MouseButton2
				or Enum.UserInputType.MouseButton3
			then
				-- I put this giant elseif to avoid having "mousemovement" as a keybind

				cfg.set(input.UserInputType)
			end

			key.update({
				text = cfg.display,
				key = cfg.key,
				mode = cfg.mode,
			})
			cfg.binding:Disconnect()
			cfg.binding = nil
		end)
	end)

	library:connection(uis.InputBegan, function(input, game_event)
		if not game_event then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode == cfg.key then
					if cfg.mode == "toggle" then
						toggled = not toggled
						cfg.set(toggled)
					elseif cfg.mode == "hold" then
						cfg.set(true)
					end
				end
			else
				if input.UserInputType == cfg.key then
					if cfg.mode == "toggle" then
						toggled = not toggled
						cfg.set(toggled)
					elseif cfg.mode == "hold" then
						cfg.set(true)
					end
				end
			end
		end
	end)

	library:connection(uis.InputEnded, function(input, game_event)
		if game_event then
			return
		end

		local selected_key = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType

		if selected_key == cfg.key then
			if cfg.mode == "hold" then
				cfg.set(false)
			end
		end
	end)

	cfg.set({ mode = cfg.mode, active = cfg.active, key = cfg.key })
	key.update({
		text = cfg.display,
		key = cfg.key,
		mode = cfg.mode,
	})

	library.config_flags[cfg.flag] = cfg.set

	return setmetatable(cfg, library)
end

function library:button(properties)
	local cfg = {
		callback = properties.callback or function() end,
		name = properties.text or properties.name or "Button",
	}

	local button_inline = library:create("Frame", {
		Parent = self.holder,
		Name = "",
		Position = UDim2.new(0, -15, 0, 2),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -26, 0, 16),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local button = library:create("TextButton", {
		Parent = button_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = cfg.name,
		TextStrokeTransparency = 0.5,
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(1, -4, 1, -4),
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	button.MouseButton1Click:Connect(function()
		cfg.callback()
	end)

	return setmetatable(cfg, library)
end

function library:textbox(properties)
	local cfg = {
		placeholder = properties.placeholder
			or properties.placeholdertext
			or properties.holder
			or properties.holdertext
			or "type here...",
		default = properties.default,
		clear_on_focus = properties.clearonfocus or false,
		flag = properties.flag or "...",
		callback = properties.callback or function() end,
	}

	local textbox_inline = library:create("Frame", {
		Parent = self.holder,
		Name = "",
		Position = UDim2.new(0, -15, 0, 2),
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		Size = UDim2.new(1, -26, 0, 16),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(8, 8, 8),
	})

	local textbox = library:create("TextBox", {
		Parent = textbox_inline,
		Name = "",
		FontFace = library.font,
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(56, 56, 56),
		Text = "",
		TextStrokeTransparency = 0.5,
		Position = UDim2.new(0, 2, 0, 2),
		Size = UDim2.new(1, -4, 1, -4),
		ClearTextOnFocus = cfg.clear_on_focus,
		PlaceholderColor3 = Color3.fromRGB(90, 90, 90),
		CursorPosition = -1,
		PlaceholderText = cfg.placeholder,
		TextSize = 12,
		BackgroundColor3 = Color3.fromRGB(38, 38, 38),
	})

	textbox:GetPropertyChangedSignal("Text"):Connect(function()
		flags[cfg.flag] = textbox.text
		cfg.callback(textbox.text)
	end)

	function cfg.set(text)
		flags[cfg.flag] = text
		textbox.Text = text
		cfg.callback(text)
	end

	if cfg.default then
		cfg.set(cfg.default)
	end

	library.config_flags[cfg.flag] = cfg.set

	return setmetatable(cfg, library)
end

function library:panel(properties)
	if library.__panel == true then
		return
	end

	library.__panel = true

	local cfg = {
		name = properties.name or "Are you sure?",
		options = properties.options or { "Confirm", "Discard" },
		callback = properties.callback or function() end,
	}

	local panel_main_frame = library:create("Frame", {
		Parent = library.gui,
		Name = "",
		BackgroundTransparency = 0.4000000059604645,
		Size = UDim2.new(1, 0, 1, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = 3,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	})

	local holder = library:create("Frame", {
		Parent = panel_main_frame,
		Name = "",
		BorderColor3 = Color3.fromRGB(19, 19, 19),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		ZIndex = 4,
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	})

	local inline1 = library:create("Frame", {
		Parent = holder,
		Name = "",
		BorderColor3 = Color3.fromRGB(8, 8, 8),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(56, 56, 56),
	})

	local main = library:create("Frame", {
		Parent = inline1,
		Name = "",
		Position = UDim2.new(0, 4, 0, 4),
		BorderColor3 = Color3.fromRGB(26, 26, 26),
		Size = UDim2.new(1, -8, 1, -8),
		BorderSizePixel = 2,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
	})

	local UIStroke = library:create("UIStroke", {
		Parent = main,
		Name = "",
		Color = Color3.fromRGB(57, 57, 57),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local tabs = library:create("Frame", {
		Parent = main,
		Name = "",
		Position = UDim2.new(0, 8, 0, 8),
		BorderColor3 = Color3.fromRGB(8, 8, 8),
		Size = UDim2.new(1, -16, 1, -16),
		BorderSizePixel = 2,
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
	})

	local UIStroke = library:create("UIStroke", {
		Parent = tabs,
		Name = "",
		Color = Color3.fromRGB(57, 57, 57),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local UIPadding = library:create("UIPadding", {
		Parent = tabs,
		Name = "",
		PaddingTop = UDim.new(0, 5),
		PaddingBottom = UDim.new(0, 22),
		PaddingRight = UDim.new(0, 20),
		PaddingLeft = UDim.new(0, 20),
	})

	local aimbot = library:create("TextLabel", {
		Parent = tabs,
		Name = "",
		FontFace = library.font,
		LineHeight = 1.2000000476837158,
		TextStrokeTransparency = 0.5,
		AnchorPoint = Vector2.new(0.5, 0),
		TextSize = 12,
		Size = UDim2.new(0, 0, 0, 11),
		TextColor3 = Color3.fromRGB(170, 170, 170),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = cfg.name,
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0, 8),
		BorderSizePixel = 0,
		TextYAlignment = Enum.TextYAlignment.Top,
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = aimbot,
		Name = "",
		PaddingTop = UDim.new(0, 6),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = tabs,
		Name = "",
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0, 4),
	})

	local Frame = library:create("Frame", {
		Parent = tabs,
		Name = "",
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})

	local UIListLayout = library:create("UIListLayout", {
		Parent = Frame,
		Name = "",
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0, 3),
	})

	local UIPadding = library:create("UIPadding", {
		Parent = Frame,
		Name = "",
	})

	-- local textbox_inline = library:create("Frame", {
	--     Parent = Frame,
	--     Name = "",
	--     Position = UDim2.new(0, -15, 0, 2),
	--     BorderColor3 = Color3.fromRGB(19, 19, 19),
	--     Size = UDim2.new(0, 130, 0, 16),
	--     BorderSizePixel = 0,
	--     BackgroundColor3 = Color3.fromRGB(8, 8, 8)
	-- })

	-- local textbox = library:create("TextBox", {
	--     Parent = textbox_inline,
	--     Name = "",
	--     FontFace = library.font,
	--     TextColor3 = Color3.fromRGB(170, 170, 170),
	--     BorderColor3 = Color3.fromRGB(56, 56, 56),
	--     Text = "",
	--     TextStrokeTransparency = 0.5,
	--     Size = UDim2.new(1, -4, 1, -4),
	--     PlaceholderColor3 = Color3.fromRGB(90, 90, 90),
	--     Position = UDim2.new(0, 2, 0, 2),
	--     PlaceholderText = "name",
	--     TextSize = 12,
	--     BackgroundColor3 = Color3.fromRGB(38, 38, 38)
	-- })
	for _, v in next, cfg.options do
		local button_inline = library:create("Frame", {
			Parent = Frame,
			Name = "",
			Position = UDim2.new(0, 0, 0, 4),
			BorderColor3 = Color3.fromRGB(19, 19, 19),
			Size = UDim2.new(0, 130, 0, 16),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(8, 8, 8),
		})
		local button = library:create("TextButton", {
			Parent = button_inline,
			Name = "",
			FontFace = library.font,
			TextColor3 = Color3.fromRGB(170, 170, 170),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			Text = v,
			TextStrokeTransparency = 0.5,
			Position = UDim2.new(0, 2, 0, 2),
			Size = UDim2.new(1, -4, 1, -4),
			TextSize = 12,
			BackgroundColor3 = Color3.fromRGB(38, 38, 38),
		})
		button.MouseButton1Click:Connect(function()
			cfg.callback(v)
			panel_main_frame:Destroy()
			library.__panel = false
		end)
	end
end
return library
]==];local v1=(function() local v38=loadstring(v0)();local v39=UDim2.new;local v40=Color3.fromRGB;local v41={Unloaded=false,_unload={}};v41.AccentColor=v40(255,128,0);v41.MainColor=v40(35,35,47);v41.OutlineColor=v40(32,32,38);v41.BackgroundColor=v40(26,26,26);v41.FontColor=v40(170,170,170);v41.ScreenGui=v38.gui;v41.font=v38.font;local v51=getgenv().Toggles or {} ;local v52=getgenv().Options or {} ;getgenv().Toggles,getgenv().Options=v51,v52;setmetatable(v51,{__index=function() return {Value=false,SetValue=function() end,SetValues=function() end,OnChanged=function() end};end});setmetatable(v52,{__index=function() return {Value=0,SetValue=function() end,SetValues=function() end,SetValueRGB=function() end,OnChanged=function() end};end});local v55=false;local v56=false;local v57={};local v58={};local v59={};local function v60(v474) for v1632,v1633 in ipairs(v59[v474] or {} ) do pcall(v1633);end end local function v61(v475) v56=true;local v476,v477=pcall(v475);v56=false;local v478=v57;local v479=v58;v57={};v58={};for v1634,v1635 in pairs(v478) do pcall(v1634,table.unpack(v1635,1,v1635.n));end for v1636 in pairs(v479) do v60(v1636);end return v476,v477;end local function v62() end local function v63(v480) v480=v480 or v62 ;return function(...) if v55 then return;end if v56 then v57[v480]=table.pack(...);return;end return v480(...);end;end local function v64(v481,v482) v482=v482 or v62 ;return function(...) if v55 then return;end if v56 then v57[v482]=table.pack(...);v58[v481]=true;return;end v482(...);v60(v481);end;end local function v65(v483,v484,v485,v486) local v487=setmetatable({},{__index=function(v1637,v1638) if (v1638=="Value") then if v486 then return v486();end return v38.flags[v484];end return nil;end});v487.SetValue=function(v1639,v1640) if v485 then v485(v1640);end end;v487.SetValues=function(v1641,v1642) warn("SetValues: nicht umgebaut: "   .. tostring(v484) );end;v487.OnChanged=function(v1643,v1644) v59[v484]=v59[v484] or {} ;table.insert(v59[v484],v1644);end;v487.SetValueRGB=function(v1646,v1647) if v485 then v485(v1647);end end;v483[v484]=v487;end local function v66(v493) if (typeof(v493)=="EnumItem") then return v493;end if ((type(v493)=="string") and (v493~="")) then local v2670,v2671=pcall(function() return Enum.KeyCode[v493];end);if (v2670 and v2671) then return v2671;end v2670,v2671=pcall(function() return Enum.UserInputType[v493];end);if (v2670 and v2671) then return v2671;end end return nil;end local v67={};local v68=v40(255,128,0);local function v69(v494,v495) if (string.sub(tostring(v494),1,6)=="Theme_") then return v495.Default;end return v68;end local function v70(v496,v497) return function(v1648,...) v67[v496]=v1648;if (v497 and  not v55) then if v56 then v57[v497]=table.pack(v1648,...);v58[v496]=true;else v497(v1648,...);v60(v496);end end end;end local v71={};v71.__index=v71;v71.AddColorPicker=function(v498,v499,v500) v500=v500 or {} ;local v501=v498.sec:colorpicker({flag=v499,color=v69(v499,v500),alpha=(v500.Transparency and (1 -v500.Transparency)) or 1 ,callback=v70(v499,v500.Callback)});v67[v499]=v69(v499,v500);v65(v52,v499,function(v1650) if v501.set then v501.set(v1650);end end,function() return v67[v499] or v69(v499,v500) ;end);pcall(v500.Callback or v62 ,v69(v499,v500));return v498;end;v71.AddKeyPicker=function(v503,v504,v505) v505=v505 or {} ;local v506=string.lower(v505.Mode or "toggle" );local v507=v63(v505.Callback);local v508=v507;if v503.toggleSet then function v508(v3028) if (v55 or v56) then return;end if (v506=="hold") then v503.toggleSet((v3028 and true) or false );elseif (v3028~=false) then v503.toggleSet( not v503.toggleGet());end v507(v3028);end end v503.sec:keybind({name=v505.Text,flag=v504,key=v66(v505.Default),mode=v506,callback=v508});v65(v52,v504,nil);return v503;end;v71.SetupDependencies=function(v509) return v509;end;local v76={};v76.__index=v76;v76.AddColorPicker=function(v510,v511,v512) v510.inst:Destroy();v512=v512 or {} ;local v513=v510.sec:colorpicker({name=v510.text,flag=v511,color=v69(v511,v512),alpha=(v512.Transparency and (1 -v512.Transparency)) or 1 ,callback=v70(v511,v512.Callback)});v67[v511]=v69(v511,v512);v65(v52,v511,function(v1651) if v513.set then v513.set(v1651);end end,function() return v67[v511] or v69(v511,v512) ;end);pcall(v512.Callback or v62 ,v69(v511,v512));return setmetatable({sec=v510.sec,flag=v511},v71);end;v76.SetText=function(v515,v516) v515.inst.Text=v516;v515.text=v516;end;v76.AddKeyPicker=function(v519,v520,v521) return setmetatable({sec=v519.sec,flag=v520},v71):AddKeyPicker(v520,v521);end;local v81={};v81.__index=v81;local function v83(v522) return setmetatable({sec=v522},v81);end v81.AddToggle=function(v523,v524,v525) v525=v525 or {} ;local v526=v523.sec:toggle({name=v525.Text or tostring(v524) ,flag=v524,default=v525.Default or false ,callback=v64(v524,v525.Callback)});v65(v51,v524,function(v1652) v526.set(v1652);end);local v527=setmetatable({sec=v523.sec,flag=v524,toggleSet=function(v1653) v526.set(v1653);end,toggleGet=function() return (v38.flags[v524] and true) or false ;end},v71);local v528=v51[v524];v528.AddKeyPicker=function(v1654,v1655,v1656) return v527:AddKeyPicker(v1655,v1656);end;v528.AddColorPicker=function(v1657,v1658,v1659) return v527:AddColorPicker(v1658,v1659);end;return v527;end;v81.AddSlider=function(v531,v532,v533) v533=v533 or {} ;local v534=v533.Rounding or 0 ;local v535=v531.sec:slider({name=v533.Text,flag=v532,min=v533.Min or 0 ,max=v533.Max or 100 ,interval=((v534==0) and 1) or (10^ -v534) ,default=v533.Default or v533.Min or 0 ,suffix=v533.Suffix or "" ,callback=v64(v532,v533.Callback)});v65(v52,v532,function(v1660) v535.set(v1660);end);return setmetatable({sec=v531.sec,flag=v532},v71);end;v81.AddDropdown=function(v536,v537,v538) v538=v538 or {} ;local v539=v538.Values or {} ;local v540=v538.Default;if (type(v540)=="number") then v540=v539[v540];end local v541=v536.sec:dropdown({name=v538.Text,flag=v537,items=v539,default=v540,multi=v538.Multi or false ,callback=v64(v537,v538.Callback)});v65(v52,v537,function(v1661) if v541.set then v541.set(v1661);end end);return setmetatable({sec=v536.sec,flag=v537},v71);end;v81.AddInput=function(v542,v543,v544) v544=v544 or {} ;local v545=v542.sec:textbox({flag=v543,placeholder=v544.Placeholder,default=v544.Default,callback=v64(v543,v544.Callback)});v65(v52,v543,function(v1662) if v545.set then v545.set(v1662);end end);return setmetatable({sec=v542.sec,flag=v543},v71);end;v81.AddButton=function(v546,v547) v547=v547 or {} ;v546.sec:button({text=v547.Text or "button" ,callback=v63(v547.Func)});return v546;end;v81.AddLabel=function(v548,v549) local v550=v38:create("TextLabel",{Parent=v548.sec.holder,Name="",BackgroundTransparency=1,FontFace=v38.font,TextColor3=v40(170,170,170),TextSize=12,TextStrokeTransparency=0.5,TextXAlignment=Enum.TextXAlignment.Left,Text=tostring(v549 or "" ),Size=v39(1, -26,0,12)});return setmetatable({sec=v548.sec,inst=v550,text=v549},v76);end;v81.AddDivider=function(v551) v38:create("Frame",{Parent=v551.sec.holder,Name="",BackgroundColor3=v40(56,56,56),BorderSizePixel=0,Size=v39(1, -26,0,1)});return v551;end;v81.AddDependencyBox=function(v552) return v83(v552.sec);end;v81.SetupDependencies=function(v553) return v553;end;v81.AddKeyPicker=function(v554,v555,v556) return setmetatable({sec=v554.sec,flag=v555},v71):AddKeyPicker(v555,v556);end;local v94={};v94.__index=v94;v94.AddTab=function(v557,v558) return v83(v557.tab:section({name=v558,side=v557.side}));end;local v97={};v97.__index=v97;v97.AddLeftGroupbox=function(v559,v560) return v83(v559.tab:section({name=v560,side="left"}));end;v97.AddRightGroupbox=function(v561,v562) return v83(v561.tab:section({name=v562,side="right"}));end;v97.AddLeftTabbox=function(v563) return setmetatable({tab=v563.tab,side="left"},v94);end;v97.AddRightTabbox=function(v564) return setmetatable({tab=v564.tab,side="right"},v94);end;local v103={};v103.__index=v103;v103.AddTab=function(v565,v566) return setmetatable({tab=v565.win:tab({name=v566})},v97);end;v41.CreateWindow=function(v567,v568) v568=v568 or {} ;local v569=v38:window({name=v568.Title or v568.title or "teddyhub" ,size=v39(0,500,0,650)});return setmetatable({win=v569},v103);end;v41.Notify=function(v570,v571,v572) v38:notification({text=tostring(v571),time=v572 or 5 });end;v41.OnUnload=function(v573,v574) table.insert(v573._unload,v574);end;v41.Unload=function(v575) if v575.Unloaded then return;end v575.Unloaded=true;for v1663,v1664 in ipairs(v575._unload) do pcall(v1664);end pcall(function() v38:unload();end);end;local v110=v38:create("TextLabel",{Parent=v38.gui,Name="",BackgroundColor3=v40(20,20,20),BackgroundTransparency=0.2,BorderSizePixel=0,FontFace=v38.font,TextColor3=v41.FontColor,TextSize=12,TextStrokeTransparency=0.5,Position=v39(0,8,0,8),Size=v39(0,0,0,18),AutomaticSize=Enum.AutomaticSize.X,Text="",ZIndex=50,Visible=false});v41.SetWatermark=function(v577,v578) v110.Text=" "   .. tostring(v578)   .. " " ;end;v41.SetWatermarkVisibility=function(v580,v581) v110.Visible=false;end;local v113=setmetatable({},{__index=function(v583) return function() return v583;end;end});local function v114(v584,v585) for v1665,v1666 in pairs(v584) do if ((type(v1666)=="function") and (string.sub(tostring(v1665),1,2)~="__")) then v584[v1665]=function(...) local v3291=v55;v55=true;local v3292=table.pack(pcall(v1666,...));v55=v3291;if v3292[1] then return table.unpack(v3292,2,v3292.n);end v41:Notify(v585   .. ":"   .. tostring(v1665)   .. " -> "   .. tostring(v3292[2]) ,12);return v113;end;end end end v114(v81,"group");v114(v71,"element");v114(v76,"label");v114(v97,"tab");v114(v94,"tabbox");v114(v103,"window");local v115={aim={enabled=false,center=v40(255,128,0),edge=v40(255,128,0),transparency=0.6},sil={enabled=false,center=v40(255,128,0),edge=v40(255,128,0),transparency=0.6}};v41.FillState=v115;v41.FillRings=function(v586) local v587={};for v1667=1,v586 do local v1668,v1669=pcall(function() return Drawing.new("Circle");end);if (v1668 and v1669) then v1669.Filled=true;v1669.NumSides=48;v1669.Thickness=1;v1669.Visible=false;v587[v1667]=v1669;end end return v587;end;v41.UpdateFill=function(v588,v589,v590,v591,v592) if  not v588 then return;end local v593= #v588;for v1670,v1671 in ipairs(v588) do local v1672=(v589 and v592.enabled and true) or false ;v1671.Visible=v1672;if v1672 then v1671.Position=v590;v1671.Radius=v591 * (1 -((v1670-1)/v593)) ;local v3037=(v1670-1)/math.max(v593-1 ,1) ;v1671.Color=v592.edge:Lerp(v592.center,v3037);v1671.Transparency=v592.transparency;end end end;local v119=function(v594) return v594;end;local v120=setmetatable({},{__index=function() return v119;end});local v121=setmetatable({},{__index=function() return v119;end});local v122="TeddyHub/Config";local v123=v122   .. "/autoload.txt" ;local function v124(v595) return v122   .. "/"   .. v595   .. ".json" ;end local function v125(v596) return (v596~=nil) and (v596~="") and  not v596:find('[/\\:*?\"<>|]') ;end local function v126() local v597={};if listfiles then local v2673,v2674=pcall(listfiles,v122);if (v2673 and v2674) then for v3479,v3480 in ipairs(v2674) do local v3481=tostring(v3480):match("([^/\\]+)%.json$");if (v3481 and (v3481~="autoload")) then table.insert(v597,v3481);end end end end table.sort(v597);return v597;end v121.BuildConfigSection=function(v598,v599) if makefolder then pcall(makefolder,"TeddyHub");pcall(makefolder,v122);end local v600=v599:AddRightGroupbox("configs");local v601="default";local v602;local v603=v600:AddLabel("saved: ...");local v604=v38:create("Frame",{Parent=v600.sec.holder,Name="",BackgroundTransparency=1,BorderSizePixel=0,Size=v39(1, -26,0,0),AutomaticSize=Enum.AutomaticSize.Y});v38:create("UIListLayout",{Parent=v604,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,2)});local function v605(v1674) for v2675,v2676 in ipairs(v604:GetChildren()) do if v2676:IsA("TextButton") then v2676:Destroy();end end for v2677,v2678 in ipairs(v1674) do local v2679=v2678==v601 ;local v2680=v38:create("TextButton",{Parent=v604,Name="",AutoButtonColor=false,FontFace=v38.font,Text=v2678,TextSize=12,TextStrokeTransparency=0.5,TextColor3=(v2679 and v41.AccentColor) or v41.FontColor ,BackgroundColor3=(v2679 and v40(48,48,56)) or v40(38,38,38) ,BorderColor3=v40(56,56,56),BorderSizePixel=1,Size=v39(1,0,0,18)});v2680.MouseButton1Click:Connect(function() v601=v2678;pcall(function() v52.ConfigName:SetValue(v2678);end);v605(v1674);end);end end local function v606(v1675) v41:Notify(v1675,4);end function v602() local v1676=v126();v605(v1676);local v1677=(readfile and isfile and isfile(v123) and readfile(v123):match("^%s*(.-)%s*$")) or "" ;local v1678=(( #v1676>0) and table.concat(v1676,", ")) or "none" ;v603:SetText("saved: "   .. v1678   .. (((v1677~="") and ("  |  autoload: "   .. v1677)) or "") );end local function v607(v1679,v1680) if  not v125(v1679) then v606("invalid config name");return;end if ( not v1680 and isfile and isfile(v124(v1679))) then v606("'"   .. v1679   .. "' exists, use save to overwrite" );return;end local v1681,v1682=pcall(function() writefile(v124(v1679),v38:get_config());end);v606((v1681 and ("saved "   .. v1679)) or ("save failed: "   .. tostring(v1682)) );v602();end local function v608(v1683) if ( not v125(v1683) or  not (isfile and isfile(v124(v1683)))) then v606("config '"   .. tostring(v1683)   .. "' not found" );return;end local v1684,v1685=v61(function() v38:load_config(readfile(v124(v1683)));end);v606((v1684 and ("loaded "   .. v1683)) or ("load failed: "   .. tostring(v1685)) );end local function v609(v1686) if ( not v125(v1686) or  not (isfile and isfile(v124(v1686)))) then v606("config '"   .. tostring(v1686)   .. "' not found" );return;end local v1687,v1688=pcall(function() delfile(v124(v1686));end);if (v1687 and readfile and isfile and isfile(v123) and (readfile(v123):match("^%s*(.-)%s*$")==v1686)) then pcall(writefile,v123,"");end v606((v1687 and ("deleted "   .. v1686)) or ("delete failed: "   .. tostring(v1688)) );v602();end v600:AddInput("ConfigName",{Text="name",Default="default",Placeholder="config name",Callback=function(v1689) v601=v1689;end});v600:AddButton({Text="save / overwrite",Func=function() v607(v601,true);end});v600:AddButton({Text="create new",Func=function() v607(v601,false);end});v600:AddButton({Text="load",Func=function() v608(v601);end});v600:AddButton({Text="delete",Func=function() v609(v601);end});v600:AddButton({Text="set autoload",Func=function() if  not v125(v601) then v606("invalid config name");return;end pcall(writefile,v123,v601);v606("autoload: "   .. v601 );v602();end});v600:AddButton({Text="clear autoload",Func=function() pcall(writefile,v123,"");v606("autoload cleared");v602();end});v600:AddButton({Text="refresh list",Func=v602});v602();local v610=v599:AddLeftGroupbox("menu theme");local v611={accent=v40(255,128,0),outline=v40(32,32,38),inline=v40(60,55,75),contrast=v40(35,35,47),text=v40(170,170,170),unselected_text=v40(90,90,90)};local v612={};for v1690,v1691 in pairs(v611) do v612[v1690]=v1691;end local v613={"BackgroundColor3","TextColor3","BorderColor3","Color","ImageColor3","ScrollBarImageColor3"};local function v614(v1693,v1694) return (math.abs(v1693.R-v1694.R )<0.02) and (math.abs(v1693.G-v1694.G )<0.02) and (math.abs(v1693.B-v1694.B )<0.02) ;end local function v615(v1695,v1696) if (v1695==v1696) then return;end local v1697={v38.gui};for v2681,v2682 in ipairs(getgenv().__themeRoots or {} ) do table.insert(v1697,v2682);end for v2683,v2684 in ipairs(v1697) do for v3041,v3042 in ipairs(v2684:GetDescendants()) do for v3293,v3294 in ipairs(v613) do local v3295,v3296=pcall(function() return v3042[v3294];end);if (v3295 and (typeof(v3296)=="Color3") and v614(v3296,v1695)) then pcall(function() v3042[v3294]=v1696;end);end end end end end local function v616(v1698,v1699) v615(v611[v1698],v1699);v611[v1698]=v1699;if (v1698=="accent") then v41.AccentColor=v1699;end if (v1698=="text") then v41.FontColor=v1699;end end local v617={"accent","outline","inline","contrast","text","unselected_text"};for v1701,v1702 in ipairs(v617) do v610:AddLabel(v1702):AddColorPicker("Theme_"   .. v1702 ,{Default=v612[v1702],Callback=function(v2685) v616(v1702,v2685);end});end v610:AddButton({Text="reset theme",Func=function() for v2686,v2687 in ipairs(v617) do v52["Theme_"   .. v2687 ]:SetValueRGB(v612[v2687]);v616(v2687,v612[v2687]);end end});local v618;v610:AddSlider("Menu_Scale",{Text="menu scale",Default=125,Min=80,Max=160,Rounding=0,Callback=function(v1703) v618(v1703/100 );end});local v619=v599:AddLeftGroupbox("keybind list");local v620=v38.keybind_path;local v621=(v620 and v620.BackgroundTransparency) or 1 ;local v622=(v620 and v620.Position) or UDim2.new(0,0,0,0) ;local function v623(v1704) if v620 then pcall(v1704,v620);end end local function v624() local v1705=v620;if  not v1705 then return nil;end while v1705.Parent and (v1705.Parent~=v38.gui)  do v1705=v1705.Parent;end return v1705;end local v625=math.floor(((1 -v621) * 100) + 0.5 );local v626=math.floor(v622.X.Offset);local v627=math.floor(v622.Y.Offset);v619:AddToggle("KB_Show",{Text="show keybinds",Default=false,Callback=function(v1706) local v1707=v624();if v1707 then v1707.Visible=v1706;end v623(function(v2689) v2689.Visible=v1706;end);end});v619:AddSlider("KB_Opacity",{Text="opacity",Default=v625,Min=0,Max=100,Rounding=0,Callback=function(v1708) v623(function(v2691) v2691.BackgroundTransparency=1 -(v1708/100) ;end);end});v619:AddSlider("KB_X",{Text="x",Default=v626,Min=0,Max=1900,Rounding=0,Callback=function(v1709) v623(function(v2693) v2693.Position=UDim2.new(v622.X.Scale,v1709,v622.Y.Scale,v2693.Position.Y.Offset);end);end});v619:AddSlider("KB_Y",{Text="y",Default=v627,Min=0,Max=1000,Rounding=0,Callback=function(v1710) v623(function(v2695) v2695.Position=UDim2.new(v2695.Position.X.Scale,v2695.Position.X.Offset,v622.Y.Scale,v1710);end);end});v619:AddButton({Text="reset keybind list",Func=function() v52.KB_Opacity:SetValue(v625);v52.KB_X:SetValue(v626);v52.KB_Y:SetValue(v627);v51.KB_Show:SetValue(true);end});local v628=false;local function v629() if  not v620 then return;end pcall(function() for v3046,v3047 in ipairs(v620:GetDescendants()) do if (v3047:IsA("TextLabel") and string.match(v3047.Text,"%]%s*(%S+)%s*%(")) then local v3482=v3047;while v3482.Parent and (v3482.Parent~=v620)  do v3482=v3482.Parent;end v3482.Visible=true;end end end);end v619:AddToggle("KB_OnlyEnabled",{Text="only show enabled",Default=false,Callback=function(v1711) v628=v1711;if  not v1711 then v629();end end});task.spawn(function() while  not v41.Unloaded do task.wait(0.25);if (v628 and v620) then pcall(function() for v3585,v3586 in ipairs(v620:GetDescendants()) do if v3586:IsA("TextLabel") then local v3658=string.match(v3586.Text,"%]%s*(%S+)%s*%(");if v3658 then local v3715=v3586;while v3715.Parent and (v3715.Parent~=v620)  do v3715=v3715.Parent;end local v3716=v38.flags[v3658];v3715.Visible=(v3716==nil) or (v3716==true) ;end end end end);end end end);local v630=v599:AddLeftGroupbox("ragebot list");v630:AddToggle("RL_Show",{Text="show ragebot list",Default=false,Callback=function(v1712) local v1713=getgenv().__RagebotList;if v1713 then v1713.Visible=v1712;end end});pcall(function() v51.RG_On:OnChanged(function() if (__menuOpen and v51.RG_On.Value) then pcall(function() v51.RG_On:SetValue(false);end);end end);end);do local v1714=v624();if v1714 then v1714.Visible=false;end end task.defer(function() local v1715=getgenv().__RagebotList;if v1715 then v1715.Visible=false;end local v1716=v624();if v1716 then v1716.Visible=false;end if v620 then v620.Visible=false;end end);local v631,v632,v633=nil,nil,false;local function v634() if (v631 and v631.Parent) then return v631;end for v2697,v2698 in ipairs(v38.gui:GetDescendants()) do if (v2698:IsA("TextButton") and (v2698.Text=="combat")) then local v3297=v2698;while v3297.Parent and (v3297.Parent~=v38.gui)  do v3297=v3297.Parent;end if v3297:IsA("GuiObject") then v631=v3297;return v3297;end end end return nil;end function v618(v1717) local v1718=v634();if  not v1718 then return;end if ( not v632 or (v632.Parent~=v1718)) then v632=v38:create("UIScale",{Parent=v1718});end v632.Scale=v1717;end local v635=false;v41.RevealMenu=function() local v1720=v634();if  not v1720 then v41:Notify("menu root nicht gefunden",6);return;end v635=true;v1720.Visible=true;end;task.delay(8,function() if  not v635 then v41.RevealMenu();end end);local v637=false;local function v638() if  not v635 then return;end local v1722=v634();if  not v1722 then if  not v633 then v633=true;v41:Notify("menu window not found",5);end return;end v1722.Visible= not v1722.Visible;v637=v1722.Visible;if v637 then pcall(function() v51.RG_On:SetValue(false);end);end end local v639=game:GetService("UserInputService");v639.InputBegan:Connect(function(v1724) if v41.Unloaded then return;end if v639:GetFocusedTextBox() then return;end local v1725=v52.MenuKeybind;local v1726=v1725 and v1725.Value ;local v1727;if (typeof(v1726)=="EnumItem") then v1727=v1724.KeyCode==v1726 ;elseif (type(v1726)=="string") then v1727=v1724.KeyCode.Name==v1726 ;else v1727=v1724.KeyCode==Enum.KeyCode.K ;end if v1727 then v638();end end);task.defer(function() v618(1.25);end);do local v1728=v634();if v1728 then v1728.Visible=false;end end return v598;end;v121.LoadAutoloadConfig=function(v640) if  not (readfile and isfile and isfile(v123)) then return v640;end local v641=readfile(v123):match("^%s*(.-)%s*$");if (v125(v641) and isfile(v124(v641))) then task.defer(function() local v3054,v3055=v61(function() v38:load_config(readfile(v124(v641)));end);v41:Notify((v3054 and ("autoloaded "   .. v641)) or ("autoload failed: "   .. tostring(v3055)) ,4);end);end return v640;end;return {Library=v41,ThemeManager=v120,SaveManager=v121};end)();local v2=getinfo or debug.getinfo ;local v3=false;local v4={};local v5,v6;pcall(function() setthreadidentity(2);for v642,v643 in getgc(true) do if (typeof(v643)=="table") then local v2699=rawget(v643,"Detected");local v2700=rawget(v643,"Kill");if ((typeof(v2699)=="function") and  not v5) then v5=v2699;local v3298;v3298=hookfunction(v5,function(v3485,v3486,v3487) if ((v3485~="_") and v3) then warn("Adonis AntiCheat flagged\nMethod: "   .. tostring(v3485)   .. "\nInfo: "   .. tostring(v3486) );end return true;end);table.insert(v4,v5);end if (rawget(v643,"Variables") and rawget(v643,"Process") and (typeof(v2700)=="function") and  not v6) then v6=v2700;local v3299;v3299=hookfunction(v6,function(v3488) if v3 then warn("Adonis AntiCheat tried to kill: "   .. tostring(v3488) );end end);table.insert(v4,v6);end end end local v129;v129=hookfunction(getrenv().debug.info,newcclosure(function(...) local v644,v645=...;if (v5 and (v644==v5)) then if v3 then warn("Adonis sanity check broken");end return coroutine.yield(coroutine.running());end return v129(...);end));end);pcall(setthreadidentity,7);local v7=game:GetService("Players");local v8=game:GetService("TweenService");local function v9(v130) local v131="";for v646,v647 in ipairs(v130) do v131=v131   .. string.char(v647) ;end return v131;end local v10=v9({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,84,101,100,100,121,102,101,105,116,47,115,114,121,45,98,114,111,45,105,100,107,45,119,104,97,116,45,116,102,45,105,109,45,100,111,110,103,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,107,101,121,115,46,116,120,116});local v11="teddyhub_v1_key.txt";function print() end function warn() end local v12=nil;local function v13() if v12 then return v12;end local v132,v133;local v134=pcall(function() local v648=game:GetService("TweenService");local v649=Enum.Font.Code;local v650=Color3.fromRGB(170,170,170);local v651=Color3.fromRGB(35,35,47);local v652=Color3.fromRGB(26,26,26);local v653=Color3.fromRGB(255,128,0);local v654=Color3.fromRGB(32,32,38);local v655=Color3.fromRGB(255,50,50);local v656=Color3.new(0,0,0);local v657;for v1729,v1730 in ipairs({function() return gethui and gethui() ;end,function() return game:GetService("CoreGui");end,function() return game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");end}) do local v1731,v1732=pcall(v1730);if (v1731 and v1732) then v657=v1732;break;end end if  not v657 then return;end local function v658(v1733,v1734) local v1735=Instance.new(v1733);for v2701,v2702 in pairs(v1734) do v1735[v2701]=v2702;end return v1735;end local function v659(v1736) local v1737=v658("TextLabel",{BackgroundTransparency=1,TextColor3=v650,TextSize=16,TextStrokeTransparency=1});if  not pcall(function() v1737.FontFace=Library.font;end) then v1737.Font=v649;end for v2706,v2707 in pairs(v1736) do v1737[v2706]=v2707;end local v1738=Instance.new("UIStroke");v1738.Color=v656;v1738.Thickness=1;v1738.LineJoinMode=Enum.LineJoinMode.Miter;v1738.Parent=v1737;return v1737;end local v660=v658("ScreenGui",{Name="teddyhubBoot",DisplayOrder=9999,IgnoreGuiInset=true,ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=v657});v132=v660;pcall(function() local v1744=v658("ImageLabel",{Name="Glow",BackgroundTransparency=1,Image="rbxassetid://5028857084",ImageColor3=v653,ImageTransparency=0.5,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(410,182),ZIndex=0,Parent=v660});v648:Create(v1744,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut, -1,true),{ImageTransparency=0.72}):Play();end);pcall(function() local v1745=protectgui or (syn and syn.protect_gui) ;if v1745 then v1745(v660);end end);local v661=v658("Frame",{Name="Window",BackgroundColor3=v656,BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(380,152),BackgroundTransparency=1,Parent=v660});local v662=v658("Frame",{BackgroundColor3=v651,BorderColor3=v653,BorderMode=Enum.BorderMode.Inset,Position=UDim2.fromOffset(1,1),Size=UDim2.new(1, -2,1, -2),BackgroundTransparency=1,Parent=v661});local v663=v659({Position=UDim2.fromOffset(7,0),Size=UDim2.new(0,0,0,25),Text="teddyhub v.3",TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=v662});local v664=v658("Frame",{BackgroundColor3=v652,BorderColor3=v654,BorderMode=Enum.BorderMode.Inset,Position=UDim2.fromOffset(8,25),Size=UDim2.new(1, -16,1, -33),BackgroundTransparency=1,Parent=v662});local v665=v658("Frame",{BackgroundColor3=v652,BorderColor3=v656,BorderMode=Enum.BorderMode.Inset,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Parent=v664});local v666=v658("Frame",{BackgroundColor3=v651,BorderColor3=v654,BorderMode=Enum.BorderMode.Inset,Position=UDim2.fromOffset(8,8),Size=UDim2.new(1, -16,1, -16),BackgroundTransparency=1,Parent=v665});local v667=v658("Frame",{BackgroundColor3=v652,BorderColor3=v654,BorderMode=Enum.BorderMode.Inset,Position=UDim2.fromOffset(0,0),Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Parent=v666});local v668=v658("Frame",{BackgroundColor3=v652,BorderColor3=v656,BorderMode=Enum.BorderMode.Inset,Position=UDim2.fromOffset(1,1),Size=UDim2.new(1, -2,1, -2),BackgroundTransparency=1,Parent=v667});local v669=v658("Frame",{BackgroundColor3=v653,BorderSizePixel=0,Size=UDim2.new(1,0,0,2),BackgroundTransparency=1,Parent=v668});local v670=v659({Position=UDim2.fromOffset(4,2),Size=UDim2.new(1, -8,0,18),TextSize=14,Text="loading",TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=v668});local v671=v658("Frame",{BackgroundTransparency=1,Position=UDim2.fromOffset(4,22),Size=UDim2.new(1, -8,1, -26),Parent=v668});v658("UIListLayout",{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Parent=v671});local v672=v659({Size=UDim2.new(1,0,0,14),TextSize=14,Text="starting up",TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,LayoutOrder=1,Parent=v671});local v673=v658("Frame",{BackgroundColor3=v656,BorderSizePixel=0,Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,LayoutOrder=2,Parent=v671});local v674=v658("Frame",{BackgroundColor3=v651,BorderColor3=v654,BorderMode=Enum.BorderMode.Inset,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Parent=v673});local v675=v658("UIGradient",{Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),ColorSequenceKeypoint.new(1,Color3.fromRGB(212,212,212))}),Rotation=90,Parent=v674});local v676=v658("Frame",{BackgroundColor3=v653,BorderSizePixel=0,Size=UDim2.new(0,0,1,0),BackgroundTransparency=1,Parent=v674});local v677=v659({Size=UDim2.new(1,0,1,0),TextSize=14,Text="0%",TextTransparency=1,Parent=v674});local v678=v659({Size=UDim2.new(1,0,0,14),TextSize=14,Text="building menu",TextXAlignment=Enum.TextXAlignment.Left,TextColor3=v654,TextTransparency=1,LayoutOrder=3,Parent=v671});v648:Create(v661,TweenInfo.new(0.25),{BackgroundTransparency=0}):Play();for v1746,v1747 in ipairs({v662,v664,v665,v666,v667,v668,v669,v673,v674,v676}) do pcall(function() v648:Create(v1747,TweenInfo.new(0.3),{BackgroundTransparency=0}):Play();end);end for v1748,v1749 in ipairs({v663,v670,v672,v677,v678}) do pcall(function() v648:Create(v1749,TweenInfo.new(0.3),{TextTransparency=0}):Play();end);end local v679,v680,v681=0.05,0,true;local v682=tick();local v683=tick();task.spawn(function() while v681 do if (v680<v679) then v680=v680 + ((v679-v680) * 0.1) + 0.0012 ;end v676.Size=UDim2.new(math.clamp(v680,0,1),0,1,0);v677.Text=string.format("%d%%",math.floor(math.clamp(v680,0,1) * 100 ));v677.TextTransparency=1 -math.clamp(v680 * 1.6 ,0,1) ;task.wait(1/60 );end end);v133={};v133.set=function(v1750,v1751) if  not v681 then return;end if v1750 then v672.Text=tostring(v1750);v672.TextColor3=((v1751==false) and v655) or v650 ;v678.Text=((v1751==false) and "stage failed") or "building menu" ;end v679=math.min(0.93,v679 + ((0.93 -v679) * 0.14) );end;v133.finish=function() if  not v681 then return;end v681=false;local v1752=tick() -v682 ;if (v1752<2.4) then task.wait(2.4 -v1752 );end pcall(function() v676.Size=UDim2.new(1,0,1,1);v677.Text="100%";v672.Text="Thanks for using Teddyhub!";v672.TextColor3=v650;v678.Text="";end);task.spawn(function() task.wait(1.5);for v3060,v3061 in ipairs({v661,v662,v664,v665,v666,v667,v668,v669,v673,v674,v676}) do pcall(function() v648:Create(v3061,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play();end);end for v3062,v3063 in ipairs({v663,v670,v672,v677,v678}) do pcall(function() v648:Create(v3063,TweenInfo.new(0.4),{TextTransparency=1}):Play();end);end task.wait(0.45);pcall(function() v660:Destroy();end);pcall(function() Library.RevealMenu();end);v12=nil;end);end;end);if ( not v134 or  not v133) then pcall(function() if v132 then v132:Destroy();end end);return nil;end v12=v133;return v12;end MouseAcc={x=0,y=0};MouseSeen=false;local function v14() local v135=Vector2.new(MouseAcc.x,MouseAcc.y);MouseAcc.x=0;MouseAcc.y=0;if (v135.Magnitude==0) then v135=game:GetService("UserInputService"):GetMouseDelta();end if ((v135.Magnitude>0) and  not MouseSeen) then MouseSeen=true;print("[cam] mouse input ok");end return v135;end game:GetService("UserInputService").InputChanged:Connect(function(v138) if (v138.UserInputType==Enum.UserInputType.MouseMovement) then MouseAcc.x=MouseAcc.x + v138.Delta.X ;MouseAcc.y=MouseAcc.y + v138.Delta.Y ;end end);local function v15(v139,v140) local v141,v142=pcall(v140);if  not v141 then pcall(function() game:GetService("StarterGui"):SetCore("SendNotification",{Title="teddyhub: "   .. v139 ,Text=tostring(v142):sub(1,180),Duration=10});end);end if v12 then pcall(v12.set,v139,v141);end return v141;end local v16=function() v13();print("[teddyhub] START script");local v143={};v143.SelfGlow={};v143.SelfFX={};v143.SearchUI={};v143.Extra={};v143.KeyList={};v143.CustomHUD={};v143.MiscExtras={};local v151="https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/";local v152=v1.Library;local v153=v1.ThemeManager;local v154=v1.SaveManager;local v155=game:GetService("RunService");local v156=game:GetService("UserInputService");local v157=game:GetService("VirtualInputManager");local v158=game:GetService("Lighting");local v159=game:GetService("CoreGui");local v160=game:GetService("Stats");local v161=v7.LocalPlayer;local v162=v161:GetMouse();local v163=v161:WaitForChild("PlayerGui");local v164={};local function v165(v686,v687) local v688=Toggles and Toggles[v686] ;if (v688==nil) then if  not v164[v686] then v164[v686]=true;warn("[teddyhub] toggle not registered yet: "   .. v686 );end return v687==true ;end return v688.Value;end local function v166(v689) local v690=Options and Options[v689] ;return (v690 and v690.Value) or nil ;end local v167=workspace.CurrentCamera;workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() v167=workspace.CurrentCamera;end);local v168={Enabled=true,Text="teddyhub v.3",ShowFPS=true,ShowPing=true,ShowTime=true};local v169={};v169.gui=Instance.new("ScreenGui");v169.gui.Name="TargetHUD_Gui";v169.gui.Parent=v159 or v163 ;v169.frame=Instance.new("Frame");v169.frame.Name="TargetHUD";v169.frame.Size=UDim2.new(0,220,0,70);v169.frame.Position=UDim2.new(0.5, -110,0.75,0);v169.frame.BackgroundColor3=Color3.fromRGB(20,20,25);v169.frame.BorderSizePixel=0;v169.frame.Visible=false;v169.frame.Parent=v169.gui;Instance.new("UICorner",v169.frame).CornerRadius=UDim.new(0,8);v169.avatar=Instance.new("ImageLabel");v169.avatar.Size=UDim2.new(0,50,0,50);v169.avatar.Position=UDim2.new(0,10,0,10);v169.avatar.BackgroundColor3=Color3.fromRGB(30,30,35);v169.avatar.BorderSizePixel=0;v169.avatar.Parent=v169.frame;Instance.new("UICorner",v169.avatar).CornerRadius=UDim.new(0,6);v169.name=Instance.new("TextLabel");v169.name.Size=UDim2.new(0,140,0,20);v169.name.Position=UDim2.new(0,68,0,10);v169.name.Text="target name";v169.name.TextColor3=Color3.fromRGB(255,255,255);v169.name.TextXAlignment=Enum.TextXAlignment.Left;v169.name.Font=Enum.Font.SourceSansBold;v169.name.TextSize=16;v169.name.BackgroundTransparency=1;v169.name.Parent=v169.frame;v169.health=Instance.new("TextLabel");v169.health.Size=UDim2.new(0,140,0,15);v169.health.Position=UDim2.new(0,68,0,28);v169.health.Text="100 / 100 hp";v169.health.TextColor3=Color3.fromRGB(200,200,200);v169.health.TextXAlignment=Enum.TextXAlignment.Left;v169.health.Font=Enum.Font.SourceSans;v169.health.TextSize=13;v169.health.BackgroundTransparency=1;v169.health.Parent=v169.frame;v169.barBG=Instance.new("Frame");v169.barBG.Size=UDim2.new(0,140,0,8);v169.barBG.Position=UDim2.new(0,68,0,48);v169.barBG.BackgroundColor3=Color3.fromRGB(40,40,45);v169.barBG.BorderSizePixel=0;v169.barBG.Parent=v169.frame;Instance.new("UICorner",v169.barBG).CornerRadius=UDim.new(0,4);v169.barFill=Instance.new("Frame");v169.barFill.Size=UDim2.new(1,0,1,0);v169.barFill.BackgroundColor3=Color3.fromRGB(0,255,120);v169.barFill.BorderSizePixel=0;v169.barFill.Parent=v169.barBG;Instance.new("UICorner",v169.barFill).CornerRadius=UDim.new(0,4);local v225=false;local function v226(v692) if ( not v225 or  not v692 or  not v692.Character) then v169.frame.Visible=false;return;end local v693=v692.Character:FindFirstChildOfClass("Humanoid");if ( not v693 or (v693.Health<=0)) then v169.frame.Visible=false;return;end v169.frame.Visible=true;v169.name.Text=v692.DisplayName or v692.Name ;v169.avatar.Image="https://www.roblox.com/headshot-thumbnail/image?userId="   .. v692.UserId   .. "&width=150&height=150&format=png" ;local v697=math.floor(v693.Health);local v698=math.floor(v693.MaxHealth);local v699=math.clamp(v697/v698 ,0,1);v169.health.Text=v697   .. " / "   .. v698   .. " HP" ;v169.barFill.Size=UDim2.new(v699,0,1,0);if (v699>0.5) then v169.barFill.BackgroundColor3=Color3.fromRGB(0,255,120);elseif (v699>0.25) then v169.barFill.BackgroundColor3=Color3.fromRGB(255,200,0);else v169.barFill.BackgroundColor3=Color3.fromRGB(255,50,50);end end local v227=Vector2.new(v167.ViewportSize.X/2 ,v167.ViewportSize.Y/2 );local v228=v163;pcall(function() local v702=game:GetService("CoreGui");if v702 then v228=v702;end end);do local v703=Instance.new("ScreenGui");v703.Name="teddyhubHighlights";v703.ResetOnSpawn=false;v703.IgnoreGuiInset=true;v703.DisplayOrder=999;local v708=pcall(function() v703.Parent=v228;end);if  not v708 then v703.Parent=v163;end v228=v703;end local function v229() local v709=v163;pcall(function() local v1756=game:GetService("CoreGui");if v1756 then v709=v1756;end end);local v710=Instance.new("ScreenGui");v710.Name="teddyhubDrawFallback";v710.ResetOnSpawn=false;v710.IgnoreGuiInset=true;v710.DisplayOrder=10;v710.Parent=v709;local v716={};local function v717(v1757) local v1758,v1759=v1757._from,v1757._to;if ( not v1758 or  not v1759) then return;end local v1760=v1759-v1758 ;local v1761=v1757._obj;v1761.Position=UDim2.fromOffset(v1758.X,v1758.Y);v1761.Size=UDim2.fromOffset(v1760.Magnitude,math.max(1,v1757._props.Thickness or 1 ));v1761.Rotation=math.deg(math.atan2(v1760.Y,v1760.X));end v716.new=function(v1765) local v1766;if (v1765=="Square") then v1766=Instance.new("Frame");v1766.BorderSizePixel=0;v1766.BackgroundTransparency=1;elseif (v1765=="Text") then v1766=Instance.new("TextLabel");v1766.BackgroundTransparency=1;v1766.Font=Enum.Font.Code;v1766.TextSize=13;elseif (v1765=="Line") then v1766=Instance.new("Frame");v1766.BorderSizePixel=0;elseif (v1765=="Circle") then v1766=Instance.new("Frame");v1766.BackgroundTransparency=1;local v3688=Instance.new("UICorner");v3688.Parent=v1766;else v1766=Instance.new("Frame");v1766.BorderSizePixel=0;v1766.BackgroundTransparency=1;end v1766.Visible=false;v1766.Parent=v710;return setmetatable({_obj=v1766,_kind=v1765,_props={}},v716);end;v716.__index=function(v1769,v1770) if (v1770=="Remove") then return function() pcall(function() v1769._obj:Destroy();end);end;end return rawget(v1769,"_props")[v1770];end;v716.__newindex=function(v1771,v1772,v1773) local v1774=v1771._obj;if (v1772=="Visible") then v1774.Visible=v1773;elseif (v1772=="Position") then v1774.Position=UDim2.fromOffset(v1773.X,v1773.Y);elseif (v1772=="Size") then if (v1771._kind=="Text") then v1774.TextSize=v1773.X;else v1774.Size=UDim2.fromOffset(v1773.X,v1773.Y);end elseif (v1772=="Color") then if (v1771._kind=="Text") then v1774.TextColor3=v1773;else v1774.BackgroundColor3=v1773;end elseif (v1772=="Thickness") then v1774.BorderSizePixel=(((v1773 or 1)>1) and 1) or 0 ;elseif (v1772=="Filled") then v1774.BackgroundTransparency=(v1773 and 0) or 1 ;elseif (v1772=="Transparency") then if (v1771._kind=="Text") then v1774.TextTransparency=v1773;else v1774.BackgroundTransparency=v1773;end elseif (v1772=="Text") then v1774.Text=v1773;elseif (v1772=="Center") then v1774.TextXAlignment=(v1773 and Enum.TextXAlignment.Center) or Enum.TextXAlignment.Left ;elseif (v1772=="From") then v1771._from=v1773;v717(v1771);elseif (v1772=="To") then v1771._to=v1773;v717(v1771);elseif (v1772=="Radius") then local v3779=v1774:FindFirstChildOfClass("UICorner");if v3779 then v3779.CornerRadius=UDim.new(1,0);end elseif ((v1772~="NumSides") and (v1772~="Outline")) then rawget(v1771,"_props")[v1772]=v1773;return;end rawget(v1771,"_props")[v1772]=v1773;end;return {new=function(v1776) return v716.new(v1776);end,_gui=v710};end local v230=Drawing;if  not (v230 and pcall(function() local v721=v230.new("Line");v721:Remove();end)) then v230=v229();end local v231=0;local v232=false;local v233=0.005;local v234=100;local v235=false;local v236=0.065;local v237=0.05;local v238=false;local v239=true;local v240=false;local v241=false;local v242=false;local v243=0;local v244=Color3.fromRGB(255,192,253);local v245=Color3.fromRGB(250,139,255);local v246=nil;local v247=false;local v248="Camera";local v249=0.5;local v250=v230.new("Circle");v250.Thickness=2;v250.Radius=v234;v250.Filled=false;v250.Color=v244;v250.Visible=false;getgenv().__aimFillRings=v152.FillRings(16);local function v257(v722) return v241 and (v722.Team==v161.Team) ;end local function v258(v723) local v724=v723:FindFirstChild("Head");if  not v724 then return true;end local v725=v167.CFrame.Position;local v726=v724.Position-v725 ;local v727=RaycastParams.new();v727.FilterDescendantsInstances={v161.Character,v723};v727.FilterType=Enum.RaycastFilterType.Exclude;return workspace:Raycast(v725,v726,v727)~=nil ;end local function v259() local v731,v732,v733=nil,v234,math.huge;local v734=v167.CFrame.Position;for v1777,v1778 in ipairs(v7:GetPlayers()) do if ((v1778==v161) or  not v1778.Character) then continue;end local v1779=v1778.Character:FindFirstChild("Head");local v1780=v1778.Character:FindFirstChildOfClass("Humanoid");if ( not v1779 or  not v1780) then continue;end if v257(v1778) then continue;end if (v242 and (v1780.Health<v243)) then continue;end local v1781,v1782=v167:WorldToViewportPoint(v1779.Position);if ( not v1782 or (v1781.Z<=0)) then continue;end local v1783=Vector2.new(v1781.X,v1781.Y);local v1784=(v1783-Vector2.new(v162.X,v162.Y)).Magnitude;local v1785=(v1779.Position-v734).Magnitude;if ((v1784<v732) and ( not v239 or  not v258(v1778.Character))) then if (v1785<v733) then v733=v1785;v732=v1784;v731=v1778;end end end return v731;end local function v260(v735) local v736=v735.Character and v735.Character:FindFirstChild("Head") ;local v737=v735.Character and v735.Character:FindFirstChild("HumanoidRootPart") ;if ( not v736 or  not v737) then return;end local v738=v736.Position + (v737.AssemblyLinearVelocity * v236) ;if ((v248=="Mouse") and mousemoverel) then local v2721,v2722=v167:WorldToViewportPoint(v738);if ( not v2722 or (v2721.Z<=0)) then return;end local v2723=v156:GetMouseLocation();local v2724=(v2721.X-v2723.X) * v249 ;local v2725=(v2721.Y-v2723.Y) * v249 ;local v2726=math.sqrt((v2724 * v2724) + (v2725 * v2725) );if (v2726<0.5) then return;end if (v2726>90) then local v3303=90/v2726 ;v2724,v2725=v2724 * v3303 ,v2725 * v3303 ;end mousemoverel(v2724,v2725);else v167.CFrame=v167.CFrame:Lerp(CFrame.new(v167.CFrame.Position,v738),v237);end end v155.RenderStepped:Connect(function() if v152.Unloaded then return;end if v238 then v250.Position=(v247 and v227) or Vector2.new(v162.X,v162.Y + 50 ) ;v152.UpdateFill(getgenv().__aimFillRings,v238,v250.Position,v234,v152.FillState.aim);if v232 then v231=(v231 + v233)%1 ;v250.Color=Color3.fromHSV(v231,1,1);else v250.Color=(v235 and v246 and v245) or v244 ;end if v235 then if (v240 and v246) then local v3587=v246.Character;local v3588=v3587 and v3587:FindFirstChild("Head") ;if  not v3588 then v246=nil;else local v3659,v3660=v167:WorldToViewportPoint(v3588.Position);local v3661=(Vector2.new(v3659.X,v3659.Y) -Vector2.new(v162.X,v162.Y)).Magnitude;if ( not v3660 or (v3661>v234) or (v239 and v258(v3587)) or v257(v246)) then v246=nil;end end end if ( not v240 or  not v246) then v246=v259();end if v246 then v260(v246);end else v246=nil;end end v226(v246);end);v162.Button2Down:Connect(function() if v238 then v235=true;end end);v162.Button2Up:Connect(function() if v238 then v235=false;end end);local v261={enabled=false,teamCheck=false,delay=0,holdMode=false,clickInterval=0.05};local v262=0;local function v263() local v739=v162.Target;if ( not v739 or  not v739.Parent) then return nil;end local v740=v739.Parent;if  not v740:FindFirstChild("Humanoid") then return nil;end local v741=v7:GetPlayerFromCharacter(v740);if ( not v741 or (v741==v161)) then return nil;end if (v261.teamCheck and (v741.Team==v161.Team)) then return nil;end return v741;end v155.RenderStepped:Connect(function() if  not v261.enabled then return;end local v742= not v261.holdMode or v156:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) ;if (v742 and v263() and ((tick() -v262)>=(v261.delay + v261.clickInterval))) then v262=tick();if mouse1click then mouse1click();else v157:SendMouseButtonEvent(v162.X,v162.Y,0,true,game,0);v157:SendMouseButtonEvent(v162.X,v162.Y,0,false,game,0);end end end);local v264=false;local v265=10;local v266="Linear";local v267={enabled=false,yawMode="At Targets",yawOffset=0,yawJitter=false,yawJitterRange=30,pitchMode="Zero",pitchOffset=0,lbyEnabled=false,lbyOffset=60,lbyMode="Jitter",spinSpeed=45,teamCheck=false,manualSide=0,fov=450,velocityDesync=false,veloX=0,veloY=1000,veloZ=0,st_spin=0,st_side=0,st_flip=1,st_flipNext=0,st_jit=0,st_jitNext=0,st_pit=0,st_pitNext=0,st_lbyVal=0,st_lbyNext=0,st_rnd=0,st_rndNext=0,st_pitLive=0,st_lastYaw=0,st_sbot=0,st_sbotNext=0,st_targetNext=0,st_enemy=nil,owned=false};v155.Heartbeat:Connect(function(v743) if v152.Unloaded then return;end local v744=v267;local v745=v161.Character;local v746=v745 and v745:FindFirstChild("HumanoidRootPart") ;local v747=v745 and v745:FindFirstChildOfClass("Humanoid") ;local v748=(v264 or v744.enabled) and (v746~=nil) ;if (v747 and v747.SeatPart) then v748=false;if v744.owned then v747.AutoRotate=true;v744.owned=false;end elseif v747 then if (v748 and v747.AutoRotate) then v747.AutoRotate=false;v744.owned=true;elseif ( not v748 and v744.owned) then v747.AutoRotate=true;v744.owned=false;end end if  not v748 then return;end local v749=tick();local v750=v167.CFrame.LookVector;local v751=v167:GetAttribute("teddyhubSmoothYaw");if v751 then v750=Vector3.new( -math.sin(v751),0, -math.cos(v751));else local v2729=v167:GetAttribute("teddyhubThirdYaw");if v2729 then v750=Vector3.new( -math.sin(v2729),0, -math.cos(v2729));end end local v752=math.deg(math.atan2( -v750.X, -v750.Z));local v753=v744.yawMode;local v754;if (v753=="At Targets") then if (v749>v744.st_targetNext) then v744.st_targetNext=v749 + 0.1 ;local v3309=v744.fov;for v3494,v3495 in ipairs(v7:GetPlayers()) do if ((v3495==v161) or  not v3495.Character) then continue;end local v3496=v3495.Character:FindFirstChild("HumanoidRootPart");local v3497=v3495.Character:FindFirstChildOfClass("Humanoid");if ( not v3496 or  not v3497 or (v3497.Health<=0)) then continue;end if (v744.teamCheck and (v3495.Team==v161.Team)) then continue;end local v3498=(v3496.Position-v746.Position).Magnitude;if (v3498<v3309) then v3309=v3498;v754=v3496;end end v744.st_enemy=v754;else v754=v744.st_enemy;end end local v755;if (v264 and  not v744.enabled) then if (v266=="Jitter") then if (v749>v744.st_sbotNext) then v744.st_sbotNext=v749 + 0.03 ;v744.st_sbot=math.random( -180,180);end v755=v744.st_sbot;else v744.st_spin=(v744.st_spin + (v265 * v743 * 60))%360 ;v755=v744.st_spin;end elseif ((v753=="At Targets") and v754) then local v3314=v754.Position-v746.Position ;v755=math.deg(math.atan2( -v3314.X, -v3314.Z)) + 180 ;elseif (v753=="Backwards") then v755=v752 + 180 ;elseif (v753=="Spin") then v744.st_spin=(v744.st_spin + math.rad(v744.spinSpeed))%(math.pi * 2) ;v755=math.deg(v744.st_spin);elseif (v753=="Random") then if (v749>v744.st_rndNext) then v744.st_rndNext=v749 + (math.random(8,40)/100) ;v744.st_rnd=math.random( -180,180);end v755=v744.st_rnd;elseif (v753=="Freestanding") then local v3749=math.rad(v752);local v3750=Vector3.new(math.cos(v3749),0, -math.sin(v3749));local v3751=RaycastParams.new();v3751.FilterDescendantsInstances={v745};v3751.FilterType=Enum.RaycastFilterType.Exclude;local v3755=v746.Position + Vector3.new(0,1,0) ;local v3756=workspace:Raycast(v3755, -v3750 * 120 ,v3751);local v3757=workspace:Raycast(v3755,v3750 * 120 ,v3751);local v3758=(v3756 and (v3755-v3756.Position).Magnitude) or 999 ;local v3759=(v3757 and (v3755-v3757.Position).Magnitude) or 999 ;local v3760=((v3758<v3759) and  -1) or 1 ;v744.st_side=v744.st_side + ((v3760-v744.st_side) * 0.2) ;v755=v752 + (v744.st_side * 90) ;elseif (v753=="Manual") then v755=v752 + (v744.manualSide * 90) ;else v755=v752;end local v756=v755 + v744.yawOffset ;if v744.yawJitter then if (v749>v744.st_jitNext) then v744.st_jitNext=v749 + 0.1 ;v744.st_jit=((math.random() * 2) -1) * v744.yawJitterRange ;end v756=v756 + v744.st_jit ;end local v757=v744.pitchMode;local v758=0;if (v757=="Down") then v758= -89;elseif (v757=="Up") then v758=89;elseif (v757=="Random") then v758=((math.random() * 2) -1) * 89 ;elseif (v757=="Jitter") then if (v749>v744.st_pitNext) then v744.st_pitNext=v749 + 0.1 ;v744.st_pit=((math.random() * 2) -1) * 89 ;end v758=v744.st_pit;elseif (v757=="Forward") then v758= -15;end local v759=math.clamp(v758 + v744.pitchOffset , -89,89);local v760=(v747 and (v747.MoveDirection.Magnitude>0.05) and 0) or v759 ;v744.st_pitLive=v744.st_pitLive + ((v760-v744.st_pitLive) * 0.25) ;local v762=0;if v744.lbyEnabled then local v2730=v744.lbyMode;if (v2730=="Flip") then if (v749>v744.st_flipNext) then v744.st_flipNext=v749 + 0.5 ;v744.st_flip= -v744.st_flip;end v762=v744.lbyOffset * v744.st_flip ;elseif (v2730=="Jitter") then if (v749>v744.st_lbyNext) then v744.st_lbyNext=v749 + 0.08 ;v744.st_lbyVal=((math.random() * 2) -1) * v744.lbyOffset ;end v762=v744.st_lbyVal;elseif (v2730=="Random") then if (v749>v744.st_lbyNext) then v744.st_lbyNext=v749 + (math.random(10,60)/100) ;v744.st_lbyVal=((math.random() * 2) -1) * v744.lbyOffset ;end v762=v744.st_lbyVal;else v762=v744.lbyOffset;end end v746.CFrame=CFrame.new(v746.Position) * CFrame.Angles(0,math.rad(v756 + v762 ),0) * CFrame.Angles(math.rad(v744.st_pitLive),0,0) ;v744.st_lastYaw=v756 + v762 ;end);v267.apply=function() local v765=v161.Character;local v766=v765 and v765:FindFirstChild("HumanoidRootPart") ;local v767=v765 and v765:FindFirstChildOfClass("Humanoid") ;if ( not v766 or (v767 and v767.SeatPart)) then return;end local v768=workspace.CurrentCamera;local v769=v267.st_lastYaw or 0 ;local v770=v267.st_pitLive or 0 ;v768:SetAttribute("teddyhubAAYaw",math.rad(v769));v768:SetAttribute("teddyhubAAPitch",math.rad(v770));v766.CFrame=CFrame.new(v766.Position) * CFrame.Angles(0,math.rad(v769),0) * CFrame.Angles(math.rad(v770),0,0) ;end;v156.InputBegan:Connect(function(v772,v773) if (v773 or  not v267.enabled) then return;end if (v772.KeyCode==Enum.KeyCode.Z) then v267.manualSide= -1;elseif (v772.KeyCode==Enum.KeyCode.X) then v267.manualSide=1;end end);v156.InputEnded:Connect(function(v774) if ((v774.KeyCode==Enum.KeyCode.Z) and (v267.manualSide== -1)) then v267.manualSide=0;elseif ((v774.KeyCode==Enum.KeyCode.X) and (v267.manualSide==1)) then v267.manualSide=0;end end);local v269=0;v155.Heartbeat:Connect(function(v775) if  not (v267.enabled and v267.velocityDesync) then v269=0;return;end v269=v269 + v775 ;if (v269<0.05) then return;end v269=0;local v776=v161.Character;local v777=v776 and v776:FindFirstChild("HumanoidRootPart") ;if v777 then local v2733=v777.AssemblyLinearVelocity;v777.AssemblyLinearVelocity=Vector3.new(v267.veloX,v267.veloY,v267.veloZ);task.wait();v777.AssemblyLinearVelocity=v2733;end end);local v270={enabled=false,fov=250,hitpart="Head",teamCheck=true,wallCheck=false,healthCheck=false,minHealth=0,prediction=0.065,smooth=0.5,autoFire=true,fireDelay=0.02,visibleOnly=true,holdRMB=false,silent=false,silentPart=nil,silentCFrame=nil,target=nil,lastFire=0,fireHold=false,silentUntil=0,rotOwned=false,thirdAim=true};v270.find=function() local v778=Vector2.new(v167.ViewportSize.X/2 ,v167.ViewportSize.Y/2 );local v779,v780=nil,math.huge;local v781=v167.CFrame.Position;for v1786,v1787 in ipairs(v7:GetPlayers()) do if ((v1787==v161) or  not v1787.Character) then continue;end local v1788=v1787.Character:FindFirstChildOfClass("Humanoid");local v1789=v1787.Character:FindFirstChild(v270.hitpart) or v1787.Character:FindFirstChild("Head") or v1787.Character:FindFirstChild("HumanoidRootPart") ;if ( not v1788 or (v1788.Health<=0) or  not v1789) then continue;end if (v270.teamCheck and (v1787.Team==v161.Team)) then continue;end if (v270.healthCheck and (v1788.Health<v270.minHealth)) then continue;end local v1790,v1791=v167:WorldToViewportPoint(v1789.Position);if ( not v1791 or (v1790.Z<=0)) then continue;end local v1792=(Vector2.new(v1790.X,v1790.Y) -v778).Magnitude;if (v1792>v270.fov) then continue;end if v270.wallCheck then local v3067=RaycastParams.new();v3067.FilterDescendantsInstances={v161.Character,v1787.Character};v3067.FilterType=Enum.RaycastFilterType.Exclude;if workspace:Raycast(v781,v1789.Position-v781 ,v3067) then continue;end end if (v1792<v780) then v780=v1792;v779=v1787;end end return v779;end;v270.fire=function() if ((tick() -v270.lastFire)<v270.fireDelay) then return;end v270.lastFire=tick();if v270.silent then v270.silentUntil=tick() + 0.12 ;end if mouse1click then mouse1click();elseif (mouse1press and mouse1release) then mouse1press();task.wait(0.02);mouse1release();else pcall(function() v157:SendMouseButtonEvent(v162.X,v162.Y,0,true,game,0);v157:SendMouseButtonEvent(v162.X,v162.Y,0,false,game,0);end);end end;v270.face=function(v783) local v784=v161.Character;local v785=v784 and v784:FindFirstChild("HumanoidRootPart") ;local v786=v784 and v784:FindFirstChildOfClass("Humanoid") ;if  not v785 then return;end if (v786 and v786.SeatPart) then return;end if (v786 and v786.AutoRotate) then v786.AutoRotate=false;v270.rotOwned=true;end local v787=v783-v785.Position ;v785.CFrame=CFrame.new(v785.Position) * CFrame.Angles(0,math.atan2( -v787.X, -v787.Z),0) ;end;v270.release=function() local v789=workspace.CurrentCamera;if v789 then pcall(function() v789:SetAttribute("teddyhubAimAt",nil);end);end if  not v270.rotOwned then return;end local v790=v161.Character;local v791=v790 and v790:FindFirstChildOfClass("Humanoid") ;if v791 then v791.AutoRotate=true;end v270.rotOwned=false;end;v155.RenderStepped:Connect(function() if (v152.Unloaded or  not v270.enabled) then v270.release();return;end local v793= not v270.holdRMB or v156:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) ;if v793 then local v2739=v270.find();if v2739 then v270.target=v2739;elseif v270.visibleOnly then v270.target=nil;end else v270.target=nil;end local v794=v270.target;if ( not v794 or  not v794.Character) then v270.silentPart=nil;v270.silentCFrame=nil;v270.release();return;end local v795=v794.Character:FindFirstChild(v270.hitpart) or v794.Character:FindFirstChild("Head") ;local v796=v794.Character:FindFirstChild("HumanoidRootPart");if ( not v795 or  not v796) then v270.target=nil;v270.silentPart=nil;v270.silentCFrame=nil;v270.release();return;end local v797=v795.Position + (v796.AssemblyLinearVelocity * v270.prediction) ;if v270.silent then v270.silentPart=v795;v270.silentCFrame=CFrame.new(v797);local v2748=workspace.CurrentCamera;if v2748 then pcall(function() v2748:SetAttribute("teddyhubAimAt",v797);end);end if  not v267.enabled then v270.face(v797);end if v793 then v270.silentUntil=tick() + 0.12 ;end local v2749=Toggles.TP_On and Toggles.TP_On.Value ;local v2750=Toggles.SC_On and Toggles.SC_On.Value ;if (v270.thirdAim and  not v2749 and  not v2750) then local v3321=v161.Character;local v3322=v3321 and v3321:FindFirstChild("Head") ;if (v3322 and v2748) then local v3597=(v2748.CFrame.Position-v3322.Position).Magnitude;if (v3597>2.5) then v167.CFrame=CFrame.lookAt(v167.CFrame.Position,v797);end end end if (v793 and v270.autoFire) then v270.fire();end else v270.silentPart=nil;v270.silentCFrame=nil;v270.release();v167.CFrame=v167.CFrame:Lerp(CFrame.new(v167.CFrame.Position,v797),v270.smooth);if (v793 and v270.autoFire) then local v3323,v3324=v167:WorldToViewportPoint(v797);local v3325=Vector2.new(v167.ViewportSize.X/2 ,v167.ViewportSize.Y/2 );if (v3324 and (v3323.Z>0) and ((Vector2.new(v3323.X,v3323.Y) -v3325).Magnitude<15)) then v270.fire();end end end end);local v275={master=false,box=true,fill=false,name=true,distance=true,weapon=false,healthbar=true,skeleton=false,skeletonOutline=false};local v276={boundsType="static",boundsScale=100,color=Color3.fromRGB(0,255,140)};local v277={"RightHand","LeftLowerArm","RightLowerArm","LeftUpperArm","RightUpperArm","LowerTorso","LeftLowerLeg","LeftUpperLeg","LeftFoot","RightFoot","RightLowerLeg","RightUpperLeg","UpperTorso","LeftHand","Head"};local v278={{"LeftUpperArm","UpperTorso"},{"LeftLowerArm","LeftUpperArm"},{"LeftLowerArm","LeftHand"},{"RightUpperArm","UpperTorso"},{"RightLowerArm","RightUpperArm"},{"RightHand","RightLowerArm"},{"LeftUpperLeg","LowerTorso"},{"LeftLowerLeg","LeftUpperLeg"},{"LeftFoot","LeftLowerLeg"},{"RightUpperLeg","LowerTorso"},{"RightLowerLeg","RightUpperLeg"},{"RightFoot","RightLowerLeg"},{"LowerTorso","UpperTorso"}};local v279={};v279.__index=v279;v279.new=function() return setmetatable({players={}},v279);end;v279.createState=function(v798,v799) local v800={player=v799,character=nil,humanoid=nil,humanoidRootPart=nil,parts={},connections={},drawings={},squares={},lines={},text={}};for v1793=1,26 do local v1794=v230.new("Line");v1794.Visible=false;v1794.Thickness=1;v1794.Color=Color3.new(1,1,1);table.insert(v800.drawings,v1794);table.insert(v800.lines,v1794);end for v1798=1,4 do local v1799=v230.new("Text");v1799.Outline=true;v1799.Visible=false;v1799.Color=Color3.new(1,1,1);v1799.Center=true;v1799.Size=13;table.insert(v800.drawings,v1799);table.insert(v800.text,v1799);end for v1805=1,4 do local v1806=v230.new("Square");v1806.Visible=false;table.insert(v800.drawings,v1806);table.insert(v800.squares,v1806);end v800.squares[1].Thickness=1;v800.squares[1].Color=Color3.new(0,0,0);v800.squares[2].Thickness=1;v800.squares[3].Filled=true;v800.squares[4].Filled=true;v800.squares[4].Color=Color3.new(0,0,0);return v800;end;v279.updateState=function(v807,v808,v809) local v810=v807.players[v808];if  not v810 then return;end v810.character=v809;v810.humanoidRootPart=v809:FindFirstChild("HumanoidRootPart") or v809:FindFirstChild("UpperTorso") or v809:FindFirstChild("Torso") or v809:FindFirstChild("Head") or v809.PrimaryPart ;v810.humanoid=v809:FindFirstChildOfClass("Humanoid") or v809:FindFirstChild("Humanoid") ;v810.parts={};if ( not v810.humanoid or  not v810.humanoidRootPart) then return;end for v1808,v1809 in ipairs(v277) do local v1810=v809:FindFirstChild(v1809);if v1810 then v810.parts[v1809]=v1810;end end end;v279.bounds=function(v815,v816) local v817=v816.humanoidRootPart;if  not v817 then return nil;end local v818=v816.parts and v816.parts.Head ;local v819,v820;if v818 then v819=v818.Position + Vector3.new(0,(v818.Size.Y/2) + 0.4 ,0) ;v820=v818.Position-Vector3.new(0,math.max(0.5,v818.Position.Y-v817.Position.Y ) + 3.2 ,0) ;else v819=(v817.CFrame * CFrame.new(0,3,0)).Position;v820=(v817.CFrame * CFrame.new(0, -3.5,0)).Position;end local v821=v167:WorldToViewportPoint(v819);local v822=v167:WorldToViewportPoint(v820);if ((v821.Z<=0) or (v822.Z<=0)) then return nil;end local v823=math.abs(v821.Y-v822.Y );if (v823<1) then return nil;end local v824=v823 * 0.6 * (v276.boundsScale/100) ;return v824,v823,Vector2.new(v821.X,v821.Y);end;v279.drawSkeleton=function(v825,v826) for v1811,v1812 in ipairs(v826.lines) do v1812.Visible=false;end if ( not v275.skeleton or  not v826.character) then return;end for v1814,v1815 in ipairs(v278) do local v1816=v826.parts[v1815[1]];local v1817=v826.parts[v1815[2]];if ( not v1816 or  not v1817) then continue;end local v1818=v167:WorldToViewportPoint(v1816.Position);local v1819=v167:WorldToViewportPoint(v1817.Position);if ((v1818.Z<=0) or (v1819.Z<=0)) then continue;end local v1820=v826.lines[v1814];v1820.From=Vector2.new(v1818.X,v1818.Y);v1820.To=Vector2.new(v1819.X,v1819.Y);v1820.Color=v276.color;v1820.Thickness=(v275.skeletonOutline and 2) or 1 ;v1820.Visible=true;end end;v279.drawBox=function(v827,v828,v829,v830,v831) v828.squares[1].Visible=false;v828.squares[2].Visible=false;if  not v275.box then return;end v828.squares[2].Size=Vector2.new(v829,v830);v828.squares[2].Position=v831-Vector2.new(v829/2 ,0) ;v828.squares[2].Color=v276.color;v828.squares[2].Filled=v275.fill;v828.squares[2].Visible=true;end;v279.drawText=function(v840,v841,v842,v843,v844) for v1827,v1828 in ipairs(v841.text) do v1828.Visible=false;end local v845=v844-Vector2.new(0,15) ;local v846=v844 + Vector2.new(0,v843 + 2 ) ;if v275.name then v841.text[1].Text=v841.player.Name;v841.text[1].Position=v845;v841.text[1].Color=v276.color;v841.text[1].Visible=true;end if v275.weapon then local v2762=v841.character and (v841.character:FindFirstChildOfClass("Tool") or v841.character:FindFirstChild("EquippedItem")) ;v841.text[2].Text=(v2762 and v2762.Name) or "None" ;v841.text[2].Position=v846;v841.text[2].Color=v276.color;v841.text[2].Visible=true;v846=v846 + Vector2.new(0,14) ;end if (v275.distance and v841.humanoidRootPart) then local v2768=math.round((v841.humanoidRootPart.Position-v167.CFrame.Position).Magnitude);v841.text[3].Text="["   .. v2768   .. "m]" ;v841.text[3].Position=v846;v841.text[3].Color=v276.color;v841.text[3].Visible=true;end end;v279.drawHealthbar=function(v847,v848,v849,v850,v851) v848.squares[3].Visible=false;v848.squares[4].Visible=false;if ( not v275.healthbar or  not v848.humanoid) then return;end local v854=math.clamp(v848.humanoid.Health/v848.humanoid.MaxHealth ,0,1);local v855=v850 * v854 ;local v856=v851-Vector2.new((v849/2) + 6 , -v850 + v855 ) ;local v857=v851-Vector2.new((v849/2) + 6 ,0) ;v848.squares[4].Size=Vector2.new(3,v850);v848.squares[4].Position=v857;v848.squares[4].Visible=true;v848.squares[3].Size=Vector2.new(3,v855);v848.squares[3].Position=v856;v848.squares[3].Color=Color3.fromRGB(255,0,0):Lerp(Color3.fromRGB(0,255,0),v854);v848.squares[3].Visible=true;end;v279.hideAll=function(v863,v864) for v1830,v1831 in ipairs(v864.drawings) do v1831.Visible=false;end end;v279.update=function(v865,v866) local v867=v865.players[v866];if  not v867 then return;end if  not v275.master then v865:hideAll(v867);return;end local v868=v867.character;if ( not v868 or  not v867.humanoidRootPart or  not v867.humanoid or (v867.humanoid.Health<=0)) then v865:hideAll(v867);return;end if (v866==v161) then v865:hideAll(v867);return;end local v869,v870,v871=v865:bounds(v867);if  not v869 then v865:hideAll(v867);return;end v865:drawSkeleton(v867);v865:drawBox(v867,v869,v870,v871);v865:drawText(v867,v869,v870,v871);v865:drawHealthbar(v867,v869,v870,v871);end;v279.start=function(v872) local function v873(v1833) if v152.Unloaded then return;end local v1834=v872:createState(v1833);v872.players[v1833]=v1834;local function v1836(v2774) task.spawn(function() v872:updateState(v1833,v2774);end);end table.insert(v1834.connections,v1833.CharacterAdded:Connect(v1836));table.insert(v1834.connections,v1833.CharacterRemoving:Connect(function() v872:hideAll(v1834);v1834.character=nil;end));if v1833.Character then v1836(v1833.Character);end end for v1837,v1838 in ipairs(v7:GetPlayers()) do v873(v1838);end v7.PlayerAdded:Connect(v873);v7.PlayerRemoving:Connect(function(v1839) local v1840=v872.players[v1839];if  not v1840 then return;end for v2776,v2777 in ipairs(v1840.connections) do pcall(v2777.Disconnect,v2777);end for v2778,v2779 in ipairs(v1840.drawings) do pcall(v2779.Remove,v2779);end v872.players[v1839]=nil;end);v155.RenderStepped:Connect(function() if v152.Unloaded then return;end if  not v275.master then if  not v872._hiddenOnce then v872._hiddenOnce=true;for v3598,v3599 in pairs(v872.players) do v872:hideAll(v3599);end end return;end v872._hiddenOnce=false;for v2780 in pairs(v872.players) do if (v2780.Parent and v2780.Character) then v872:update(v2780);end end end);end;local v292=v279.new();v292:start();local v293={Visible=false,SpinSpeed=0.005,CentralGap=8,TotalLength=112,LineThickness=2,OutlineThickness=4,ColorStart=Color3.fromRGB(180,180,180),ColorEnd=Color3.fromRGB(20,20,20),CircleVisible=true,CircleRadius=119,CircleTransparency=0.3,CircleColor=Color3.fromRGB(15,15,25),TrackingEnabled=false,TrackingRadius=150,TrackingSmoothness=0.2,TrackPart="Head",TeamCheck=true};local v294=2;local v295,v296,v297={},{},nil;local function v298() if v297 then v297:Remove();v297=nil;end for v1843=1, #v295 do if v295[v1843] then for v3326=1, #v295[v1843] do if v295[v1843][v3326] then v295[v1843][v3326]:Remove();end if v296[v1843][v3326] then v296[v1843][v3326]:Remove();end end end end v295,v296={},{};end local function v299() v298();v297=v230.new("Circle");v297.Filled=true;v297.NumSides=64;v297.Radius=v293.CircleRadius;v297.Color=v293.CircleColor;v297.Transparency=v293.CircleTransparency;v297.Visible=v293.Visible and v293.CircleVisible ;local v883=math.max(1,math.floor(v293.TotalLength/v294 ));for v1844=1,4 do v295[v1844],v296[v1844]={},{};for v2781=1,v883 do local v2782=(v2781-0.5)/v883 ;local v2783=v230.new("Line");v2783.Thickness=v293.OutlineThickness;v2783.Color=Color3.new(0,0,0);v2783.Visible=v293.Visible;local v2789=v230.new("Line");v2789.Thickness=v293.LineThickness;v2789.Color=v293.ColorStart:Lerp(v293.ColorEnd,v2782);v2789.Visible=v293.Visible;v296[v1844][v2781]=v2783;v295[v1844][v2781]=v2789;end end end local function v300(v884) local v885,v886=nil,v293.TrackingRadius;for v1847,v1848 in ipairs(v7:GetPlayers()) do if ((v1848==v161) or  not v1848.Character) then continue;end local v1849=v1848.Character:FindFirstChild(v293.TrackPart);local v1850=v1848.Character:FindFirstChildOfClass("Humanoid");if ( not v1849 or  not v1850 or (v1850.Health<=0)) then continue;end if (v293.TeamCheck and (v1848.Team==v161.Team)) then continue;end local v1851,v1852=v167:WorldToViewportPoint(v1849.Position);if v1852 then local v3072=(Vector2.new(v1851.X,v1851.Y) -v884).Magnitude;if (v3072<v886) then v886=v3072;v885=Vector2.new(v1851.X,v1851.Y);end end end return v885;end local v301={0,math.pi/2 ,math.pi,math.pi * 1.5 };local v302=0;local v303,v304=0,0;v155.RenderStepped:Connect(function() if v152.Unloaded then return;end if v293.Visible then local v2796=v293.SpinSpeed;local v2797=tick();if (v2796~=0) then if (v304==0) then v304=v2797;end v302=v303 + ((v2797-v304) * v2796) ;elseif (v304~=0) then v303=v302;v304=0;end local v2798=Vector2.new(v167.ViewportSize.X/2 ,v167.ViewportSize.Y/2 );local v2799=v2798;if v293.TrackingEnabled then local v3327=v300(v2798);if v3327 then v2799=v3327;end end v227=v227:Lerp(v2799,v293.TrackingSmoothness);if v297 then v297.Position=v227;v297.Radius=v293.CircleRadius;v297.Color=v293.CircleColor;v297.Transparency=v293.CircleTransparency;v297.Visible=v293.CircleVisible;end local v2800=math.max(1,math.floor(v293.TotalLength/v294 ));for v3073=1,4 do local v3074=v301[v3073] + v302 ;local v3075,v3076=math.cos(v3074),math.sin(v3074);local v3077,v3078=v295[v3073],v296[v3073];if  not v3077 then continue;end for v3337=1, #v3077 do local v3338,v3339=v3077[v3337],v3078[v3337];if ( not v3338 or  not v3339) then continue;end local v3340=v293.CentralGap + ((v3337-1) * v294) ;local v3341=v293.CentralGap + (v3337 * v294) ;local v3342=v227 + Vector2.new(v3075 * v3340 ,v3076 * v3340 ) ;local v3343=v227 + Vector2.new(v3075 * v3341 ,v3076 * v3341 ) ;v3339.From=v3342;v3339.To=v3343;v3339.Thickness=v293.OutlineThickness;v3339.Visible=true;v3338.From=v3342;v3338.To=v3343;v3338.Thickness=v293.LineThickness;v3338.Color=v293.ColorStart:Lerp(v293.ColorEnd,(v3337-0.5)/v2800 );v3338.Visible=true;end end elseif (v297 and v297.Visible) then v297.Visible=false;for v3500=1,4 do local v3501,v3502=v295[v3500],v296[v3500];if  not v3501 then continue;end for v3600=1, #v3501 do if v3501[v3600] then v3501[v3600].Visible=false;end if v3502[v3600] then v3502[v3600].Visible=false;end end end end end);v299();local v305=false;local v306=16;local v307=false;local v308=50;local v309=false;local v310=50;local v311;local function v312() local v887=v161.Character;if  not v887 then return;end local v888=v887:FindFirstChildOfClass("Humanoid");if  not v888 then return;end v888.WalkSpeed=(v305 and v306) or 16 ;end local function v313() local v890=v161.Character;if  not v890 then return;end local v891=v890:FindFirstChildOfClass("Humanoid");if  not v891 then return;end v891.UseJumpPower=true;v891.JumpPower=(v307 and v308) or 50 ;end local function v314(v894) v309=v894;if v311 then v311:Disconnect();v311=nil;end if  not v309 then local v2801=v161.Character;local v2802=v2801 and v2801:FindFirstChild("HumanoidRootPart") ;if v2802 then v2802.AssemblyLinearVelocity=Vector3.new(0,0,0);end return;end v311=v155.RenderStepped:Connect(function() local v1853=v161.Character;local v1854=v1853 and v1853:FindFirstChild("HumanoidRootPart") ;if  not v1854 then return;end local v1855=Vector3.new(0,0,0);local v1856=workspace.CurrentCamera;if v156:IsKeyDown(Enum.KeyCode.W) then v1855=v1855 + v1856.CFrame.LookVector ;end if v156:IsKeyDown(Enum.KeyCode.S) then v1855=v1855-v1856.CFrame.LookVector ;end if v156:IsKeyDown(Enum.KeyCode.A) then v1855=v1855-v1856.CFrame.RightVector ;end if v156:IsKeyDown(Enum.KeyCode.D) then v1855=v1855 + v1856.CFrame.RightVector ;end if v156:IsKeyDown(Enum.KeyCode.Space) then v1855=v1855 + Vector3.new(0,1,0) ;end if v156:IsKeyDown(Enum.KeyCode.LeftControl) then v1855=v1855-Vector3.new(0,1,0) ;end v1854.AssemblyLinearVelocity=v1855 * v310 ;v1854.AssemblyAngularVelocity=Vector3.new(0,0,0);end);end v161.CharacterAdded:Connect(function() task.wait(0.5);if v305 then v312();end if v307 then v313();end if v309 then v314(true);end end);local v315=false;local v316="Rain";local v317=31;local v318=Color3.fromRGB(200,220,255);local v319=v158.Brightness;local v320=0;local v321=false;local v322=workspace:FindFirstChild("CustomWeatherFolder") or Instance.new("Folder") ;v322.Name="CustomWeatherFolder";v322.Parent=workspace;local v325={};local v326=120;for v895=1,v326 do local v896=Instance.new("Part");v896.Name="WeatherParticle";v896.Material=Enum.Material.SmoothPlastic;v896.Transparency=0.4;v896.CanCollide=false;v896.Anchored=true;v896.CastShadow=false;v896.Parent=v322;table.insert(v325,{Part=v896,Active=false,Speed=0,Drift=0});end v155.RenderStepped:Connect(function() if v152.Unloaded then return;end if  not v315 then for v3079,v3080 in ipairs(v325) do if v3080.Active then v3080.Active=false;v3080.Part.CFrame=CFrame.new(0, -1000,0);end end if v321 then v158.Brightness=v319;v321=false;end return;end local v905=v161.Character;local v906=v905 and v905:FindFirstChild("HumanoidRootPart") ;if  not v906 then return;end local v907=math.clamp(math.floor((v317/100) * v326 ),5,v326);local v908=v906.Position;for v1859=1,v326 do local v1860=v325[v1859];if (v1859<=v907) then if ( not v1860.Active or (v1860.Part.Position.Y<(v908.Y-10))) then v1860.Part.CFrame=CFrame.new(v908 + Vector3.new(math.random( -60,60),math.random(20,50),math.random( -60,60)) );v1860.Active=true;if (v316=="Snow") then v1860.Part.Size=Vector3.new(0.4,0.4,0.4);v1860.Part.Shape=Enum.PartType.Ball;v1860.Speed=math.random(10,25);v1860.Drift=math.random( -5,5)/10 ;elseif (v316=="Storm") then v1860.Part.Size=Vector3.new(0.09,3.2,0.09);v1860.Part.Shape=Enum.PartType.Block;v1860.Speed=math.random(150,220);v1860.Drift=0;else v1860.Part.Size=Vector3.new(0.08,2.5,0.08);v1860.Part.Shape=Enum.PartType.Block;v1860.Speed=math.random(80,120);v1860.Drift=0;end else v1860.Part.CFrame=v1860.Part.CFrame-Vector3.new(v1860.Drift,v1860.Speed * (1/60) ,0) ;v1860.Part.Color=v318;end elseif v1860.Active then v1860.Active=false;v1860.Part.CFrame=CFrame.new(0, -1000,0);end end if ((v316=="Storm") and (tick()>=v320)) then v320=tick() + (math.random(40,180)/10) ;v321=true;task.spawn(function() for v3358=1,math.random(1,3) do v158.Brightness=v319 + 6 ;task.wait(0.06);if ( not v315 or (v316~="Storm")) then break;end v158.Brightness=v319;task.wait(math.random(4,12)/100 );end v158.Brightness=v319;end);end end);local v327=false;local v328="Highlight";local v329=false;local v330=5;local v331=Color3.fromRGB(255,255,255);local v332=Color3.fromRGB(255,255,255);local v333=0.5;local v334=0;local v335=false;local v336=90;local v337=(workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView) or 70 ;local v338=0;local v339={};local v340=false;local v341,v342=0,true;local function v343() v342=true;end local function v344(v909) v339={Parts={},Clothing={},Textures={},Mesh={}};for v1861,v1862 in ipairs(v909:GetDescendants()) do if v1862:IsA("BasePart") then v339.Parts[v1862]={Material=v1862.Material,Color=v1862.Color,Transparency=v1862.Transparency};elseif (v1862:IsA("Clothing") or v1862:IsA("ShirtGraphic")) then v339.Clothing[v1862]=v1862.Parent;elseif (v1862:IsA("Decal") or v1862:IsA("Texture")) then v339.Textures[v1862]=v1862.Transparency;end end end local function v345(v910) if  not v340 then return;end v340=false;local v911=v228:FindFirstChild("SelfHighlight");if v911 then v911:Destroy();end for v1863,v1864 in pairs(v339.Parts or {} ) do if (v1863 and v1863.Parent) then v1863.Material=v1864.Material;v1863.Color=v1864.Color;v1863.Transparency=v1864.Transparency;end end for v1865,v1866 in pairs(v339.Clothing or {} ) do if v1865 then v1865.Parent=v1866;end end for v1867,v1868 in pairs(v339.Textures or {} ) do if (v1867 and v1867.Parent) then v1867.Transparency=v1868;end end for v1869,v1870 in pairs(v339.Mesh or {} ) do if (v1869 and v1869.Parent) then pcall(function() v1869.TextureID=v1870;end);end end v339={};end local v346={ForceField=Enum.Material.ForceField,["Solid Color"]=Enum.Material.SmoothPlastic,Neon=Enum.Material.Neon,Glass=Enum.Material.Glass,Ice=Enum.Material.Ice,Metal=Enum.Material.Metal,Foil=Enum.Material.Foil,Marble=Enum.Material.Marble,Granite=Enum.Material.Granite,Wood=Enum.Material.Wood,Brick=Enum.Material.Brick,Cobblestone=Enum.Material.Cobblestone,Sand=Enum.Material.Sand,Fabric=Enum.Material.Fabric,Concrete=Enum.Material.Concrete,Slate=Enum.Material.Slate};local function v347() local v912=v161.Character;if ( not v912 or  not v912:FindFirstChild("HumanoidRootPart")) then return;end if  not v327 then v345(v912);return;end if  not v340 then v344(v912);v340=true;end local v913=(v329 and Color3.fromHSV(v338,1,1)) or v331 ;if (v328=="Highlight") then for v3091,v3092 in pairs(v339.Clothing) do if v3091 then v3091.Parent=v3092;end end for v3093,v3094 in pairs(v339.Textures) do if v3093 then v3093.Transparency=v3094;end end for v3095,v3096 in pairs(v339.Parts) do if v3095 then v3095.Material=v3096.Material;v3095.Color=v3096.Color;v3095.Transparency=v3096.Transparency;end end local v2803=v228:FindFirstChild("SelfHighlight") or Instance.new("Highlight") ;v2803.Name="SelfHighlight";v2803.Adornee=v912;v2803.Enabled=true;v2803.FillColor=v913;v2803.OutlineColor=(v329 and v913) or v332 ;v2803.FillTransparency=v333;v2803.OutlineTransparency=v334;v2803.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop;v2803.Parent=v228;elseif v346[v328] then local v3361=v228:FindFirstChild("SelfHighlight");if v3361 then v3361:Destroy();end for v3521 in pairs(v339.Clothing) do if v3521 then v3521.Parent=nil;end end for v3522 in pairs(v339.Textures) do if v3522 then v3522.Transparency=1;end end local v3362=v346[v328];for v3523,v3524 in ipairs(v912:GetDescendants()) do if (v3524:IsA("BasePart") and (v3524.Name~="HumanoidRootPart")) then if v3524:IsA("MeshPart") then if (v339.Mesh and (v339.Mesh[v3524]==nil)) then v339.Mesh[v3524]=v3524.TextureID;end pcall(function() v3524.TextureID="";end);end v3524.Material=v3362;v3524.Color=v913;v3524.Transparency=v333;end end end end v155.RenderStepped:Connect(function(v914) if v152.Unloaded then return;end if v329 then v338=(v338 + (v914 * v330 * 0.2))%1 ;end v341=v341 + v914 ;if (v342 or (v341>=0.2)) then v341=0;v342=false;v347();if v335 then workspace.CurrentCamera.FieldOfView=v336;end elseif (v329 and v340) then v347();elseif v335 then workspace.CurrentCamera.FieldOfView=v336;end end);v161.CharacterAdded:Connect(function() v340=false;v339={};end);local v348=v158:FindFirstChild("CustomColorCorrection") or Instance.new("ColorCorrectionEffect") ;v348.Name="CustomColorCorrection";v348.Parent=v158;local v351=v158:FindFirstChild("CustomBloom") or Instance.new("BloomEffect") ;v351.Name="CustomBloom";v351.Parent=v158;local v354=false;local v355=false;local function v356(v915,v916,v917,v918) v348.Enabled=v354;if v354 then v348.Brightness=v915;v348.Contrast=v916;v348.Saturation=v917;v348.TintColor=v918;end end local function v357(v920,v921,v922) v351.Enabled=v355;if v355 then v351.Intensity=v920;v351.Size=v921;v351.Threshold=v922;end end local v358={Enabled=false,CurrentID="6031075931",IconSize=32};local v359={["Clean White Dot"]="6031075931",["Red Dot"]="6830874135",["Crosshair Small"]="138380362",["Crosshair Large"]="254508119",["Circle Scope"]="3523723128",["Purple Crosshair"]="6031075931",["Target Scope"]="5820712980"};local v360={};for v924,v925 in pairs(v359) do table.insert(v360,v924);end local v361=Instance.new("ScreenGui");v361.Name="CustomShiftlockOverlay";v361.ResetOnSpawn=false;pcall(function() v361.Parent=v159;end);if  not v361.Parent then v361.Parent=v163;end local v364=Instance.new("ImageLabel");v364.Name="CursorImage";v364.AnchorPoint=Vector2.new(0.5,0.5);v364.BackgroundTransparency=1;v364.Size=UDim2.new(0,32,0,32);v364.Visible=false;v364.Parent=v361;local function v371(v927) pcall(function() local v1872=v159:FindFirstChild("RobloxGui") or v161.PlayerGui ;for v2821,v2822 in pairs(v1872:GetDescendants()) do if (v2822:IsA("ImageLabel") and ((v2822.Name=="ShiftLockCursor") or (v2822.Name=="MouseIcon"))) then v2822.ImageTransparency=(v927 and 1) or 0 ;end end end);end v155.RenderStepped:Connect(function() if v152.Unloaded then return;end if  not v358.Enabled then v364.Visible=false;v371(false);return;end if (v156.MouseBehavior==Enum.MouseBehavior.LockCenter) then v371(true);local v2824=workspace.CurrentCamera.ViewportSize;v364.Position=UDim2.new(0,v2824.X/2 ,0,v2824.Y/2 );v364.Image="rbxassetid://"   .. tostring(v358.CurrentID):gsub("%D","") ;v364.Size=UDim2.new(0,v358.IconSize,0,v358.IconSize);v364.Visible=true;else v364.Visible=false;v371(false);end end);local v372={CurrentTime=14,FreezeTime=false};local function v373(v928) v372.CurrentTime=v928;v158.ClockTime=v928;end v155.RenderStepped:Connect(function() if v372.FreezeTime then v158.ClockTime=v372.CurrentTime;end end);local function v374(v931,v932,v933) local v934=Instance.new(v931);local v935=nil;for v1873,v1874 in pairs(v932) do if (v1873=="Parent") then v935=v1874;else v934[v1873]=v1874;end end v934.Parent=v935 or v933 ;return v934;end local v375={Exposure=v158.ExposureCompensation,FogStart=v158.FogStart,FogEnd=v158.FogEnd,FogColor=v158.FogColor,Fov=(workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView) or 70 };local v376={Enabled=true,AtmoEnabled=true,Density=0.32,Offset=0.5,Haze=1.8,Glare=0.35,AtmoColor=Color3.fromRGB(199,199,199),AtmoDecay=Color3.fromRGB(106,112,125),CcEnabled=true,Brightness=0,Contrast=0.12,Saturation=0.12,Exposure=0.12,TintColor=Color3.fromRGB(255,244,230),FogEnabled=false,FogStart=150,FogEnd=1400,FogColor=Color3.fromRGB(190,200,215),VignetteEnabled=true,VignetteStrength=0.5};local v377={Default={AtmoEnabled=false,CcEnabled=false,FogEnabled=false,VignetteEnabled=false,Exposure=0},Cinematic={AtmoEnabled=true,Density=0.32,Haze=1.8,Glare=0.35,AtmoColor=Color3.fromRGB(199,199,199),AtmoDecay=Color3.fromRGB(106,112,125),CcEnabled=true,Contrast=0.12,Saturation=0.12,TintColor=Color3.fromRGB(255,244,230),Exposure=0.12,VignetteEnabled=true,VignetteStrength=0.5,FogEnabled=false},Hazy={AtmoEnabled=true,Density=0.55,Haze=3.5,Glare=0.15,AtmoColor=Color3.fromRGB(220,220,225),AtmoDecay=Color3.fromRGB(140,145,160),CcEnabled=true,Contrast=0.05,Saturation= -0.08,TintColor=Color3.fromRGB(245,245,250),Exposure=0.08,FogEnabled=true,FogStart=80,FogEnd=900,FogColor=Color3.fromRGB(205,210,220),VignetteEnabled=true,VignetteStrength=0.35},Vibrant={AtmoEnabled=true,Density=0.25,Haze=1.2,Glare=0.45,AtmoColor=Color3.fromRGB(199,199,199),AtmoDecay=Color3.fromRGB(106,112,125),CcEnabled=true,Contrast=0.22,Saturation=0.4,TintColor=Color3.fromRGB(255,255,255),Exposure=0.1,VignetteEnabled=false,FogEnabled=false},Noir={AtmoEnabled=true,Density=0.4,Haze=2.2,Glare=0.1,AtmoColor=Color3.fromRGB(160,160,170),AtmoDecay=Color3.fromRGB(60,60,70),CcEnabled=true,Contrast=0.3,Saturation= -0.85,Brightness= -0.03,TintColor=Color3.fromRGB(235,235,240),Exposure= -0.05,VignetteEnabled=true,VignetteStrength=0.75,FogEnabled=true,FogStart=100,FogEnd=700,FogColor=Color3.fromRGB(40,40,48)},Night={AtmoEnabled=true,Density=0.45,Haze=2.5,Glare=0.05,AtmoColor=Color3.fromRGB(120,135,170),AtmoDecay=Color3.fromRGB(40,45,70),CcEnabled=true,Contrast=0.15,Saturation= -0.15,TintColor=Color3.fromRGB(200,215,255),Exposure= -0.1,VignetteEnabled=true,VignetteStrength=0.6,FogEnabled=true,FogStart=60,FogEnd=600,FogColor=Color3.fromRGB(25,30,50)}};local v378=v374("Atmosphere",{Name="teddyhubAtmosphere",Color=v376.AtmoColor,Decay=v376.AtmoDecay},nil);local v379=v374("ColorCorrectionEffect",{Name="teddyhubColorCorrection",Parent=v158});local v380=v374("ScreenGui",{Name="teddyhubVignette",IgnoreGuiInset=true,ResetOnSpawn=false,DisplayOrder=100,Enabled=false,Parent=v163});local v381={};local function v382(v937,v938,v939,v940) local v941=v374("Frame",{Name=v937,Size=v938,Position=v939,BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=0,BorderSizePixel=0,ZIndex=5},v380);local v942=v374("UIGradient",{Rotation=v940,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,1)})},v941);table.insert(v381,v942);end v382("Top",UDim2.new(1,0,0.32,0),UDim2.new(0,0,0,0),90);v382("Bottom",UDim2.new(1,0,0.32,0),UDim2.new(0,0,0.68,0),270);v382("Left",UDim2.new(0.32,0,1,0),UDim2.new(0,0,0,0),0);v382("Right",UDim2.new(0.32,0,1,0),UDim2.new(0.68,0,0,0),180);local v383=false;local v384=false;local function v385() v380.Enabled=v376.Enabled and v376.VignetteEnabled ;if  not v380.Enabled then return;end local v944=1 -math.clamp(v376.VignetteStrength,0,1) ;for v1875,v1876 in ipairs(v381) do v1876.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,v944),NumberSequenceKeypoint.new(1,1)});end end local function v386() local v945=v376.Enabled;if (v945 and v376.AtmoEnabled) then v378.Parent=v158;v378.Density=v376.Density;v378.Offset=v376.Offset;v378.Haze=v376.Haze;v378.Glare=v376.Glare;v378.Color=v376.AtmoColor;v378.Decay=v376.AtmoDecay;else v378.Parent=nil;end v379.Enabled=v945 and v376.CcEnabled ;if v379.Enabled then v379.Brightness=v376.Brightness;v379.Contrast=v376.Contrast;v379.Saturation=v376.Saturation;v379.TintColor=v376.TintColor;end local v947=v945 and v376.CcEnabled ;if v947 then v158.ExposureCompensation=v376.Exposure;elseif v383 then v158.ExposureCompensation=v375.Exposure;end v383=v947;local v948=v945 and v376.FogEnabled ;if v948 then v158.FogStart=v376.FogStart;v158.FogEnd=v376.FogEnd;v158.FogColor=v376.FogColor;elseif v384 then v158.FogStart=v375.FogStart;v158.FogEnd=v375.FogEnd;v158.FogColor=v375.FogColor;end v384=v948;v385();end local v387={};local function v388(v949,v950,v951) table.insert(v387,{kind=v950,idx=v949,key=v951});end local function v389(v952,v953,v954,v955) v955.Callback=function(v1878) v376[v954]=v1878;v386();end;v952:AddToggle(v953,v955);v388(v953,"toggle",v954);end local function v390(v957,v958,v959,v960) v960.Callback=function(v1880) v376[v959]=v1880;v386();end;v957:AddSlider(v958,v960);v388(v958,"slider",v959);end local function v391(v962,v963,v964,v965,v966) v962:AddLabel(v963):AddColorPicker(v964,{Default=v966,Callback=function(v1882) v376[v965]=v1882;v386();end});v388(v964,"color",v965);end local function v392() for v1884,v1885 in ipairs(v387) do local v1886=v376[v1885.key];if (v1885.kind=="toggle") then if (Toggles[v1885.idx] and (Toggles[v1885.idx].Value~=v1886)) then Toggles[v1885.idx]:SetValue(v1886);end elseif (v1885.kind=="slider") then if (Options[v1885.idx] and (Options[v1885.idx].Value~=v1886)) then Options[v1885.idx]:SetValue(v1886);end elseif (v1885.kind=="color") then if (Options[v1885.idx] and (Options[v1885.idx].Value~=v1886)) then Options[v1885.idx]:SetValueRGB(v1886);end end end end local function v393(v967) local v968=v377[v967];if  not v968 then return;end for v1887,v1888 in pairs(v968) do v376[v1887]=v1888;end v392();v386();end local v394={enabled=false,teamCheck=false,fov=200,hitpart="Head",wallCheck=false,hitChance=100,showFov=false};local function v395() local v969=Vector2.new(v167.ViewportSize.X/2 ,v167.ViewportSize.Y/2 );local v970,v971=nil,v394.fov;for v1890,v1891 in ipairs(v7:GetPlayers()) do if ((v1891==v161) or  not v1891.Character) then continue;end local v1892=v1891.Character:FindFirstChildOfClass("Humanoid");local v1893=v1891.Character:FindFirstChild(v394.hitpart) or v1891.Character:FindFirstChild("HumanoidRootPart") ;if ( not v1892 or (v1892.Health<=0) or  not v1893) then continue;end if (v394.teamCheck and (v1891.Team==v161.Team)) then continue;end local v1894,v1895=v167:WorldToViewportPoint(v1893.Position);if  not v1895 then continue;end local v1896=(Vector2.new(v1894.X,v1894.Y) -v969).Magnitude;if v394.wallCheck then local v3098=RaycastParams.new();v3098.FilterType=Enum.RaycastFilterType.Exclude;v3098.FilterDescendantsInstances={v161.Character,v1891.Character};local v3102=v167.CFrame.Position;if workspace:Raycast(v3102,v1893.Position-v3102 ,v3098) then continue;end end if (v1896<v971) then v971=v1896;v970=v1893;end end if (v970 and (math.random(1,100)>v394.hitChance)) then return nil;end return v970;end local v396;pcall(function() v396=Drawing.new("Circle");v396.Thickness=1;v396.Color=Color3.fromRGB(255,128,0);v396.Filled=false;v396.Visible=false;end);getgenv().__silFillRings=v152.FillRings(16);v155.RenderStepped:Connect(function() if  not v396 then return;end v396.Visible=(v394.showFov and v394.enabled and true) or false ;v396.Position=Vector2.new(v167.ViewportSize.X/2 ,v167.ViewportSize.Y/2 );v396.Radius=v394.fov;v152.UpdateFill(getgenv().__silFillRings,v394.showFov and v394.enabled ,v396.Position,v394.fov,v152.FillState.sil);end);local v398=false;pcall(function() local v980=getrawmetatable(game);local v981=rawget(v980,"__index");setreadonly(v980,false);rawset(v980,"__index",newcclosure(function(v1897,v1898) if (v1897==v162) then if (v270.silent and v270.silentPart) then if (v1898=="Hit") then return v270.silentCFrame;end if (v1898=="Target") then return v270.silentPart;end if (v1898=="UnitRay") then local v3644=v167.CFrame.Position;return Ray.new(v3644,v270.silentCFrame.Position-v3644 );end end if v394.enabled then if (v1898=="Hit") then local v3645=v395();if v3645 then return v3645.CFrame;end elseif (v1898=="Target") then local v3705=v395();if v3705 then return v3705;end elseif (v1898=="UnitRay") then local v3739=v395();if v3739 then local v3764=v167.CFrame.Position;return Ray.new(v3764,v3739.Position-v3764 );end end end end return v981(v1897,v1898);end));setreadonly(v980,true);v398=true;end);if  not v398 then pcall(function() local v2862=getrawmetatable(game);local v2863=rawget(v2862,"__namecall");setreadonly(v2862,false);rawset(v2862,"__namecall",newcclosure(function(v3103,...) local v3104=getnamecallmethod();if (v3103==v162) then if (v270.silent and v270.silentPart) then if (v3104=="Hit") then return v270.silentCFrame;end if (v3104=="Target") then return v270.silentPart;end if (v3104=="UnitRay") then local v3706=v167.CFrame.Position;return Ray.new(v3706,v270.silentCFrame.Position-v3706 );end end if v394.enabled then if (v3104=="Hit") then local v3707=v395();if v3707 then return v3707.CFrame;end elseif (v3104=="Target") then local v3740=v395();if v3740 then return v3740;end elseif (v3104=="UnitRay") then local v3765=v395();if v3765 then local v3772=v167.CFrame.Position;return Ray.new(v3772,v3765.Position-v3772 );end end end end return v2863(v3103,...);end));setreadonly(v2862,true);v398=true;end);end v152:Notify((v398 and "silent aim hook ok") or "silent aim hook fehlgeschlagen (executor)" ,6);local function v399() local function v982(v1899) return v270.silentCFrame.Position-v1899 ;end local function v983() return v270.silent and (v270.silentPart~=nil) and (tick()<v270.silentUntil) ;end local function v984(v1900) local v1901=v161.Character and v161.Character:FindFirstChild("Head") ;return (v1901~=nil) and ((v1900-v1901.Position).Magnitude<15) ;end if hookfunction then pcall(function() local v3105=v167.ViewportPointToRay;hookfunction(v3105,function(v3373,v3374,v3375) if ((v3373==v167) and v983()) then local v3602=Vector2.new(v3373.ViewportSize.X,v3373.ViewportSize.Y) * 0.5 ;if ((v3374-v3602).Magnitude<80) then local v3673=v3373.CFrame.Position;return Ray.new(v3673,v982(v3673));end end return v3105(v3373,v3374,v3375);end);end);pcall(function() local v3106=v167.ScreenPointToRay;hookfunction(v3106,function(v3376,v3377,v3378,v3379) if ((v3376==v167) and v983()) then local v3603=Vector2.new(v3376.ViewportSize.X,v3376.ViewportSize.Y) * 0.5 ;if ((Vector2.new(v3377,v3378) -v3603).Magnitude<80) then local v3674=v3376.CFrame.Position;return Ray.new(v3674,v982(v3674));end end return v3106(v3376,v3377,v3378,v3379);end);end);pcall(function() local v3107=workspace.Raycast;hookfunction(v3107,function(v3380,v3381,v3382,v3383) if (v983() and v984(v3381)) then return v3107(v3380,v3381,v982(v3381),v3383);end return v3107(v3380,v3381,v3382,v3383);end);end);pcall(function() local v3108=workspace.FindPartOnRayWithIgnoreList;if v3108 then hookfunction(v3108,function(v3604,v3605,v3606,...) if (v983() and v984(v3605.Origin)) then return v3108(v3604,Ray.new(v3605.Origin,v982(v3605.Origin)),v3606,...);end return v3108(v3604,v3605,v3606,...);end);end end);end end v15("silent rays",v399);local v400={};local function v401() print("[teddyhub] OK    LinoriaLib loaded, creating window");local v985=v152:CreateWindow({Title="teddyhub v.3",Center=true,AutoShow=true,TabPadding=8,MenuFadeTime=0.2});local v986={Combat=v985:AddTab("combat"),Visuals=v985:AddTab("visuals"),Movement=v985:AddTab("movement"),Misc=v985:AddTab("misc"),Crosshair=v985:AddTab("crosshair"),Settings=v985:AddTab("settings")};print("[teddyhub] OK    tab combat built");v400.combatL=v986.Combat:AddLeftTabbox();v400.combatR=v986.Combat:AddRightTabbox();local v989=v400.combatL:AddTab("aimbot");local v990=v400.combatR:AddTab("colors");local v991=v400.combatR:AddTab("anti-aim");local v992=v400.combatR:AddTab("trigger");v989:AddToggle("AimbotOn",{Text="aimbot",Default=false,Callback=function(v1902) v238=v1902;v250.Visible=v1902;if  not v1902 then for v3384,v3385 in ipairs(getgenv().__aimFillRings or {} ) do v3385.Visible=false;end end end});v989:AddToggle("LinkFovCH",{Text="link fov",Default=false,Callback=function(v1904) v247=v1904;end});v989:AddSlider("Smooth",{Text="smoothing",Default=5,Min=0,Max=100,Rounding=0,Callback=function(v1905) v237=1 -(v1905/100) ;end});v989:AddSlider("PredStr",{Text="prediction",Default=65,Min=0,Max=200,Rounding=0,Callback=function(v1906) v236=v1906/1000 ;end});v989:AddSlider("FovSize",{Text="radius",Default=100,Min=0,Max=1000,Rounding=0,Callback=function(v1907) v234=v1907;v250.Radius=v1907;end});v989:AddToggle("FovFill",{Text="fill fov",Default=false,Callback=function(v1909) v152.FillState.aim.enabled=v1909;end});v989:AddLabel("fill edge"):AddColorPicker("FovFillEdge",{Default=Color3.fromRGB(255,128,0),Callback=function(v1911) v152.FillState.aim.edge=v1911;end});v989:AddLabel("fill center"):AddColorPicker("FovFillCenter",{Default=Color3.fromRGB(255,128,0),Callback=function(v1913) v152.FillState.aim.center=v1913;end});v989:AddSlider("FovFillT",{Text="fill transparency",Default=60,Min=0,Max=100,Rounding=0,Callback=function(v1915) v152.FillState.aim.transparency=v1915/100 ;end});v989:AddToggle("WallChk",{Text="wall",Default=true,Callback=function(v1917) v239=v1917;end});v989:AddToggle("StickyOn",{Text="sticky",Default=false,Callback=function(v1918) v240=v1918;end});v989:AddDropdown("AB_Mode",{Text="aim mode",Default="Camera",Values={"Camera","Mouse"},Callback=function(v1919) v248=v1919;end});v989:AddSlider("AB_MouseSens",{Text="mouse sens",Default=50,Min=1,Max=300,Rounding=0,Callback=function(v1920) v249=v1920/100 ;end});v989:AddToggle("TeamChk",{Text="team",Default=false,Callback=function(v1921) v241=v1921;end});v989:AddToggle("HealthChk",{Text="health",Default=false,Callback=function(v1922) v242=v1922;end});v989:AddSlider("MinHp",{Text="min hp",Default=0,Min=0,Max=100,Rounding=0,Callback=function(v1923) v243=v1923;end});v989:AddToggle("RainbowFov",{Text="rainbow",Default=false,Callback=function(v1924) v232=v1924;end});v990:AddLabel("fov"):AddColorPicker("FovCol",{Default=v244,Callback=function(v1925) v244=v1925;if  not v232 then v250.Color=v1925;end end});v990:AddLabel("target"):AddColorPicker("TgtCol",{Default=v245,Callback=function(v1926) v245=v1926;end});v990:AddToggle("TargetHUD_Enable",{Text="target hud",Default=false,Callback=function(v1927) v225=v1927;if  not v1927 then v169.frame.Visible=false;end end});v991:AddToggle("AA_Enable",{Text="anti-aim",Default=false,Callback=function(v1928) v267.enabled=v1928;end});v991:AddDropdown("AA_YawMode",{Text="yaw",Default="At Targets",Values={"At Targets","Backwards","Forward","Spin","Random","Freestanding","Manual","Zero"},Callback=function(v1930) v267.yawMode=v1930;end});v991:AddSlider("AA_YawOffset",{Text="yaw offset",Default=0,Min= -180,Max=180,Rounding=0,Callback=function(v1932) v267.yawOffset=v1932;end});v991:AddToggle("AA_YawJitter",{Text="yaw jitter",Default=false,Callback=function(v1934) v267.yawJitter=v1934;end});v991:AddSlider("AA_YawJitterRange",{Text="jitter range",Default=30,Min=1,Max=90,Rounding=0,Callback=function(v1936) v267.yawJitterRange=v1936;end});v991:AddDropdown("AA_PitchMode",{Text="pitch",Default="Zero",Values={"Down","Up","Zero","Random","Jitter","Forward"},Callback=function(v1938) v267.pitchMode=v1938;end});v991:AddSlider("AA_PitchOffset",{Text="pitch offset",Default=0,Min= -89,Max=89,Rounding=0,Callback=function(v1940) v267.pitchOffset=v1940;end});v991:AddToggle("AA_LBY",{Text="fake yaw (lby)",Default=false,Callback=function(v1942) v267.lbyEnabled=v1942;end});v991:AddSlider("AA_LBYOffset",{Text="lby offset",Default=60,Min= -180,Max=180,Rounding=0,Callback=function(v1944) v267.lbyOffset=v1944;end});v991:AddDropdown("AA_LBYMode",{Text="lby mode",Default="Jitter",Values={"Static","Jitter","Flip","Random"},Callback=function(v1946) v267.lbyMode=v1946;end});v991:AddSlider("AA_SpinSpeed",{Text="spin speed",Default=45,Min=10,Max=360,Rounding=0,Callback=function(v1948) v267.spinSpeed=v1948;end});v991:AddToggle("AA_TeamChk",{Text="team",Default=false,Callback=function(v1950) v267.teamCheck=v1950;end});v991:AddLabel("manual yaw: hold Z = left, X = right");v991:AddDivider();v991:AddToggle("AA_VeloDesync",{Text="desync",Default=false,Callback=function(v1952) v267.velocityDesync=v1952;end});v991:AddSlider("AA_VeloY",{Text="desync y",Default=1000,Min= -5000,Max=5000,Rounding=0,Callback=function(v1954) v267.veloY=v1954;end});v992:AddToggle("TrigOn",{Text="enable",Default=false,Callback=function(v1956) v261.enabled=v1956;end});v992:AddToggle("TrigTeam",{Text="team",Default=false,Callback=function(v1958) v261.teamCheck=v1958;end});v992:AddToggle("TrigHold",{Text="hold",Default=false,Callback=function(v1960) v261.holdMode=v1960;end});v992:AddSlider("TrigDelay",{Text="delay",Default=0,Min=0,Max=100,Rounding=0,Callback=function(v1962) v261.delay=v1962/100 ;end});v992:AddSlider("TrigCPS",{Text="interval",Default=5,Min=1,Max=50,Rounding=0,Callback=function(v1964) v261.clickInterval=v1964/100 ;end});local v993=v400.combatL:AddTab("ragebot");v993:AddToggle("RG_On",{Text="ragebot",Default=false,Callback=function(v1966) v270.enabled=v1966;end});v993:AddToggle("RG_Team",{Text="team check",Default=true,Callback=function(v1968) v270.teamCheck=v1968;end});v993:AddToggle("RG_Wall",{Text="wall check",Default=false,Callback=function(v1970) v270.wallCheck=v1970;end});v993:AddToggle("RG_Visible",{Text="visible only",Default=true,Callback=function(v1972) v270.visibleOnly=v1972;end});v993:AddToggle("RG_Health",{Text="health check",Default=false,Callback=function(v1974) v270.healthCheck=v1974;end});v993:AddDivider();v993:AddToggle("RG_Silent",{Text="silent (camera stays still)",Default=false,Callback=function(v1976) v270.silent=v1976;end});v993:AddToggle("RG_ThirdAim",{Text="aim in third person",Default=true,Callback=function(v1978) v270.thirdAim=v1978;end});v993:AddToggle("RG_AutoFire",{Text="auto shoot",Default=true,Callback=function(v1980) v270.autoFire=v1980;end});v993:AddToggle("RG_Hold",{Text="hold rmb",Default=false,Callback=function(v1982) v270.holdRMB=v1982;end});v993:AddDivider();v993:AddSlider("RG_Fov",{Text="fov",Default=250,Min=0,Max=1000,Rounding=0,Callback=function(v1984) v270.fov=v1984;end});v993:AddDropdown("RG_Part",{Text="hitpart",Default="Head",Values={"Head","UpperTorso","HumanoidRootPart"},Callback=function(v1986) v270.hitpart=v1986;end});v993:AddSlider("RG_Smooth",{Text="smooth",Default=50,Min=0,Max=100,Rounding=0,Callback=function(v1988) v270.smooth=1 -(v1988/100) ;end});v993:AddSlider("RG_Pred",{Text="prediction",Default=65,Min=0,Max=200,Rounding=0,Callback=function(v1990) v270.prediction=v1990/1000 ;end});v993:AddSlider("RG_FireDelay",{Text="fire delay",Default=2,Min=0,Max=100,Rounding=0,Callback=function(v1992) v270.fireDelay=v1992/100 ;end});v993:AddSlider("RG_MinHp",{Text="min hp",Default=0,Min=0,Max=100,Rounding=0,Callback=function(v1994) v270.minHealth=v1994;end});v993:AddLabel("aims + shoots the moment an enemy enters view");local v994=v400.combatL:AddTab("silent");v994:AddToggle("SAOn",{Text="enable",Default=false,Callback=function(v1996) v394.enabled=v1996;end});v994:AddToggle("SATeam",{Text="team",Default=false,Callback=function(v1998) v394.teamCheck=v1998;end});v994:AddToggle("SAWall",{Text="wall check",Default=false,Callback=function(v2000) v394.wallCheck=v2000;end});v994:AddToggle("SAFovShow",{Text="show fov circle",Default=false,Callback=function(v2002) v394.showFov=v2002;end});v994:AddSlider("SAFov",{Text="fov",Default=200,Min=10,Max=800,Rounding=0,Callback=function(v2004) v394.fov=v2004;end});v994:AddToggle("SAFill",{Text="fill fov",Default=false,Callback=function(v2006) v152.FillState.sil.enabled=v2006;end});v994:AddLabel("fill edge"):AddColorPicker("SAFillEdge",{Default=Color3.fromRGB(255,128,0),Callback=function(v2008) v152.FillState.sil.edge=v2008;end});v994:AddLabel("fill center"):AddColorPicker("SAFillCenter",{Default=Color3.fromRGB(255,128,0),Callback=function(v2010) v152.FillState.sil.center=v2010;end});v994:AddSlider("SAFillT",{Text="fill transparency",Default=60,Min=0,Max=100,Rounding=0,Callback=function(v2012) v152.FillState.sil.transparency=v2012/100 ;end});v994:AddSlider("SAHit",{Text="hit chance",Default=100,Min=1,Max=100,Rounding=0,Callback=function(v2014) v394.hitChance=v2014;end});v994:AddDropdown("SAHitpart",{Text="hitpart",Default="Head",Values={"Head","UpperTorso","HumanoidRootPart"},Callback=function(v2016) v394.hitpart=v2016;end});v994:AddSlider("SAFov",{Text="fov",Default=200,Min=0,Max=800,Rounding=0,Callback=function(v2018) v394.fov=v2018;end});v994:AddDropdown("SAPart",{Text="part",Default=1,Values={"Head","UpperTorso","HumanoidRootPart"},Callback=function(v2020) v394.hitpart=v2020;end});local function v995() return {Afternoon={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://162001926",SkyboxDn="rbxassetid://161998893",SkyboxFt="rbxassetid://162001897",SkyboxBk="rbxassetid://162001887",SkyboxLf="rbxassetid://162001904",SkyboxRt="rbxassetid://162001919"},["Blue Space"]={StarCount=0,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://367149078",SkyboxDn="rbxassetid://367147970",SkyboxFt="rbxassetid://366731193",SkyboxBk="rbxassetid://366731024",SkyboxLf="rbxassetid://366731613",SkyboxRt="rbxassetid://366731514"},["Classic Roblox"]={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://11138465883",SkyboxDn="rbxassetid://11138453351",SkyboxFt="rbxassetid://11138458027",SkyboxBk="rbxassetid://11138450201",SkyboxLf="rbxassetid://11138460736",SkyboxRt="rbxassetid://11138463127",SunTextureId="rbxassetid://11138537872"},Cloudy={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://246480504",SkyboxDn="rbxassetid://246480523",SkyboxFt="rbxassetid://246480105",SkyboxBk="rbxassetid://246480323",SkyboxLf="rbxassetid://246480549",SkyboxRt="rbxassetid://246480565"},Dusk={StarCount=3000,SunAngularSize=0,MoonAngularSize=11,SkyboxUp="rbxassetid://9778106496",SkyboxDn="rbxassetid://9778110864",SkyboxFt="rbxassetid://9778101192",SkyboxBk="rbxassetid://9778108979",SkyboxLf="rbxassetid://9778103329",SkyboxRt="rbxassetid://9778104889"},Dawn={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://323478865",SkyboxDn="rbxassetid://323481190",SkyboxFt="rbxassetid://323480314",SkyboxBk="rbxassetid://323479840",SkyboxLf="rbxassetid://323480786",SkyboxRt="rbxassetid://323480131"},["Dark Skies"]={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://149397702",SkyboxDn="rbxassetid://149397686",SkyboxFt="rbxassetid://149397697",SkyboxBk="rbxassetid://149397692",SkyboxLf="rbxassetid://149397684",SkyboxRt="rbxassetid://149397688"},Earth={StarCount=3000,SunAngularSize=0,MoonAngularSize=0,SkyboxUp="rbxassetid://15753304473",SkyboxDn="rbxassetid://15753362674",SkyboxFt="rbxassetid://15753305823",SkyboxBk="rbxassetid://15753305495",SkyboxLf="rbxassetid://15753310707",SkyboxRt="rbxassetid://15753304774"},Ethereal={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://16823395515",SkyboxDn="rbxassetid://16823388586",SkyboxFt="rbxassetid://16823390254",SkyboxBk="rbxassetid://16823386986",SkyboxLf="rbxassetid://16823392344",SkyboxRt="rbxassetid://16823394120"},Galaxy={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://2049518578",SkyboxDn="rbxassetid://2049519279",SkyboxFt="rbxassetid://2049519882",SkyboxBk="rbxassetid://2049520382",SkyboxLf="rbxassetid://2049522478",SkyboxRt="rbxassetid://2049521207"},Heaven={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://7951703855",SkyboxDn="rbxassetid://7951706908",SkyboxFt="rbxassetid://7951694757",SkyboxBk="rbxassetid://7951826533",SkyboxLf="rbxassetid://7951697216",SkyboxRt="rbxassetid://7951700251"},["Horizontal Milky Way"]={StarCount=0,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://714276621",SkyboxDn="rbxassetid://714276541",SkyboxFt="rbxassetid://714276657",SkyboxBk="rbxassetid://714276643",SkyboxLf="rbxassetid://714276648",SkyboxRt="rbxassetid://714276638"},Jungle={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://525546479",SkyboxDn="rbxassetid://525544628",SkyboxFt="rbxassetid://525548536",SkyboxBk="rbxassetid://525546178",SkyboxLf="rbxassetid://525550171",SkyboxRt="rbxassetid://525545319"},Mountains={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://48015387",SkyboxDn="rbxassetid://48015300",SkyboxFt="rbxassetid://368388290",SkyboxBk="rbxassetid://368385273",SkyboxLf="rbxassetid://368390615",SkyboxRt="rbxassetid://368385190"},Nebula={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://171448889",SkyboxDn="rbxassetid://171448902",SkyboxFt="rbxassetid://171448848",SkyboxBk="rbxassetid://171448875",SkyboxLf="rbxassetid://171448933",SkyboxRt="rbxassetid://171448925"},Night={StarCount=0,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://12064131",SkyboxDn="rbxassetid://12064152",SkyboxFt="rbxassetid://12064121",SkyboxBk="rbxassetid://12064107",SkyboxLf="rbxassetid://12063984",SkyboxRt="rbxassetid://12064115"},["Night Light"]={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://171447068",SkyboxDn="rbxassetid://171447094",SkyboxFt="rbxassetid://171447041",SkyboxBk="rbxassetid://171447054",SkyboxLf="rbxassetid://171447128",SkyboxRt="rbxassetid://171447111"},["Ocean Sky"]={StarCount=3000,SunAngularSize=1,MoonAngularSize=0,SkyboxUp="rbxassetid://11854708161",SkyboxDn="rbxassetid://11854687121",SkyboxFt="rbxassetid://11854693863",SkyboxBk="rbxassetid://11854686548",SkyboxLf="rbxassetid://11854696162",SkyboxRt="rbxassetid://11854698541",SunTextureId="rbxassetid://4774583925",MoonTextureId="rbxassetid://4774580371"},["Pink Clouds"]={StarCount=1334,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://271077958",SkyboxDn="rbxassetid://271077243",SkyboxFt="rbxassetid://271042556",SkyboxBk="rbxassetid://271042516",SkyboxLf="rbxassetid://271042310",SkyboxRt="rbxassetid://271042467"},["Red Dusk"]={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://136208328681929",SkyboxDn="rbxassetid://123407860042117",SkyboxFt="rbxassetid://132624761762466",SkyboxBk="rbxassetid://85146619291315",SkyboxLf="rbxassetid://102069641249982",SkyboxRt="rbxassetid://136526747107728"},Redshift={StarCount=0,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://401664936",SkyboxDn="rbxassetid://401664862",SkyboxFt="rbxassetid://401664960",SkyboxBk="rbxassetid://401664839",SkyboxLf="rbxassetid://401664881",SkyboxRt="rbxassetid://401664901"},Saturn={StarCount=3000,SunAngularSize=10,MoonAngularSize=0,SkyboxUp="rbxassetid://1898736761",SkyboxDn="rbxassetid://1898727189",SkyboxFt="rbxassetid://1898722814",SkyboxBk="rbxassetid://1898724755",SkyboxLf="rbxassetid://1898729298",SkyboxRt="rbxassetid://1898741025",MoonTextureId="rbxassetid://0"},SFOTH={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://1014449",SkyboxDn="rbxassetid://1012891",SkyboxFt="rbxassetid://1012887",SkyboxBk="rbxassetid://1012890",SkyboxLf="rbxassetid://1012889",SkyboxRt="rbxassetid://1012888"},Smoke={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://171410742",SkyboxDn="rbxassetid://171410748",SkyboxFt="rbxassetid://171410730",SkyboxBk="rbxassetid://171410736",SkyboxLf="rbxassetid://171410766",SkyboxRt="rbxassetid://171410755"},["Solid Black"]={StarCount=0,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://2013298",SkyboxDn="rbxassetid://2013298",SkyboxFt="rbxassetid://2013298",SkyboxBk="rbxassetid://2013298",SkyboxLf="rbxassetid://2013298",SkyboxRt="rbxassetid://2013298"},Space={StarCount=0,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://155441905",SkyboxDn="rbxassetid://155441905",SkyboxFt="rbxassetid://155441905",SkyboxBk="rbxassetid://155441905",SkyboxLf="rbxassetid://155441905",SkyboxRt="rbxassetid://155441905"},Storm={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://171410789",SkyboxDn="rbxassetid://171410792",SkyboxFt="rbxassetid://171410775",SkyboxBk="rbxassetid://171410784",SkyboxLf="rbxassetid://171410807",SkyboxRt="rbxassetid://171410798"},Sunset={StarCount=5000,SunAngularSize=18,MoonAngularSize=11,SkyboxUp="rbxassetid://264907379",SkyboxDn="rbxassetid://264907909",SkyboxFt="rbxassetid://264909420",SkyboxBk="rbxassetid://264908339",SkyboxLf="rbxassetid://264909758",SkyboxRt="rbxassetid://264908886"},Underworld={StarCount=3000,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://171561009",SkyboxDn="rbxassetid://171561019",SkyboxFt="rbxassetid://171560968",SkyboxBk="rbxassetid://171560994",SkyboxLf="rbxassetid://171561065",SkyboxRt="rbxassetid://171561026"},["Vertical Milky Way"]={StarCount=3000,SunAngularSize=1.440000057220459,MoonAngularSize=0.5699999928474426,SkyboxUp="rbxassetid://5559302033",SkyboxDn="rbxassetid://5559290893",SkyboxFt="rbxassetid://5559300879",SkyboxBk="rbxassetid://5559289158",SkyboxLf="rbxassetid://5559292825",SkyboxRt="rbxassetid://5559302989"},White={StarCount=0,SunAngularSize=21,MoonAngularSize=11,SkyboxUp="rbxassetid://321136141",SkyboxDn="rbxassetid://321136141",SkyboxFt="rbxassetid://321136141",SkyboxBk="rbxassetid://321136141",SkyboxLf="rbxassetid://321136141",SkyboxRt="rbxassetid://321136141"}};end local v996=v995();local v997={};for v2022 in pairs(v996) do table.insert(v997,v2022);end table.sort(v997);table.insert(v997,1,"Default");print("[teddyhub] OK    tab visuals built");v400.visL=v986.Visuals:AddLeftTabbox();v400.visR=v986.Visuals:AddRightTabbox();local v1000=v400.visL:AddTab("esp");local v1001=v400.visR:AddTab("world");v1000:AddToggle("ESPOn",{Text="esp",Default=false,Callback=function(v2023) v275.master=v2023;end});v1000:AddToggle("ESPBox",{Text="box",Default=true,Callback=function(v2025) v275.box=v2025;end});v1000:AddToggle("ESPFill",{Text="fill",Default=false,Callback=function(v2027) v275.fill=v2027;end});v1000:AddToggle("ESPName",{Text="name",Default=true,Callback=function(v2029) v275.name=v2029;end});v1000:AddToggle("ESPDist",{Text="distance",Default=true,Callback=function(v2031) v275.distance=v2031;end});v1000:AddToggle("ESPWep",{Text="weapon",Default=false,Callback=function(v2033) v275.weapon=v2033;end});v1000:AddToggle("ESPHp",{Text="health",Default=true,Callback=function(v2035) v275.healthbar=v2035;end});v1000:AddToggle("ESPSkel",{Text="skeleton",Default=false,Callback=function(v2037) v275.skeleton=v2037;end});v1000:AddToggle("ESPSkelO",{Text="skel outline",Default=false,Callback=function(v2039) v275.skeletonOutline=v2039;end});v1001:AddDropdown("ESPType",{Text="type",Default=1,Values={"static","dynamic"},Callback=function(v2041) v276.boundsType=v2041;end});v1001:AddSlider("ESPScale",{Text="scale",Default=100,Min=50,Max=200,Rounding=0,Callback=function(v2043) v276.boundsScale=v2043;end});v1001:AddLabel("color"):AddColorPicker("ESPCol",{Default=v276.color,Callback=function(v2045) v276.color=v2045;end});v1001:AddDivider();v1001:AddToggle("Visuals_Enabled",{Text="highlight",Default=false});v1001:AddToggle("Visuals_Gradient",{Text="rainbow",Default=false});v1001:AddSlider("Visuals_GradientSpeed",{Text="speed",Default=5,Min=1,Max=20,Rounding=0});v1001:AddToggle("Visuals_Fill",{Text="fill",Default=true});v1001:AddSlider("Visuals_FillTransparency",{Text="transparency",Default=0.5,Min=0,Max=1,Rounding=2});v1001:AddLabel("fill"):AddColorPicker("Visuals_FillColor",{Default=Color3.fromRGB(255,0,0)});v1001:AddToggle("Visuals_Outline",{Text="outline",Default=true});v1001:AddSlider("Visuals_OutlineTransparency",{Text="transparency",Default=0,Min=0,Max=1,Rounding=2});v1001:AddLabel("outline"):AddColorPicker("Visuals_OutlineColor",{Default=Color3.fromRGB(255,255,255)});v1001:AddDivider();v1001:AddToggle("Ambient_Enabled",{Text="ambient",Default=false});v1001:AddLabel("ambient"):AddColorPicker("Ambient_Color",{Default=Color3.fromRGB(128,128,128)});v1001:AddLabel("outdoor"):AddColorPicker("OutdoorAmbient_Color",{Default=Color3.fromRGB(128,128,128)});v1000:AddDivider();v1000:AddToggle("Skybox_Enabled",{Text="skybox",Default=false});v1000:AddDropdown("Skybox_Preset",{Values=v997,Default=1,Text="preset"});v1000:AddInput("Skybox_CustomID",{Default="",Numeric=true,Finished=true,Text="skybox id",Placeholder="Dont Use"});v1001:AddToggle("Weather_Enabled",{Text="weather",Default=false,Callback=function(v2047) v315=v2047;end});v1001:AddDropdown("Weather_Type",{Values={"Rain","Snow","Storm"},Default=1,Multi=false,Text="type",Callback=function(v2048) v316=v2048;end});v1001:AddSlider("Weather_Intensity",{Text="intensity",Default=31,Min=5,Max=100,Rounding=0,Callback=function(v2049) v317=v2049;end});v1001:AddLabel("color"):AddColorPicker("Weather_Color",{Default=Color3.fromRGB(200,220,255),Callback=function(v2050) v318=v2050;end});v1001:AddDivider();v1001:AddToggle("SelfChams_Enabled",{Text="self chams",Default=false,Callback=function(v2051) v327=v2051;v343();end});v1001:AddDropdown("SelfChams_Style",{Values={"Highlight","ForceField","Solid Color","Neon","Glass","Ice","Metal","Foil","Marble","Granite","Wood","Brick","Cobblestone","Sand","Fabric","Concrete","Slate"},Default=1,Multi=false,Text="style",Callback=function(v2052) v328=v2052;v343();end});v1001:AddToggle("SelfChams_Gradient",{Text="rainbow",Default=false,Callback=function(v2053) v329=v2053;v343();end});v1001:AddSlider("SelfChams_GradSpeed",{Text="rate",Default=5,Min=1,Max=20,Rounding=0,Callback=function(v2054) v330=v2054;end});v1001:AddSlider("SelfChams_FillTrans",{Text="alpha",Default=0,Min=0,Max=100,Rounding=0,Callback=function(v2055) v333=v2055/100 ;v343();end});v1001:AddLabel("fill"):AddColorPicker("SelfChams_Color",{Default=Color3.fromRGB(255,255,255),Callback=function(v2056) v331=v2056;v343();end});v1001:AddLabel("outline"):AddColorPicker("SelfChams_OutlineColor",{Default=Color3.fromRGB(255,255,255),Callback=function(v2057) v332=v2057;v343();end});v1001:AddDivider();v1001:AddToggle("FOV_Enabled",{Text="fov",Default=false,Callback=function(v2058) v335=v2058;if  not v2058 then workspace.CurrentCamera.FieldOfView=v337;end end});v1001:AddSlider("FOV_Value",{Text="field",Default=90,Min=30,Max=120,Rounding=0,Callback=function(v2059) v336=v2059;end});local v1002=v400.visL:AddTab("bloom");v1002:AddToggle("CC_Enabled",{Text="color",Default=false,Callback=function(v2060) v354=v2060;v356(Options.CC_Brightness.Value/100 ,Options.CC_Contrast.Value/100 ,Options.CC_Saturation.Value/100 ,Options.CC_TintColor.Value);end});v1002:AddSlider("CC_Brightness",{Text="brightness",Default=0,Min= -100,Max=100,Rounding=0,Callback=function(v2061) v356(v2061/100 ,Options.CC_Contrast.Value/100 ,Options.CC_Saturation.Value/100 ,Options.CC_TintColor.Value);end});v1002:AddSlider("CC_Contrast",{Text="contrast",Default=0,Min= -100,Max=100,Rounding=0,Callback=function(v2062) v356(Options.CC_Brightness.Value/100 ,v2062/100 ,Options.CC_Saturation.Value/100 ,Options.CC_TintColor.Value);end});v1002:AddSlider("CC_Saturation",{Text="saturation",Default=0,Min= -100,Max=100,Rounding=0,Callback=function(v2063) v356(Options.CC_Brightness.Value/100 ,Options.CC_Contrast.Value/100 ,v2063/100 ,Options.CC_TintColor.Value);end});v1002:AddLabel("tint"):AddColorPicker("CC_TintColor",{Default=Color3.fromRGB(255,255,255),Callback=function(v2064) v356(Options.CC_Brightness.Value/100 ,Options.CC_Contrast.Value/100 ,Options.CC_Saturation.Value/100 ,v2064);end});v1002:AddDivider();v1002:AddToggle("Bloom_Enabled",{Text="bloom",Default=false,Callback=function(v2065) v355=v2065;v357(Options.Bloom_Intensity.Value/5 ,Options.Bloom_Size.Value,Options.Bloom_Threshold.Value/100 );end});v1002:AddSlider("Bloom_Intensity",{Text="intensity",Default=15,Min=0,Max=50,Rounding=0,Callback=function(v2066) v357(v2066/5 ,Options.Bloom_Size.Value,Options.Bloom_Threshold.Value/100 );end});v1002:AddSlider("Bloom_Size",{Text="size",Default=24,Min=1,Max=56,Rounding=0,Callback=function(v2067) v357(Options.Bloom_Intensity.Value/5 ,v2067,Options.Bloom_Threshold.Value/100 );end});v1002:AddSlider("Bloom_Threshold",{Text="threshold",Default=0,Min=0,Max=100,Rounding=0,Callback=function(v2068) v357(Options.Bloom_Intensity.Value/5 ,Options.Bloom_Size.Value,v2068/100 );end});local v1003=v400.visR:AddTab("time");v1003:AddSlider("TimeSlider",{Text="time",Default=14,Min=0,Max=24,Rounding=1,Callback=function(v2069) v373(v2069);end});v1003:AddToggle("FreezeTimeToggle",{Text="lock time",Default=false,Callback=function(v2070) v372.FreezeTime=v2070;end});v1003:AddButton({Text="day",Func=function() Options.TimeSlider:SetValue(12);end});v1003:AddButton({Text="night",Func=function() Options.TimeSlider:SetValue(0);end});v1003:AddButton({Text="sunset",Func=function() Options.TimeSlider:SetValue(18);end});v400.visL2=v986.Visuals:AddLeftTabbox();local v1005=v400.visL2:AddTab("presets");v1005:AddDropdown("SV_PresetSelect",{Values={"Default","Cinematic","Hazy","Vibrant","Noir","Night"},Default=1,Text="preset"});v1005:AddButton({Text="apply preset",Func=function() v393(Options.SV_PresetSelect.Value);end});local v1006=v400.visL2:AddTab("atmos");v389(v1006,"SV_AtmoOn","AtmoEnabled",{Text="atmosphere",Default=false});local v1007=v1006:AddDependencyBox();v390(v1007,"SV_Density","Density",{Text="density",Default=0.32,Min=0,Max=1,Rounding=2});v390(v1007,"SV_Offset","Offset",{Text="offset",Default=0.5,Min=0,Max=1,Rounding=2});v390(v1007,"SV_Haze","Haze",{Text="haze",Default=1.8,Min=0,Max=10,Rounding=1});v390(v1007,"SV_Glare","Glare",{Text="glare",Default=0.35,Min=0,Max=2,Rounding=2});v391(v1007,"Atmo","SV_AtmoColor","AtmoColor",Color3.fromRGB(199,199,199));v391(v1007,"Decay","SV_AtmoDecay","AtmoDecay",Color3.fromRGB(106,112,125));v1007:SetupDependencies({{Toggles.SV_AtmoOn,true}});local v1008=v400.visR:AddTab("fog");v389(v1008,"SV_FogOn","FogEnabled",{Text="fog",Default=false});local v1009=v1008:AddDependencyBox();v390(v1009,"SV_FogStart","FogStart",{Text="start",Default=150,Min=0,Max=2000,Rounding=0});v390(v1009,"SV_FogEnd","FogEnd",{Text="end",Default=1400,Min=100,Max=10000,Rounding=0});v391(v1009,"Color","SV_FogColor","FogColor",Color3.fromRGB(190,200,215));v1009:SetupDependencies({{Toggles.SV_FogOn,true}});v400.visR2=v986.Visuals:AddRightTabbox();local v1011=v400.visR2:AddTab("vignette");v389(v1011,"SV_VigOn","VignetteEnabled",{Text="vignette",Default=true});local v1012=v1011:AddDependencyBox();v390(v1012,"SV_VigStr","VignetteStrength",{Text="strength",Default=0.5,Min=0,Max=1,Rounding=2});v1012:SetupDependencies({{Toggles.SV_VigOn,true}});v155.RenderStepped:Connect(function() if v152.Unloaded then return;end v386();end);Options.SV_PresetSelect:OnChanged(function(v2072) v393(v2072);end);v386();print("[teddyhub] OK    tab movement built");v400.movL=v986.Movement:AddLeftTabbox();v400.movR=v986.Movement:AddRightTabbox();local v1015=v400.movL:AddTab("player");v1015:AddToggle("SpeedOn",{Text="speed",Default=false,Callback=function(v2073) v305=v2073;v312();end});v1015:AddSlider("WalkSpd",{Text="walk",Default=16,Min=16,Max=500,Rounding=0,Callback=function(v2074) v306=v2074;if v305 then v312();end end});v1015:AddToggle("FlyOn",{Text="fly",Default=false,Callback=function(v2075) v314(v2075);end});v1015:AddSlider("FlySpd",{Text="speed",Default=50,Min=10,Max=300,Rounding=0,Callback=function(v2076) v310=v2076;end});v1015:AddToggle("JumpOn",{Text="jump",Default=false,Callback=function(v2077) v307=v2077;v313();end});v1015:AddSlider("JumpPwr",{Text="power",Default=50,Min=50,Max=500,Rounding=0,Callback=function(v2078) v308=v2078;if v307 then v313();end end});v1015:AddToggle("SpinBotOn",{Text="spin",Default=false,Callback=function(v2079) v264=v2079;end});v1015:AddSlider("SpinSpeed",{Text="speed",Default=10,Min=1,Max=100,Rounding=0,Callback=function(v2080) v265=v2080;end});v1015:AddDropdown("SpinMode",{Text="mode",Default=1,Values={"Linear","Jitter"},Callback=function(v2081) v266=v2081;end});print("[teddyhub] OK    tab crosshair built");v400.chL=v986.Crosshair:AddLeftTabbox();v400.chR=v986.Crosshair:AddRightTabbox();local v1018=v400.chL:AddTab("main");local v1019=v400.chR:AddTab("circle");v1018:AddToggle("CHVis",{Text="crosshair",Default=false,Callback=function(v2082) v293.Visible=v2082;end});v1018:AddSlider("CHSpin",{Text="speed",Default=5,Min=0,Max=1000,Rounding=0,Callback=function(v2084) v293.SpinSpeed=v2084/250 ;end});v1018:AddSlider("CHGap",{Text="gap",Default=8,Min=0,Max=50,Rounding=0,Callback=function(v2086) v293.CentralGap=v2086;end});v1018:AddSlider("CHLen",{Text="length",Default=112,Min=10,Max=300,Rounding=0,Callback=function(v2088) v293.TotalLength=v2088;v299();end});v1018:AddSlider("CHThick",{Text="thickness",Default=2,Min=1,Max=10,Rounding=0,Callback=function(v2090) v293.LineThickness=v2090;end});v1018:AddSlider("CHOut",{Text="outline size",Default=4,Min=0,Max=15,Rounding=0,Callback=function(v2092) v293.OutlineThickness=v2092;end});v1018:AddToggle("CHTrack",{Text="tracking",Default=false,Callback=function(v2094) v293.TrackingEnabled=v2094;end});v1018:AddSlider("CHTRad",{Text="radius",Default=150,Min=10,Max=800,Rounding=0,Callback=function(v2096) v293.TrackingRadius=v2096;end});v1018:AddSlider("CHTSmooth",{Text="smoothness",Default=20,Min=1,Max=100,Rounding=0,Callback=function(v2098) v293.TrackingSmoothness=v2098/100 ;end});v1018:AddDropdown("CHTgt",{Text="part",Default=1,Values={"Head","HumanoidRootPart"},Callback=function(v2100) v293.TrackPart=v2100;end});v1018:AddToggle("CHTChk",{Text="team",Default=true,Callback=function(v2102) v293.TeamCheck=v2102;end});v1019:AddToggle("CHCirVis",{Text="visible",Default=true,Callback=function(v2104) v293.CircleVisible=v2104;end});v1019:AddSlider("CHCirR",{Text="radius",Default=119,Min=10,Max=300,Rounding=0,Callback=function(v2106) v293.CircleRadius=v2106;end});v1019:AddSlider("CHCirT",{Text="transparency",Default=30,Min=0,Max=100,Rounding=0,Callback=function(v2108) v293.CircleTransparency=v2108/100 ;end});v1019:AddLabel("start"):AddColorPicker("CHColS",{Default=Color3.fromRGB(180,180,180),Callback=function(v2110) v293.ColorStart=v2110;end});v1019:AddLabel("end"):AddColorPicker("CHColE",{Default=Color3.fromRGB(20,20,20),Callback=function(v2112) v293.ColorEnd=v2112;end});v1019:AddLabel("color"):AddColorPicker("CHCirC",{Default=Color3.fromRGB(15,15,25),Callback=function(v2114) v293.CircleColor=v2114;end});local v1020=v400.chL:AddTab("icon");v1020:AddToggle("EnableShiftIcon",{Text="custom icon",Default=false,Callback=function(v2116) v358.Enabled=v2116;end});v1020:AddDropdown("PresetShiftDropdown",{Values=v360,Default=1,Multi=false,Text="preset",Callback=function(v2118) local v2119=v359[v2118];if v2119 then v358.CurrentID=v2119;end end});v1020:AddInput("CustomShiftID_Input",{Default="",Numeric=true,Finished=true,Text="asset id",Placeholder="Custom ID eingeben...",Callback=function(v2120) if (v2120 and (v2120~="")) then v358.CurrentID=v2120;end end});v1020:AddSlider("ShiftIconSizeSlider",{Text="size",Default=32,Min=10,Max=100,Rounding=0,Callback=function(v2121) v358.IconSize=v2121;end});print("[teddyhub] OK    tab misc built");v400.miscL=v986.Misc:AddLeftTabbox();v400.miscR=v986.Misc:AddRightTabbox();local v1023=v400.miscL:AddTab("watermark");v1023:AddToggle("WM_Enabled",{Text="watermark",Default=true,Callback=function(v2123) v168.Enabled=v2123;v152:SetWatermarkVisibility(v2123);end});v1023:AddInput("WM_Text",{Default="teddyhub v.3",Numeric=false,Finished=true,Text="title",Placeholder="Text eingeben...",Callback=function(v2125) v168.Text=v2125;end});v1023:AddToggle("WM_ShowFPS",{Text="fps",Default=true,Callback=function(v2127) v168.ShowFPS=v2127;end});v1023:AddToggle("WM_ShowPing",{Text="ping",Default=true,Callback=function(v2129) v168.ShowPing=v2129;end});v1023:AddToggle("WM_ShowTime",{Text="time",Default=true,Callback=function(v2131) v168.ShowTime=v2131;end});local v1024=v400.miscR:AddTab("local");v1024:AddToggle("Enable_ShiftLock",{Text="shift lock",Default=false,Tooltip="Allows mouse-lock camera control",Callback=function(v2133) pcall(function() v161.DevEnableMouseLock=v2133;end);end});print("[teddyhub] OK    tab settings built");local v1025=v986.Settings:AddLeftGroupbox("menu");v400.setR=v986.Settings:AddRightTabbox();return v986,v1025,v996;end local v402,v403,v404=v401();v403:AddButton({Text="unload",Func=function() v152:Unload();end});local function v405() local v1027={saved=setmetatable({},{__mode="k"}),touched=setmetatable({},{__mode="k"})};local function v1028(v2134) local v2135={};local v2136=Options.HB_Mode.Value;if (v2136=="All parts") then for v3387,v3388 in ipairs(v2134:GetChildren()) do if v3388:IsA("BasePart") then v2135[ #v2135 + 1 ]=v3388;end end elseif (v2136=="Head only") then local v3525=v2134:FindFirstChild("Head");if v3525 then v2135[1]=v3525;end elseif (v2136=="Torso") then for v3675,v3676 in ipairs({"UpperTorso","LowerTorso","Torso","HumanoidRootPart"}) do local v3677=v2134:FindFirstChild(v3676);if v3677 then v2135[ #v2135 + 1 ]=v3677;end end elseif (v2136=="Body") then for v3725,v3726 in ipairs(v2134:GetChildren()) do if (v3726:IsA("BasePart") and (v3726.Name~="Head") and (v3726.Name~="HumanoidRootPart")) then v2135[ #v2135 + 1 ]=v3726;end end end return v2135;end local function v1029(v2137) if ( not v2137 or  not v2137.Parent) then return 0;end local v2138=v1027.saved[v2137];if  not v2138 then v2138={};v1027.saved[v2137]=v2138;end local v2139=Options.HB_Scale.Value;local v2140=Options.HB_ScaleX.Value * v2139 ;local v2141=Options.HB_ScaleY.Value * v2139 ;local v2142=Options.HB_ScaleZ.Value * v2139 ;local v2143=v165("HB_Massless",true);local v2144=v165("HB_NoCollide",true);local v2145=v165("HB_Showbox");local v2146=0;for v2865,v2866 in ipairs(v1028(v2137)) do if v2866.Parent then local v3389=v2138[v2866];if  not v3389 then v3389={size=v2866.Size,massless=v2866.Massless,collide=v2866.CanCollide,trans=v2866.Transparency};v2138[v2866]=v3389;end v2866.Size=Vector3.new(v3389.size.X * v2140 ,v3389.size.Y * v2141 ,v3389.size.Z * v2142 );v2866.Massless=v2143 or v3389.massless ;if (v2866.Name~="HumanoidRootPart") then v2866.CanCollide=( not v2144 and v3389.collide) or false ;end v2866.Transparency=(v2145 and 0.35) or v3389.trans ;v2146=v2146 + 1 ;end end v1027.touched[v2137]=true;return v2146;end local function v1030(v2148) local v2149=v1027.saved[v2148];if v2149 then for v3393,v3394 in pairs(v2149) do if (v3393 and v3393.Parent) then v3393.Size=v3394.size;v3393.Massless=v3394.massless;v3393.CanCollide=v3394.collide;v3393.Transparency=v3394.trans;end end end v1027.saved[v2148]=nil;v1027.touched[v2148]=nil;end local function v1031() for v2867 in pairs(v1027.touched) do pcall(v1030,v2867);end v1027.touched=setmetatable({},{__mode="k"});end local function v1032(v2153) if ((v2153==v161) and  not v165("HB_Self")) then return false;end local v2154=v2153.Character;local v2155=v2154 and v2154:FindFirstChildOfClass("Humanoid") ;if ( not v2154 or  not v2155) then return false;end if ((v2155.Health<=0) and  not v165("HB_Dead")) then return false;end if (v165("HB_Team",true) and (v2153.Team~=nil) and (v2153.Team==v161.Team)) then return false;end return true;end local function v1033(v2156) if (v2156==v161.Character) then return v165("HB_Self");end local v2157=v2156:FindFirstChildOfClass("Humanoid");if ( not v2157 or  not v2157.RootPart) then return false;end if ((v2157.Health<=0) and  not v165("HB_Dead")) then return false;end return true;end local v1034=v400.combatL:AddTab("hitbox");v1034:AddToggle("HB_On",{Text="hitbox expander",Default=false});v1034:AddDropdown("HB_Mode",{Text="parts",Default="All parts",Values={"All parts","Head only","Torso","Body"}});v1034:AddDivider();v1034:AddSlider("HB_Scale",{Text="uniform scale",Default=3,Min=1,Max=10,Rounding=1});v1034:AddSlider("HB_ScaleX",{Text="scale x",Default=1,Min=0.5,Max=5,Rounding=1});v1034:AddSlider("HB_ScaleY",{Text="scale y",Default=1,Min=0.5,Max=5,Rounding=1});v1034:AddSlider("HB_ScaleZ",{Text="scale z",Default=1,Min=0.5,Max=5,Rounding=1});v1034:AddDivider();v1034:AddToggle("HB_Team",{Text="team check",Default=true});v1034:AddToggle("HB_Dead",{Text="include dead",Default=false});v1034:AddToggle("HB_Self",{Text="affect self",Default=false});v1034:AddToggle("HB_Massless",{Text="massless",Default=true});v1034:AddToggle("HB_NoCollide",{Text="no collide",Default=true});v1034:AddToggle("HB_Showbox",{Text="show hitbox",Default=false});v1034:AddSlider("HB_Rate",{Text="update hz",Default=30,Min=1,Max=60,Rounding=0});local v1035,v1036={},0;local function v1037() if ((tick() -v1036)<1) then return v1035;end v1036=tick();v1035={};local v2158=workspace:GetChildren();for v2868,v2869 in ipairs(v2158) do if v2869:IsA("Model") then local v3395=v2869:FindFirstChildOfClass("Humanoid");if (v3395 and v3395.RootPart) then v1035[ #v1035 + 1 ]=v2869;end elseif v2869:IsA("Folder") then for v3647,v3648 in ipairs(v2869:GetChildren()) do if v3648:IsA("Model") then local v3708=v3648:FindFirstChildOfClass("Humanoid");if (v3708 and v3708.RootPart) then v1035[ #v1035 + 1 ]=v3648;end end end end end return v1035;end local function v1038() local v2159,v2160={},{};for v2870,v2871 in ipairs(v7:GetPlayers()) do local v2872=v2871.Character;if v2872 then v2159[v2872]=true;v2160[ #v2160 + 1 ]=v2872;end end for v2873,v2874 in ipairs(v1037()) do if ( not v2159[v2874] and v2874.Parent) then v2159[v2874]=true;v2160[ #v2160 + 1 ]=v2874;end end return v2160;end local function v1039() local v2161=0;for v2875,v2876 in ipairs(v1038()) do local v2877=v7:GetPlayerFromCharacter(v2876);if v2877 then if v1032(v2877) then v2161=v2161 + v1029(v2876) ;elseif v1027.touched[v2876] then v1030(v2876);end elseif v1033(v2876) then v2161=v2161 + v1029(v2876) ;elseif v1027.touched[v2876] then v1030(v2876);end end return v2161;end v143.Hitbox={cleanup=function() v1031();end};local v1041=0;v155.Heartbeat:Connect(function(v2162) if v152.Unloaded then return;end if  not v165("HB_On") then if next(v1027.touched) then v1031();end return;end v1041=v1041 + v2162 ;if (v1041<(1/math.max(1,Options.HB_Rate.Value))) then return;end v1041=0;v1039();end);local function v1042() if v165("HB_On") then v1039();end end if Toggles.HB_On then Toggles.HB_On.Callback=function(v3115) if v3115 then local v3526=v1039();print(("[teddyhub] hitbox on - %d parts scaled"):format(v3526));pcall(function() v152:Notify(("hitbox: %d parts scaled"):format(v3526),5);end);else v1031();end end;end for v2163,v2164 in ipairs({"HB_Mode","HB_Scale","HB_ScaleX","HB_ScaleY","HB_ScaleZ"}) do Options[v2164]:OnChanged(v1042);end end v15("hitbox",v405);v152.ToggleKeybind=nil;local function v407() local v1043=game:GetService("UserInputService");local v1044;local v1045=0;local v1046="teddyhub v.3";local function v1047() if (v1044 and v1044.Parent) then return v1044;end if ((tick() -v1045)<1) then return nil;end v1045=tick();local v2165,v2166=pcall(function() for v3116,v3117 in ipairs({game:GetService("CoreGui"),v163}) do for v3400,v3401 in ipairs(v3117:GetDescendants()) do if (v3401:IsA("TextLabel") and string.find(string.lower(v3401.Text),v1046,1,true)) then local v3619=v3401;while v3619.Parent and  not v3619.Parent:IsA("ScreenGui")  do v3619=v3619.Parent;end if (v3619:IsA("GuiObject") and v3619.Parent and v3619.Parent:IsA("ScreenGui")) then return v3619;end end end end return nil;end);if (v2165 and v2166) then v1044=v2166;return v2166;end return nil;end local v1048=true;local v1049=false;local function v1050() local v2167,v2168=pcall(function() local v2879=v1047();if  not v2879 then warn("[Menu] could not find the menu window (title '"   .. v1046   .. "')" );return;end v2879.Visible= not v2879.Visible;v1048=v2879.Visible;if  not v1049 then v1049=true;print("[Menu] window '"   .. v2879.Name   .. "' is now "   .. ((v1048 and "shown") or "hidden") );end end);if  not v2167 then warn("[Menu] toggle error: "   .. tostring(v2168) );end end local v1043=game:GetService("UserInputService");local v1051=v1043.InputBegan:Connect(function(v2169,v2170) if v152.Unloaded then return;end local v2171=Options.MenuKeybind;local v2172=v2171 and v2171.Value ;local v2173=(v2169.KeyCode==Enum.KeyCode.RightShift) or ((type(v2172)=="string") and (v2169.KeyCode.Name==v2172)) ;if (v2169.UserInputType==Enum.UserInputType.Keyboard) then print("[Menu] any key: "   .. v2169.KeyCode.Name );end if (v2173 or v2169.KeyCode.Name:find("Shift")) then print("[Menu] key "   .. v2169.KeyCode.Name   .. " pressed (gameProcessed="   .. tostring(v2170)   .. ", textbox focused="   .. tostring(v1043:GetFocusedTextBox()~=nil )   .. ")" );end if  not v2173 then return;end if (v1043:GetFocusedTextBox() and (v2169.KeyCode~=Enum.KeyCode.RightShift)) then return;end v1050();end);v152:OnUnload(function() v1051:Disconnect();end);print("[teddyhub] OK    menu key listener (RightShift + "   .. tostring(Options.MenuKeybind and Options.MenuKeybind.Value )   .. ")" );v403:AddLabel("menu"):AddKeyPicker("MenuKeybind",{Default="K",NoUI=false,Text="menu"});end v15("menu key",v407);local function v408() local v1052={};for v2174,v2175 in ipairs(Enum.Font:GetEnumItems()) do table.insert(v1052,v2175.Name);end table.sort(v1052);local v1053=v400.setR:AddTab("font");v1053:AddDropdown("UI_Font",{Text="font",Values=v1052,Default="Code",Callback=function() end});local function v1054(v2176) local v2177=Enum.Font[v2176];if  not v2177 then return false;end for v2881,v2882 in ipairs({game:GetService("CoreGui"),v163}) do for v3118,v3119 in ipairs(v2882:GetDescendants()) do if (v3119:IsA("TextLabel") and string.find(string.lower(v3119.Text),"teddyhub v.3",1,true)) then local v3527=v3119:FindFirstAncestorWhichIsA("ScreenGui");if v3527 then for v3678,v3679 in ipairs(v3527:GetDescendants()) do if (v3679:IsA("TextLabel") or v3679:IsA("TextButton") or v3679:IsA("TextBox")) then v3679.Font=v2177;end end end return true;end end end return false;end Options.UI_Font:OnChanged(function(v2178) v1054(v2178);end);local v1055=0;local v1056=v155.Heartbeat:Connect(function(v2179) if v152.Unloaded then return;end v1055=v1055 + v2179 ;if (v1055<3) then return;end v1055=0;v1054(Options.UI_Font.Value);end);v152:OnUnload(function() v1056:Disconnect();end);end v15("font",v408);local v409=v158.Ambient;local v410=v158.OutdoorAmbient;local function v411(v1057) if (v1057==v161) then return;end local function v1058(v2180) if  not v2180 then return;end local v2181="CustomHighlight"   .. v1057.UserId ;local v2182=v228:FindFirstChild(v2181) or Instance.new("Highlight") ;v2182.Name=v2181;v2182.Adornee=v2180;v2182.Enabled=Toggles.Visuals_Enabled.Value;v2182.FillColor=Options.Visuals_FillColor.Value;v2182.OutlineColor=Options.Visuals_OutlineColor.Value;v2182.FillTransparency=(Toggles.Visuals_Fill.Value and Options.Visuals_FillTransparency.Value) or 1 ;v2182.OutlineTransparency=(Toggles.Visuals_Outline.Value and Options.Visuals_OutlineTransparency.Value) or 1 ;v2182.Parent=v228;end if v1057.Character then v1058(v1057.Character);end v1057.CharacterAdded:Connect(v1058);end for v1059,v1060 in ipairs(v7:GetPlayers()) do v411(v1060);end v7.PlayerAdded:Connect(v411);v7.PlayerRemoving:Connect(function(v1061) local v1062=v228:FindFirstChild("CustomHighlight"   .. v1061.UserId );if v1062 then v1062:Destroy();end end);local v412=0;local v413;local v414=setmetatable({},{__mode="k"});v413=v155.RenderStepped:Connect(function(v1063) if v152.Unloaded then if v413 then v413:Disconnect();end return;end local v1064=Toggles.Visuals_Gradient.Value;if v1064 then v412=(v412 + (v1063 * Options.Visuals_GradientSpeed.Value * 0.2))%1 ;end local v1065=Color3.fromHSV(v412,1,1);local v1066=Toggles.Visuals_Enabled.Value;local v1067=(Toggles.Visuals_Fill.Value and Options.Visuals_FillTransparency.Value) or 1 ;local v1068=(Toggles.Visuals_Outline.Value and Options.Visuals_OutlineTransparency.Value) or 1 ;local v1069,v1070;if v1064 then v1069,v1070=v1065,v1065;else v1069,v1070=Options.Visuals_FillColor.Value,Options.Visuals_OutlineColor.Value;end for v2194,v2195 in ipairs(v7:GetPlayers()) do local v2196=v2195.Character;local v2197=v2196 and v228:FindFirstChild("CustomHighlight"   .. v2195.UserId ) ;if v2197 then local v3120=v414[v2197];if  not v3120 then v3120={};v414[v2197]=v3120;end if (v3120.en~=v1066) then v3120.en=v1066;v2197.Enabled=v1066;end if (v3120.fc~=v1069) then v3120.fc=v1069;v2197.FillColor=v1069;end if (v3120.oc~=v1070) then v3120.oc=v1070;v2197.OutlineColor=v1070;end if (v3120.ft~=v1067) then v3120.ft=v1067;v2197.FillTransparency=v1067;end if (v3120.ot~=v1068) then v3120.ot=v1068;v2197.OutlineTransparency=v1068;end end end local v1071=Toggles.Ambient_Enabled.Value;if v1071 then v158.Ambient=Options.Ambient_Color.Value;v158.OutdoorAmbient=Options.OutdoorAmbient_Color.Value;else v158.Ambient=v409;v158.OutdoorAmbient=v410;end end);local v415={};local function v416() for v2198,v2199 in ipairs(v415) do if (v2199 and v2199.Parent) then v2199.Name=v2199:GetAttribute("teddyhubOrigName") or "Sky" ;v2199.Parent=v158;end end table.clear(v415);end local function v417() local v1072=v158:FindFirstChild("teddyhubCustomSky");if  not Toggles.Skybox_Enabled.Value then if v1072 then v1072:Destroy();end v416();return;end if ( #v415==0) then for v3123,v3124 in ipairs(v158:GetChildren()) do if (v3124:IsA("Sky") and (v3124.Name~="teddyhubCustomSky")) then v3124:SetAttribute("teddyhubOrigName",v3124.Name);v3124.Name="teddyhubHiddenSky";table.insert(v415,v3124);v3124.Parent=nil;end end end if  not v1072 then v1072=Instance.new("Sky");v1072.Name="teddyhubCustomSky";v1072.Parent=v158;end local v1073=Options.Skybox_CustomID.Value;if (v1073 and (v1073~="")) then local v2893="rbxassetid://"   .. v1073 ;v1072.SkyboxUp=v2893;v1072.SkyboxDn=v2893;v1072.SkyboxFt=v2893;v1072.SkyboxBk=v2893;v1072.SkyboxLf=v2893;v1072.SkyboxRt=v2893;return;end local v1074=v404[Options.Skybox_Preset.Value];if  not v1074 then v1072:Destroy();v416();return;end v1072.SkyboxUp=v1074.SkyboxUp;v1072.SkyboxDn=v1074.SkyboxDn;v1072.SkyboxFt=v1074.SkyboxFt;v1072.SkyboxBk=v1074.SkyboxBk;v1072.SkyboxLf=v1074.SkyboxLf;v1072.SkyboxRt=v1074.SkyboxRt;v1072.StarCount=v1074.StarCount or 0 ;v1072.SunAngularSize=v1074.SunAngularSize or 21 ;v1072.MoonAngularSize=v1074.MoonAngularSize or 11 ;v1072.SunTextureId=(v1074.SunTextureId and (v1074.SunTextureId~="rbxassetid://0") and v1074.SunTextureId) or "" ;v1072.MoonTextureId=(v1074.MoonTextureId and (v1074.MoonTextureId~="rbxassetid://0") and v1074.MoonTextureId) or "" ;end Toggles.Skybox_Enabled:OnChanged(v417);Options.Skybox_Preset:OnChanged(v417);Options.Skybox_CustomID:OnChanged(v417);local v418=0;local v419=tick();local v420=60;v155.RenderStepped:Connect(function() if v152.Unloaded then return;end v418=v418 + 1 ;if ((tick() -v419)>=1) then v420=v418;v418=0;v419=tick();end if v168.Enabled then local v2900={};if (v168.Text~="") then table.insert(v2900,v168.Text);end if v168.ShowFPS then table.insert(v2900,string.format("%d fps",v420));end if v168.ShowPing then local v3402,v3403=pcall(function() return math.floor(v160.Network.ServerStatsItem["Data Ping"]:GetValue());end);if v3402 then table.insert(v2900,v3403   .. "ms" );end end if v168.ShowTime then table.insert(v2900,os.date("%X"));end v152:SetWatermark(table.concat(v2900," | "));end end);v152:SetWatermarkVisibility(v168.Enabled);v153:SetLibrary(v152);v154:SetLibrary(v152);v154:IgnoreThemeSettings();v154:SetIgnoreIndexes({"MenuKeybind"});v153:SetFolder("TeddyHub");v154:SetFolder("TeddyHub/Config");v154:BuildConfigSection(v402.Settings);v153:ApplyToTab(v402.Settings);v154:LoadAutoloadConfig();print("[teddyhub] OK    LinoriaLib + managers loaded");local v421={};local function v422() v421.FOLDER="teddyhub_V1/Songs";v421.EXTS={mp3=true,ogg=true,flac=true,wav=true};v421.songs={};v421.queue={};v421.queueIndex=0;v421.favourites={};v421.playing=false;v421.paused=false;v421.volume=0.8;v421.pitch=1;v421.bassBoost=0;v421.repeatMode="off";v421.shuffle=false;v421.showViz=true;v421.sound=nil;v421.eqEnabled=false;v421.eqBass=0;v421.eqMid=0;v421.eqTreble=0;v421.searchFilter="";v421.vizConn=nil;v421.autoConn=nil;pcall(function() if  not isfolder("teddyhub_V1") then makefolder("teddyhub_V1");end if  not isfolder(v421.FOLDER) then makefolder(v421.FOLDER);end end);local function v1114() v421.songs={};if  not listfiles then warn("[Music] executor has no listfiles()");return;end local v2201,v2202=pcall(listfiles,v421.FOLDER);if  not v2201 then warn("[Music] listfiles failed for "   .. v421.FOLDER   .. ": "   .. tostring(v2202) );return;end print("[Music] listfiles returned "   ..  #v2202   .. " entr"   .. ((( #v2202==1) and "y") or "ies") );for v2901,v2902 in ipairs(v2202) do print("[Music]   raw: "   .. tostring(v2902) );local v2903=tostring(v2902):match("([^/\\]+)$") or tostring(v2902) ;local v2904=v2903:match("%.(%w+)$");if (v2904 and v421.EXTS[v2904:lower()]) then table.insert(v421.songs,{name=v2903,path=tostring(v2902)});end end table.sort(v421.songs,function(v2905,v2906) return v2905.name<v2906.name ;end);end local function v1115() v421.queue={};local v2204=v421.searchFilter:lower();for v2907,v2908 in ipairs(v421.songs) do if ((v2204=="") or v2908.name:lower():find(v2204,1,true)) then table.insert(v421.queue,v2907);end end if v421.shuffle then for v3404= #v421.queue,2, -1 do local v3405=math.random(1,v3404);v421.queue[v3404],v421.queue[v3405]=v421.queue[v3405],v421.queue[v3404];end end end local function v1116() if (v421.sound and v421.sound.Parent) then return v421.sound;end local v2205=Instance.new("Sound");v2205.Name="teddyhubMusicPlayer";v2205.Parent=game:GetService("SoundService");v2205.Volume=v421.volume;v2205.PlaybackSpeed=v421.pitch;local v2212=Instance.new("EqualizerSoundEffect");v2212.Name="MP_EQ";v2212.Parent=v2205;v421.sound=v2205;return v2205;end local function v1117() if  not v421.sound then return;end v421.sound.Volume=v421.volume;v421.sound.PlaybackSpeed=v421.pitch;local v2220=v421.sound:FindFirstChild("MP_EQ");if v2220 then v2220.Enabled=v421.eqEnabled or (v421.bassBoost~=0) ;v2220.LowGain=(v421.eqEnabled and v421.eqBass) or 0 ;v2220.MidGain=(v421.eqEnabled and v421.eqMid) or 0 ;v2220.HighGain=(v421.eqEnabled and v421.eqTreble) or 0 ;if (v421.bassBoost~=0) then v2220.Enabled=true;v2220.LowGain=math.clamp((v2220.LowGain or 0) + v421.bassBoost , -80,10);end end end local function v1118() if v421.sound then pcall(function() v421.sound:Stop();end);end v421.playing=false;v421.paused=false;end local v1119={};local v1120;local function v1121() end local function v1122() end local v1123;local function v1124() v1114();v1115();print("[Music] found "   ..  #v421.songs   .. " song(s) in "   .. v421.FOLDER );if v1123 then local v3129={};for v3408,v3409 in ipairs(v421.queue) do table.insert(v3129,v421.songs[v3409].name);end if ( #v3129==0) then v3129={"(no songs found)"};end local v3130,v3131=pcall(function() v1123:SetValues(v3129);end);if  not v3130 then warn("[Music] could not update song list: "   .. tostring(v3131) );end end end local function v1125() if ((v421.queueIndex<1) or (v421.queueIndex> #v421.queue)) then return nil;end return v421.queue[v421.queueIndex];end local function v1126(v2223) if  not v421.songs[v2223] then return;end local v2224=v421.songs[v2223];v1118();local v2225=v1116();if  not getcustomasset then warn("[Music] getcustomasset is not supported by this executor");if v421._nowPlayingLabel then v421._nowPlayingLabel.Text="executor lacks getcustomasset";end return;end local v2226,v2227=pcall(getcustomasset,v2224.path);if ( not v2226 or  not v2227) then warn("[Music] getcustomasset failed for "   .. v2224.path   .. ": "   .. tostring(v2227) );if v421._nowPlayingLabel then v421._nowPlayingLabel.Text="load error: "   .. v2224.name ;end return;end v2225.SoundId=v2227;v1117();local v2229,v2230=pcall(function() v2225:Play();end);if  not v2229 then warn("[Music] Play failed: "   .. tostring(v2230) );end v421.playing=true;v421.paused=false;v421.currentSongName=v2224.name;if v421._nowPlayingLabel then local v3132=v2224.name:match("(.+)%..+$") or v2224.name ;v421._nowPlayingLabel.Text=((v421.favourites[v2224.name] and "* ") or "")   .. v3132 ;end end local function v1127(v2235) if ( #v421.queue==0) then return;end v2235=((v2235-1)% #v421.queue) + 1 ;v421.queueIndex=v2235;local v2237=v1125();if v2237 then v1126(v2237);end if v1123 then pcall(function() v1123:SetValue(v421.songs[v2237].name);end);end end local function v1128() if ( #v421.queue==0) then return;end if (v421.repeatMode=="one") then v1127(v421.queueIndex);return;end local v2238=v421.queueIndex + 1 ;if (v2238> #v421.queue) then if (v421.repeatMode=="all") then v2238=1;else v1118();return;end end v1127(v2238);end local function v1129() if ( #v421.queue==0) then return;end if (v421.sound and (v421.sound.TimePosition>3)) then v1126(v1125());return;end v1127(v421.queueIndex-1 );end local v1130=0;v421.autoConn=v155.Heartbeat:Connect(function(v2239) if  not (v421.sound and v421.playing and  not v421.paused) then return;end v1130=v1130 + v2239 ;if (v1130<0.1) then return;end v1130=0;pcall(function() if ((v421.sound.TimeLength>0) and (v421.sound.TimePosition>=(v421.sound.TimeLength-0.1)) and  not v421.sound.IsPlaying) then v1128();end end);v1121();v1122();end);local v1131;local v1132=v402.Misc;v400.musicL=v1132:AddLeftTabbox();v400.musicR=v1132:AddRightTabbox();local v1135=v400.musicL:AddTab("playing");local v1136=v400.musicR:AddTab("controls");local v1137=v400.musicL:AddTab("songs");local v1138=v400.musicR:AddTab("effects");local v1139=v400.musicL:AddTab("visualizer");local v1140=v400.musicR:AddTab("favourites");v1135:AddLabel("no song");v1131=v1135:AddLabel("0:00 / 0:00");local v1141=v1135:AddSlider("MP_Seek",{Text="position",Default=0,Min=0,Max=100,Rounding=0,Callback=function(v2240) if (v421.sound and (v421.sound.TimeLength>0)) then pcall(function() v421.sound.TimePosition=(v2240/100) * v421.sound.TimeLength ;end);end end});v155.Heartbeat:Connect(function() if v152.Unloaded then return;end pcall(function() if (v421.sound and (v421.sound.TimeLength>0)) then local v3411=math.clamp((v421.sound.TimePosition/v421.sound.TimeLength) * 100 ,0,100);if (math.abs((Options.MP_Seek.Value or 0) -v3411 )>1) then Options.MP_Seek:SetValue(math.floor(v3411));end end end);end);v1136:AddButton({Text="previous",Func=function() v1129();end});v1136:AddButton({Text="play/pause",Func=function() if  not v421.sound then v1124();if ( #v421.queue>0) then v421.queueIndex=1;v1127(1);end return;end if (v421.playing and  not v421.paused) then v421.sound:Pause();v421.paused=true;elseif v421.paused then v421.sound:Resume();v421.paused=false;elseif ( #v421.queue>0) then v1127(((v421.queueIndex>0) and v421.queueIndex) or 1 );end end});v1136:AddButton({Text="next",Func=function() v1128();end});v1136:AddButton({Text="stop",Func=function() v1118();end});v1136:AddDivider();v1136:AddSlider("MP_Volume",{Text="volume",Default=80,Min=0,Max=100,Rounding=0,Callback=function(v2241) v421.volume=v2241/100 ;if v421.sound then v421.sound.Volume=v421.volume;end end});v1136:AddSlider("MP_Pitch",{Text="pitch",Default=100,Min=25,Max=200,Rounding=0,Callback=function(v2243) v421.pitch=v2243/100 ;if v421.sound then v421.sound.PlaybackSpeed=v421.pitch;end end});v1136:AddDivider();v1136:AddToggle("MP_Shuffle",{Text="shuffle",Default=false,Callback=function(v2245) v421.shuffle=v2245;v1115();end});v1136:AddDropdown("MP_Repeat",{Text="repeat",Default=1,Values={"off","one","all"},Callback=function(v2247) v421.repeatMode=v2247;end});v1136:AddDivider();v1136:AddSlider("MP_Sleep",{Text="sleep (min)",Default=0,Min=0,Max=120,Rounding=0,Callback=function(v2249) v421.sleepEnd=((v2249>0) and (tick() + (v2249 * 60))) or nil ;end});v1136:AddButton({Text="reload",Func=function() v1124();end});v1137:AddInput("MP_Search",{Text="search",Default="",Placeholder="Filter songs...",Callback=function(v2251) v421.searchFilter=v2251;v1115();if v1123 then local v3139={};for v3412,v3413 in ipairs(v421.queue) do table.insert(v3139,v421.songs[v3413].name);end if ( #v3139==0) then v3139={"(no results)"};end pcall(function() v1123:SetValues(v3139);end);end end});do v1114();v1115();local v2253={};for v2909,v2910 in ipairs(v421.queue) do table.insert(v2253,v421.songs[v2910].name);end if ( #v2253==0) then v2253={"(no songs)"};end v1123=v1137:AddDropdown("MP_SongList",{Text="songs",Default=1,Values=v2253,Callback=function(v2911) for v3140,v3141 in ipairs(v421.queue) do if (v421.songs[v3141] and (v421.songs[v3141].name==v2911)) then v421.queueIndex=v3140;v1126(v3141);return;end end end});end v1137:AddButton({Text="play",Func=function() local v2254=tostring(Options.MP_SongList.Value or "" );v1124();for v2912,v2913 in ipairs(v421.queue) do if (v421.songs[v2913] and (v421.songs[v2913].name==v2254)) then v421.queueIndex=v2912;v1126(v2913);return;end end if ( #v421.queue>0) then warn("[Music] Selection '"   .. v2254   .. "' not found, playing first song instead" );v1127(1);else warn("[Music] No songs found in teddyhub_V1/Songs/");if v421._nowPlayingLabel then v421._nowPlayingLabel.Text="no songs in teddyhub_v1/songs";end end end});v1137:AddButton({Text="favourite",Func=function() local v2255=Options.MP_SongList.Value;if v421.favourites[v2255] then v421.favourites[v2255]=nil;else v421.favourites[v2255]=true;end end});v1138:AddSlider("MP_Bass",{Text="bass boost",Default=0,Min= -10,Max=10,Rounding=1,Callback=function(v2256) v421.bassBoost=v2256;v1117();end});v1138:AddDivider();v1138:AddToggle("MP_EQOn",{Text="eq",Default=false,Callback=function(v2258) v421.eqEnabled=v2258;v1117();end});v1138:AddSlider("MP_EQBass",{Text="eq bass",Default=0,Min= -10,Max=10,Rounding=1,Callback=function(v2260) v421.eqBass=v2260;v1117();end});v1138:AddSlider("MP_EQMid",{Text="eq mid",Default=0,Min= -10,Max=10,Rounding=1,Callback=function(v2262) v421.eqMid=v2262;v1117();end});v1138:AddSlider("MP_EQTreble",{Text="eq treble",Default=0,Min= -10,Max=10,Rounding=1,Callback=function(v2264) v421.eqTreble=v2264;v1117();end});v1138:AddDivider();v1138:AddToggle("MP_Reverb",{Text="reverb",Default=false,Callback=function(v2266) if  not v421.sound then return;end local v2267=v421.sound:FindFirstChild("MP_Reverb") or Instance.new("ReverbSoundEffect") ;v2267.Name="MP_Reverb";v2267.Parent=v421.sound;v2267.Enabled=v2266;end});v1138:AddSlider("MP_ReverbLevel",{Text="level",Default=20,Min=0,Max=100,Rounding=0,Callback=function(v2272) if  not v421.sound then return;end local v2273=v421.sound:FindFirstChild("MP_Reverb");if v2273 then v2273.DecayTime=v2272/20 ;end end});v1138:AddToggle("MP_Distortion",{Text="distortion",Default=false,Callback=function(v2274) if  not v421.sound then return;end local v2275=v421.sound:FindFirstChild("MP_Dist") or Instance.new("DistortionSoundEffect") ;v2275.Name="MP_Dist";v2275.Parent=v421.sound;v2275.Enabled=v2274;end});v1138:AddSlider("MP_DistLevel",{Text="level",Default=0,Min=0,Max=100,Rounding=0,Callback=function(v2280) if  not v421.sound then return;end local v2281=v421.sound:FindFirstChild("MP_Dist");if v2281 then v2281.Level=v2280/100 ;end end});v1138:AddToggle("MP_Chorus",{Text="chorus",Default=false,Callback=function(v2282) if  not v421.sound then return;end local v2283=v421.sound:FindFirstChild("MP_Chorus") or Instance.new("ChorusSoundEffect") ;v2283.Name="MP_Chorus";v2283.Parent=v421.sound;v2283.Enabled=v2282;end});v1138:AddSlider("MP_ChorusDepth",{Text="depth",Default=50,Min=0,Max=100,Rounding=0,Callback=function(v2288) if  not v421.sound then return;end local v2289=v421.sound:FindFirstChild("MP_Chorus");if v2289 then v2289.Depth=v2288/100 ;end end});v1138:AddToggle("MP_Normalize",{Text="normalize",Default=false,Callback=function(v2290) if  not v421.sound then return;end local v2291=v421.sound:FindFirstChild("MP_Norm") or Instance.new("CompressorSoundEffect") ;v2291.Name="MP_Norm";v2291.Parent=v421.sound;v2291.Enabled=v2290;end});v1139:AddToggle("MP_VizOn",{Text="visualizer",Default=true,Callback=function(v2296) v421.showViz=v2296;end});local v1142=Instance.new("ScreenGui");v1142.Name="teddyhubMusicViz";v1142.ResetOnSpawn=false;v1142.DisplayOrder=150;v1142.IgnoreGuiInset=true;pcall(function() v1142.Parent=v159;end);if  not v1142.Parent then v1142.Parent=v163;end getgenv().__themeRoots=getgenv().__themeRoots or {} ;table.insert(getgenv().__themeRoots,v1142);local v1148=Instance.new("Frame");v1148.Name="VizHolder";v1148.Size=UDim2.new(0,260,0,64);v1148.Position=UDim2.new(0.5, -130,0.9,0);v1148.BackgroundColor3=v152.BackgroundColor;v1148.BorderSizePixel=0;v1148.BackgroundTransparency=0.05;v1148.Parent=v1142;local v1157=Instance.new("UIStroke");v1157.Color=v152.OutlineColor;v1157.Thickness=1;v1157.Parent=v1148;local v1162=Instance.new("Frame");v1162.Name="Strip";v1162.Size=UDim2.new(1,0,0,2);v1162.BorderSizePixel=0;v1162.BackgroundColor3=v152.AccentColor;v1162.ZIndex=5;v1162.Parent=v1148;local v1170=Instance.new("TextLabel");v1170.Name="Title";v1170.Size=UDim2.new(1, -12,0,16);v1170.Position=UDim2.new(0,6,0,5);v1170.BackgroundTransparency=1;v1170.TextSize=12;if v152.font then v1170.FontFace=v152.font;else v1170.Font=Enum.Font.Code;end v1170.TextXAlignment=Enum.TextXAlignment.Left;v1170.TextColor3=v152.FontColor;v1170.TextTruncate=Enum.TextTruncate.AtEnd;v1170.Text="no song";v1170.Parent=v1148;local v1184=Instance.new("UIStroke");v1184.Color=Color3.new(0,0,0);v1184.Thickness=1;v1184.LineJoinMode=Enum.LineJoinMode.Miter;v1184.Transparency=1;v1184.Parent=v1170;v421._nowPlayingLabel=v1170;v1170.Size=UDim2.new(0.6,0,0,16);local v1192=Instance.new("TextLabel");v1192.Name="Time";v1192.Size=UDim2.new(0.4, -6,0,16);v1192.Position=UDim2.new(0.6,0,0,5);v1192.BackgroundTransparency=1;v1192.TextSize=12;if v152.font then v1192.FontFace=v152.font;else v1192.Font=Enum.Font.Code;end v1192.TextXAlignment=Enum.TextXAlignment.Right;v1192.TextColor3=v152.FontColor;v1192.Text="0:00 / 0:00";v1192.Parent=v1148;local function v1203(v2299) v2299=math.max(0,math.floor(v2299 + 0.5 ));return string.format("%d:%02d",math.floor(v2299/60 ),v2299%60 );end local v1204=Instance.new("Frame");v1204.Name="Bars";v1204.Position=UDim2.new(0,6,0,24);v1204.Size=UDim2.new(1, -12,1, -30);v1204.BackgroundTransparency=1;v1204.Parent=v1148;local v1210=32;local v1211={};for v2300=1,v1210 do local v2301=Instance.new("Frame");v2301.Name="VizBar"   .. v2300 ;v2301.Size=UDim2.new(1/v1210 , -2,0,0);v2301.AnchorPoint=Vector2.new(0,1);v2301.Position=UDim2.new((v2300-1)/v1210 ,1,1,0);v2301.BackgroundColor3=v152.AccentColor;v2301.BorderSizePixel=0;v2301.Parent=v1204;v1119[v2300]=v2301;v1211[v2300]=0;end v1148.Active=true;do local v2312=false;local v2313=Vector2.zero;local v2314=UDim2.new();v1148.InputBegan:Connect(function(v2923) if (v2923.UserInputType==Enum.UserInputType.MouseButton1) then v2312=true;v2313=v2923.Position;v2314=v1148.Position;end end);v1148.InputChanged:Connect(function(v2924) if (v2312 and (v2924.UserInputType==Enum.UserInputType.MouseMovement)) then local v3417=v2924.Position-v2313 ;v1148.Position=UDim2.new(v2314.X.Scale,v2314.X.Offset + v3417.X ,v2314.Y.Scale,v2314.Y.Offset + v3417.Y );end end);v1148.InputEnded:Connect(function(v2925) if (v2925.UserInputType==Enum.UserInputType.MouseButton1) then v2312=false;end end);end v155.RenderStepped:Connect(function() if v152.Unloaded then return;end v1148.Visible=v421.showViz;if (v421.sleepEnd and (tick()>=v421.sleepEnd)) then v421.sleepEnd=nil;v1118();print("[Music] sleep timer stopped playback");end local v2317,v2318=0,0;if v421.sound then pcall(function() v2317=v421.sound.TimePosition;v2318=v421.sound.TimeLength;end);end local v2319=v1203(v2317)   .. " / "   .. v1203(v2318) ;v1192.Text=v2319;if v1131 then pcall(function() v1131:SetText(v2319);end);end if  not v421.showViz then return;end local v2321=v421.sound and v421.playing and  not v421.paused ;local v2322=0;if v2321 then pcall(function() v2322=v421.sound.PlaybackLoudness or 0 ;end);end local v2323=math.clamp(v2322/150 ,0,1);local v2324=tick();local v2325=math.max(v1204.AbsoluteSize.Y,20);local v2326=Toggles.MP_VizRainbow and Toggles.MP_VizRainbow.Value ;for v2926,v2927 in ipairs(v1119) do local v2928=0.5 + (0.5 * math.sin((v2324 * (2.2 + (v2926 * 0.09))) + (v2926 * 0.6) )) ;local v2929;if v2321 then v2929=0.08 + (v2323 * (0.3 + (0.7 * v2928))) + (math.random() * v2323 * 0.12) ;else v2929=0.05 + (0.04 * v2928) ;end v2929=math.clamp(v2929,0,1);v1211[v2926]=v1211[v2926] + ((v2929-v1211[v2926]) * 0.3) ;v2927.Size=UDim2.new(1/v1210 , -2,0,math.max(2,v1211[v2926] * v2325 ));if v2326 then v2927.BackgroundColor3=Color3.fromHSV(((v2926/v1210) + (v2324 * 0.08))%1 ,0.8,1);else v2927.BackgroundColor3=v152.AccentColor:Lerp(v152.FontColor,v1211[v2926] * 0.6 );end end v1162.BackgroundColor3=v152.AccentColor;end);v1139:AddSlider("MP_VizX",{Text="viz x",Default=50,Min=0,Max=100,Rounding=0,Callback=function(v2329) v1148.Position=UDim2.new(v2329/100 , -100,v1148.Position.Y.Scale,v1148.Position.Y.Offset);end});v1139:AddSlider("MP_VizY",{Text="viz y",Default=92,Min=0,Max=100,Rounding=0,Callback=function(v2331) v1148.Position=UDim2.new(v1148.Position.X.Scale,v1148.Position.X.Offset,v2331/100 ,0);end});v1139:AddSlider("MP_VizW",{Text="width",Default=200,Min=80,Max=600,Rounding=0,Callback=function(v2333) v1148.Size=UDim2.new(0,v2333,0,v1148.AbsoluteSize.Y);end});v1139:AddSlider("MP_VizH",{Text="height",Default=40,Min=20,Max=120,Rounding=0,Callback=function(v2335) v1148.Size=UDim2.new(0,v1148.AbsoluteSize.X,0,v2335);end});v1139:AddToggle("MP_VizRainbow",{Text="rainbow",Default=false});v1139:AddLabel("drag to move.");v1140:AddLabel("use favourite on a song.");v1140:AddButton({Text="play favs",Func=function() v421.queue={};for v2932,v2933 in ipairs(v421.songs) do if v421.favourites[v2933.name] then table.insert(v421.queue,v2932);end end if ( #v421.queue==0) then return;end v421.queueIndex=1;v1127(1);end});v1140:AddButton({Text="clear favs",Func=function() v421.favourites={};end});v1140:AddDivider();v1140:AddLabel("folder: songs");v1140:AddLabel("mp3 ogg flac wav");v1140:AddButton({Text="song info",Func=function() print("[Music] Songs folder: "   .. v421.FOLDER );print("[Music] "   ..  #v421.songs   .. " songs loaded" );for v2934,v2935 in ipairs(v421.songs) do print("  - "   .. v2935.name );end end});v421._vizGui=v1142;end v15("music player",v422);local function v423() local v1214=game:GetService("UserInputService");local v1215=game:GetService("RunService");local v1216=game:GetService("Lighting");local v1217=game:GetService("TeleportService");local v1218=game:GetService("VirtualUser");local v1219=game:GetService("Players").LocalPlayer;local v1220={};local function v1221(v2340) table.insert(v1220,v2340);return v2340;end local v1222,v1223,v1224,v1225,v1226=false,false,false,false,false;local v1227={Brightness=v1216.Brightness,Ambient=v1216.Ambient,OutdoorAmbient=v1216.OutdoorAmbient,GlobalShadows=v1216.GlobalShadows,FogEnd=v1216.FogEnd,ClockTime=v1216.ClockTime};local function v1228() local v2341=v1219.Character;if  not v2341 then return;end for v2936,v2937 in ipairs(v2341:GetDescendants()) do if v2937:IsA("BasePart") then v2937.CanCollide=true;end end end v1221(v1215.Stepped:Connect(function() if  not v1222 then return;end local v2342=v1219.Character;if  not v2342 then return;end for v2938,v2939 in ipairs(v2342:GetDescendants()) do if (v2939:IsA("BasePart") and v2939.CanCollide and (v2939.Name~="HumanoidRootPart")) then v2939.CanCollide=false;end end end));v1221(v1214.JumpRequest:Connect(function() if  not v1223 then return;end local v2343=v1219.Character and v1219.Character:FindFirstChildOfClass("Humanoid") ;if v2343 then v2343:ChangeState(Enum.HumanoidStateType.Jumping);end end));v1221(v1214.InputBegan:Connect(function(v2344,v2345) if (v2345 or  not v1224) then return;end if (v2344.UserInputType~=Enum.UserInputType.MouseButton1) then return;end if  not v1214:IsKeyDown(Enum.KeyCode.LeftControl) then return;end local v2346=v1219.Character and v1219.Character:FindFirstChild("HumanoidRootPart") ;local v2347=v1219:GetMouse().Hit;if (v2346 and v2347) then v2346.CFrame=CFrame.new(v2347.Position + Vector3.new(0,3,0) );end end));v1221(v1219.Idled:Connect(function() if  not v1225 then return;end pcall(function() v1218:CaptureController();v1218:ClickButton2(Vector2.new());end);end));local function v1229(v2348) if v2348 then v1216.Brightness=2;v1216.ClockTime=14;v1216.GlobalShadows=false;v1216.Ambient=Color3.new(1,1,1);v1216.OutdoorAmbient=Color3.new(1,1,1);v1216.FogEnd=100000;else for v3425,v3426 in pairs(v1227) do pcall(function() v1216[v3425]=v3426;end);end end end local function v1230(v2349) if  not setfpscap then warn("[Misc] setfpscap is not supported by this executor");return;end local v2350=tonumber(v2349) or 0 ;pcall(setfpscap,v2350);end local function v1231() local v2351=v1219.Character and v1219.Character:FindFirstChildOfClass("Humanoid") ;if v2351 then v2351.Health=0;end end local function v1232() if setclipboard then setclipboard(game.JobId);print("[Misc] JobId copied to clipboard");else print("[Misc] JobId: "   .. game.JobId );end end local function v1233() pcall(function() v1217:TeleportToPlaceInstance(game.PlaceId,game.JobId,v1219);end);end local function v1234() local v2352= #game:GetService("Players"):GetPlayers();print("[Misc] PlaceId: "   .. game.PlaceId );print("[Misc] JobId:   "   .. game.JobId );print("[Misc] Players: "   .. v2352   .. "/"   .. game:GetService("Players").MaxPlayers );end if  not v400.miscL2 then v400.miscL2=v402.Misc:AddLeftTabbox();end local v1235=v400.miscL2:AddTab("player");local v1236=v400.miscR:AddTab("server");v1235:AddToggle("MX_Noclip",{Text="noclip",Default=false,Callback=function(v2353) v1222=v2353;if  not v2353 then v1228();end end});v1235:AddToggle("MX_InfJump",{Text="infinite jump",Default=false,Callback=function(v2354) v1223=v2354;end});v1235:AddToggle("MX_ClickTP",{Text="ctrl + click teleport",Default=false,Callback=function(v2355) v1224=v2355;end});v1235:AddToggle("MX_AntiAfk",{Text="anti-afk",Default=false,Callback=function(v2356) v1225=v2356;end});v1235:AddDivider();v1235:AddButton({Text="reset character",Func=v1231});v1236:AddToggle("MX_Fullbright",{Text="fullbright",Default=false,Callback=function(v2357) v1226=v2357;v1229(v2357);end});v1236:AddDropdown("MX_FPS",{Text="fps cap",Values={"60","120","144","240","Unlimited"},Default="Unlimited",Callback=v1230});v1236:AddDivider();v1236:AddButton({Text="copy jobid",Func=v1232});v1236:AddButton({Text="rejoin server",Func=v1233});v1236:AddButton({Text="print server info",Func=v1234});local v1237;local function v1238() return v1219.Character and v1219.Character:FindFirstChild("HumanoidRootPart") ;end v1235:AddButton({Text="set mark",Func=function() local v2358=v1238();if v2358 then v1237=v2358.CFrame;print("[Misc] bookmark set");end end});v1235:AddButton({Text="go mark",Func=function() local v2359=v1238();if (v2359 and v1237) then v2359.CFrame=v1237;else warn("[Misc] no bookmark set");end end});v1235:AddButton({Text="go spawn",Func=function() local v2360=workspace:FindFirstChildOfClass("SpawnLocation");local v2361=v1238();if (v2360 and v2361) then v2361.CFrame=v2360.CFrame + Vector3.new(0,5,0) ;else warn("[Misc] no SpawnLocation found");end end});v1236:AddButton({Text="copy pos",Func=function() local v2362=v1238();if  not v2362 then return;end local v2363=v2362.Position;local v2364=string.format("%.1f, %.1f, %.1f",v2363.X,v2363.Y,v2363.Z);if setclipboard then setclipboard(v2364);print("[Misc] copied "   .. v2364 );else print("[Misc] "   .. v2364 );end end});v143.MiscExtras.cleanup=function() for v2941,v2942 in ipairs(v1220) do pcall(function() v2942:Disconnect();end);end v1220={};v1222,v1223,v1224,v1225=false,false,false,false;if v1226 then v1229(false);end v1226=false;v1228();end;end v15("misc tools",v423);local function v424() local v1240=game:GetService("RunService");local v1241=game:GetService("Stats");local v1242=game:GetService("Players");local v1243=game:GetService("UserInputService");local v1244=v1242.LocalPlayer;local v1245=v1244:WaitForChild("PlayerGui");local v1246=Instance.new("ScreenGui");v1246.Name="teddyhubCustomHUD";v1246.ResetOnSpawn=false;v1246.DisplayOrder=300;v1246.IgnoreGuiInset=true;pcall(function() v1246.Parent=game:GetService("CoreGui");end);if  not v1246.Parent then v1246.Parent=v1245;end local v1251=Instance.new("Frame");v1251.Name="Panel";v1251.Size=UDim2.fromOffset(190,0);v1251.AutomaticSize=Enum.AutomaticSize.Y;v1251.BackgroundColor3=v152.MainColor;v1251.BorderSizePixel=0;v1251.Position=UDim2.fromScale(0.01,0.01);v1251.Parent=v1246;local v1261=Instance.new("UIScale");v1261.Parent=v1251;local v1263=Instance.new("UIStroke");v1263.Color=v152.OutlineColor;v1263.Thickness=1;v1263.Parent=v1251;local v1268=Instance.new("UIListLayout");v1268.SortOrder=Enum.SortOrder.LayoutOrder;v1268.Padding=UDim.new(0,2);v1268.Parent=v1251;local v1273=Instance.new("UIPadding");v1273.PaddingTop=UDim.new(0,6);v1273.PaddingBottom=UDim.new(0,6);v1273.PaddingLeft=UDim.new(0,8);v1273.PaddingRight=UDim.new(0,8);v1273.Parent=v1251;local v1279=Instance.new("Frame");v1279.Name="AccentStrip";v1279.Size=UDim2.new(1,0,0,2);v1279.Position=UDim2.new(0,0,0,0);v1279.BorderSizePixel=0;v1279.BackgroundColor3=v152.AccentColor;v1279.ZIndex=5;v1279.Parent=v1251;local function v1288(v2366) local v2367=Instance.new("TextLabel");v2367.LayoutOrder=v2366;v2367.BackgroundTransparency=1;v2367.Size=UDim2.new(1,0,0,16);v2367.Font=Enum.Font.Code;v2367.TextSize=14;v2367.TextXAlignment=Enum.TextXAlignment.Left;v2367.TextColor3=v152.FontColor;v2367.Text="";v2367.Parent=v1251;local v2380=Instance.new("UIStroke");v2380.Color=Color3.new(0,0,0);v2380.Thickness=1;v2380.LineJoinMode=Enum.LineJoinMode.Miter;v2380.Parent=v2367;return v2367;end local v1289=v1288(0);local v1290={{key="HUD_ShowFPS",order=1},{key="HUD_ShowPing",order=2},{key="HUD_ShowTime",order=3},{key="HUD_ShowPlayers",order=4},{key="HUD_ShowGameTime",order=5},{key="HUD_ShowHealth",order=6},{key="HUD_ShowPos",order=7}};local v1291={};for v2386,v2387 in ipairs(v1290) do v1291[v2387.key]=v1288(v2387.order);end v1251.Active=true;do local v2389,v2390,v2391=false,Vector2.zero,v1251.Position;v1251.InputBegan:Connect(function(v2944) if (v2944.UserInputType==Enum.UserInputType.MouseButton1) then v2389=true;v2390=v2944.Position;v2391=v1251.Position;end end);v1243.InputChanged:Connect(function(v2945) if (v2389 and (v2945.UserInputType==Enum.UserInputType.MouseMovement)) then local v3429=v2945.Position-v2390 ;v1251.Position=UDim2.new(v2391.X.Scale,v2391.X.Offset + v3429.X ,v2391.Y.Scale,v2391.Y.Offset + v3429.Y );end end);v1243.InputEnded:Connect(function(v2946) if (v2946.UserInputType==Enum.UserInputType.MouseButton1) then v2389=false;end end);end local v1293,v1294,v1295=0,tick(),60;local v1296=false;local v1297=setmetatable({},{__mode="k"});local v1298=setmetatable({},{__mode="k"});local function v1299() local v2392,v2393=pcall(function() return math.floor(v1241.Network.ServerStatsItem["Data Ping"]:GetValue());end);return (v2392 and v2393) or 0 ;end local function v1300() local v2394=v1244.Character and v1244.Character:FindFirstChildOfClass("Humanoid") ;if  not v2394 then return "--";end return string.format("%d / %d",math.floor(v2394.Health),math.floor(v2394.MaxHealth));end local function v1301() local v2395=v1244.Character and v1244.Character:FindFirstChild("HumanoidRootPart") ;if  not v2395 then return "--";end local v2396=v2395.Position;return string.format("%d, %d, %d",math.floor(v2396.X),math.floor(v2396.Y),math.floor(v2396.Z));end local v1302=0;local v1303;v1303=v1240.RenderStepped:Connect(function(v2397) if v152.Unloaded then return;end v1293=v1293 + 1 ;if ((tick() -v1294)>=1) then v1295=v1293;v1293=0;v1294=tick();end local v2398=Options.HUD_Accent.Value;local v2399=Options.HUD_TextColor.Value;local v2400=Options.HUD_TextSize.Value;local v2401=table.concat({tostring(v2398),tostring(v2399),tostring(v2400),tostring(Options.HUD_Scale.Value),tostring(Options.HUD_X.Value),tostring(Options.HUD_Y.Value),tostring(Options.HUD_BgTrans.Value),tostring(Toggles.HUD_Enabled.Value),tostring(Toggles.HUD_ShowTitle.Value),tostring(Options.HUD_Title.Value)},"|");if (v2401~=v1296) then v1296=v2401;v1261.Scale=Options.HUD_Scale.Value/100 ;v1251.Position=UDim2.fromScale(Options.HUD_X.Value/100 ,Options.HUD_Y.Value/100 );v1251.BackgroundTransparency=Options.HUD_BgTrans.Value/100 ;v1251.Visible=Toggles.HUD_Enabled.Value;v1279.BackgroundColor3=v2398;v1279.Visible=Toggles.HUD_ShowTitle.Value;v1289.Visible=Toggles.HUD_ShowTitle.Value;v1289.Text=Options.HUD_Title.Value;v1289.TextColor3=v2398;v1289.TextSize=v2400;end v1302=v1302 + v2397 ;if (v1302<0.2) then return;end v1302=0;local v2402={HUD_ShowFPS="FPS: "   .. v1295 ,HUD_ShowPing="Ping: "   .. v1299()   .. " ms" ,HUD_ShowTime="Time: "   .. os.date("%H:%M:%S") ,HUD_ShowPlayers="Players: "   ..  #v1242:GetPlayers()   .. " / "   .. v1242.MaxPlayers ,HUD_ShowGameTime=string.format("Game time: %02d:%02d",math.floor(game:GetService("Lighting").ClockTime),math.floor((game:GetService("Lighting").ClockTime%1) * 60 )),HUD_ShowHealth="HP: "   .. v1300() ,HUD_ShowPos="Pos: "   .. v1301() };for v2947,v2948 in ipairs(v1290) do local v2949=v1291[v2948.key];local v2950=v2402[v2948.key];if (v1297[v2948.key]~=v2950) then v1297[v2948.key]=v2950;v2949.Text=v2950;end if (v1298["c"   .. v2948.key ]~=v2399) then v1298["c"   .. v2948.key ]=v2399;v2949.TextColor3=v2399;end if (v1298["s"   .. v2948.key ]~=v2400) then v1298["s"   .. v2948.key ]=v2400;v2949.TextSize=v2400;end local v2951=Toggles[v2948.key].Value;if (v1297["v"   .. v2948.key ]~=v2951) then v1297["v"   .. v2948.key ]=v2951;v2949.Visible=v2951;end end end);v143.CustomHUD.cleanup=function() if v1303 then v1303:Disconnect();end pcall(function() v1246:Destroy();end);end;end local function v425() local v1305=v400.visR2:AddTab("hud");v1305:AddToggle("HUD_Enabled",{Text="enable custom hud",Default=false});v1305:AddToggle("HUD_ShowTitle",{Text="show title",Default=true});v1305:AddInput("HUD_Title",{Default="teddyhub v.3",Text="title",Finished=true});v1305:AddDivider();v1305:AddToggle("HUD_ShowFPS",{Text="fps",Default=true});v1305:AddToggle("HUD_ShowPing",{Text="ping",Default=true});v1305:AddToggle("HUD_ShowTime",{Text="real time",Default=true});v1305:AddToggle("HUD_ShowPlayers",{Text="player count",Default=true});v1305:AddToggle("HUD_ShowGameTime",{Text="game time",Default=false});v1305:AddToggle("HUD_ShowHealth",{Text="my health",Default=false});v1305:AddToggle("HUD_ShowPos",{Text="my position",Default=false});v1305:AddDivider();v1305:AddSlider("HUD_Scale",{Text="scale %",Default=100,Min=50,Max=200,Rounding=0});v1305:AddSlider("HUD_TextSize",{Text="text size",Default=14,Min=10,Max=24,Rounding=0});v1305:AddSlider("HUD_BgTrans",{Text="background transparency %",Default=15,Min=0,Max=100,Rounding=0});v1305:AddSlider("HUD_X",{Text="position x %",Default=1,Min=0,Max=100,Rounding=0});v1305:AddSlider("HUD_Y",{Text="position y %",Default=1,Min=0,Max=100,Rounding=0});v1305:AddLabel("accent"):AddColorPicker("HUD_Accent",{Default=v152.AccentColor});v1305:AddLabel("text"):AddColorPicker("HUD_TextColor",{Default=v152.FontColor});v1305:AddDivider();v1305:AddButton({Text="reset position",Func=function() Options.HUD_X:SetValue(1);Options.HUD_Y:SetValue(1);end});end v15("hud gui",v425);v15("custom HUD",v424);local function v426() local v1306={"AimbotOn","WallChk","StickyOn","TrigOn","SAOn","AA_Enable","RG_On","HB_On","ESPOn","Visuals_Enabled","Weather_Enabled","SelfChams_Enabled","FOV_Enabled","CC_Enabled","Bloom_Enabled","CHVis","SpeedOn","JumpOn","FlyOn","SpinBotOn","MX_Noclip","MX_InfJump","MX_ClickTP","MX_AntiAfk","MX_Fullbright","HUD_Enabled","MP_EQOn"};local v1307,v1308=0,0;for v2403,v2404 in ipairs(v1306) do local v2405,v2406=pcall(function() local v2952=Toggles[v2404];if  not v2952 then error("toggle not found");end v2952:AddKeyPicker(v2404   .. "_Key" ,{Default="None",Mode="Toggle",SyncToggleState=true,Text=v2404,NoUI=false});end);if v2405 then v1307=v1307 + 1 ;else v1308=v1308 + 1 ;warn("[Keybind] "   .. v2404   .. ": "   .. tostring(v2406) );end end print("[Keybind] "   .. v1307   .. " feature keybind(s) added, "   .. v1308   .. " failed" );end v15("keybinds",v426);local function v427() local v1309=v400.visL:AddTab("effects");v143.EffectsGroup=v1309;v1309:AddToggle("GL_On",{Text="glow",Default=false});v1309:AddSlider("GL_Pulse",{Text="pulse",Default=2,Min=0,Max=10,Rounding=1});v1309:AddSlider("GL_Fill",{Text="fill",Default=60,Min=0,Max=100,Rounding=0});v1309:AddSlider("GL_Outline",{Text="outline",Default=80,Min=0,Max=100,Rounding=0});v1309:AddDivider();v1309:AddToggle("FX_On",{Text="particles",Default=false});v1309:AddDropdown("FX_Preset",{Text="preset",Default="Fire",Values={"Fire","Ember","Smoke","Dark Smoke","Sparks","Stars","Snow","Rain","Halo","Orbit","Aura","Mist","Electric","Pixel","Blaze","Glow Dots","Lava","Trail Up","Vortex","Storm","Pillar","Ring","Tornado","Ground Fire","Glow Ring"}});v1309:AddSlider("FX_Rate",{Text="amount %",Default=100,Min=10,Max=300,Rounding=0});v1309:AddSlider("FX_Size",{Text="size %",Default=100,Min=25,Max=300,Rounding=0});v1309:AddToggle("FX_Rainbow",{Text="rainbow",Default=false});v1309:AddLabel("color"):AddColorPicker("FX_Color",{Default=Color3.fromRGB(0,255,140)});v1309:AddDivider();local v1311="rbxasset://textures/particles/fire_main.dds";local v1312="rbxasset://textures/particles/smoke_main.dds";local v1313="rbxasset://textures/particles/sparkles_main.dds";local v1314=Enum.ParticleEmitterShape;local v1315={Fire={tex=v1311,rate=60,life={0.6,1.2},speed={2,5},spread=25,size=3,light=1,accel=Vector3.new(0,4,0),rot={0,0},shape=v1314.Disc,fade=true},Ember={tex=v1311,rate=25,life={1,2},speed={1,2},spread=40,size=1.2,light=1,accel=Vector3.new(0,2,0),rot={0,0},shape=v1314.Sphere,fade=true},Smoke={tex=v1312,rate=20,life={2,3},speed={1,2},spread=30,size=4,light=0,accel=Vector3.new(0,1,0),rot={ -20,20},shape=v1314.Disc,fade=true},["Dark Smoke"]={tex=v1312,rate=12,life={3,4},speed={0.5,1},spread=20,size=6,light=0,accel=Vector3.new(0,0.5,0),rot={ -10,10},shape=v1314.Sphere,fade=true},Sparks={tex=v1313,rate=40,life={0.5,1},speed={3,6},spread=180,size=0.8,light=1,accel=Vector3.new(0, -4,0),rot={0,0},shape=v1314.Sphere,fade=true},Stars={tex=v1313,rate=8,life={1.5,2.5},speed={0.5,1},spread=180,size=0.6,light=1,accel=Vector3.new(0,0,0),rot={0,0},shape=v1314.Sphere,fade=true},Snow={tex=v1313,rate=25,life={3,5},speed={0.5,1},spread=15,size=0.5,light=0,accel=Vector3.new(0, -2,0),rot={0,0},shape=v1314.Box,fade=false},Rain={tex=v1313,rate=60,life={0.5,0.8},speed={0.5,0.5},spread=0,size=0.3,light=0,accel=Vector3.new(0, -30,0),rot={0,0},shape=v1314.Box,fade=false},Halo={tex=v1313,rate=40,life={1,1.5},speed={0.1,0.2},spread=180,size=0.7,light=1,accel=Vector3.new(0,0,0),rot={0,0},shape=v1314.Disc,fade=true},Orbit={tex=v1313,rate=50,life={1,1.5},speed={6,8},spread=5,size=0.5,light=1,accel=Vector3.new(0,0,0),rot={90,180},shape=v1314.Disc,fade=true},Aura={tex=v1312,rate=10,life={2,2.5},speed={0.5,1},spread=180,size=5,light=1,accel=Vector3.new(0,0,0),rot={0,0},shape=v1314.Sphere,fade=true},Mist={tex=v1312,rate=8,life={4,5},speed={0.2,0.4},spread=60,size=8,light=0,accel=Vector3.new(0,0,0),rot={ -5,5},shape=v1314.Box,fade=true},Electric={tex=v1313,rate=90,life={0.1,0.2},speed={8,12},spread=180,size=0.4,light=1,accel=Vector3.new(0,0,0),rot={0,0},shape=v1314.Sphere,fade=false},Pixel={tex=v1313,rate=30,life={2,2},speed={0.5,0.5},spread=180,size=0.3,light=0,accel=Vector3.new(0,0,0),rot={ -180,180},shape=v1314.Box,fade=false},Blaze={tex=v1311,rate=120,life={0.2,0.4},speed={10,15},spread=20,size=2,light=1,accel=Vector3.new(0,6,0),rot={0,0},shape=v1314.Disc,fade=true},["Glow Dots"]={tex=v1313,rate=15,life={0.8,1.2},speed={0.2,0.2},spread=180,size=0.9,light=1,accel=Vector3.new(0,0,0),rot={0,0},shape=v1314.Sphere,fade=true},Lava={tex=v1311,rate=35,life={1,2},speed={1,2},spread=5,size=2,light=1,accel=Vector3.new(0,6,0),rot={ -30,30},shape=v1314.Disc,fade=true},["Trail Up"]={tex=v1313,rate=60,life={0.6,0.6},speed={0,0},spread=0,size=0.6,light=1,accel=Vector3.new(0,8,0),rot={0,0},shape=v1314.Box,fade=true},Vortex={tex=v1313,rate=70,life={1,1},speed={4,4},spread=0,size=0.5,light=1,accel=Vector3.new(0,0,0),rot={180,360},shape=v1314.Cylinder,fade=true},Pillar={tex=v1311,rate=80,life={1.5,2},speed={10,12},spread=5,size=2,light=1,accel=Vector3.new(0,2,0),rot={0,0},shape=Enum.ParticleEmitterShape.Disc,fade=true},Ring={tex=v1313,rate=60,life={1,1.2},speed={0.1,0.2},spread=180,size=0.6,light=1,accel=Vector3.new(0,0,0),rot={180,360},shape=Enum.ParticleEmitterShape.Disc,fade=true},Tornado={tex=v1311,rate=120,life={0.8,1},speed={6,8},spread=60,size=2,light=1,accel=Vector3.new(0,0,0),rot={360,720},shape=Enum.ParticleEmitterShape.Cylinder,fade=true},["Ground Fire"]={tex=v1311,rate=50,life={0.5,1},speed={0,1},spread=90,size=2.5,light=1,accel=Vector3.new(0,3,0),rot={0,0},shape=Enum.ParticleEmitterShape.Disc,fade=true},["Glow Ring"]={tex=v1313,rate=100,life={0.6,0.6},speed={0.5,0.5},spread=90,size=0.4,light=1,accel=Vector3.new(0,0,0),rot={90,90},shape=Enum.ParticleEmitterShape.Disc,fade=true},Storm={tex=v1313,rate=100,life={0.4,0.7},speed={12,18},spread=60,size=0.4,light=0,accel=Vector3.new(0, -20,0),rot={0,0},shape=v1314.Box,fade=false}};local v1316;local v1317;local function v1318(v2407) if (v1317 and (v1317.Parent==v2407)) then return v1317;end if v1317 then pcall(function() v1317:Destroy();end);end v1317=Instance.new("ParticleEmitter");v1317.Name="teddyhubFX";v1317.Parent=v2407;return v1317;end local v1319=v155.Heartbeat:Connect(function() if v152.Unloaded then return;end local v2410=v161.Character;local v2411=v2410 and v2410:FindFirstChild("HumanoidRootPart") ;if ( not Toggles.GL_On.Value or  not v2410) then if v1316 then v1316.Enabled=false;end else if ( not v1316 or (v1316.Parent~=v2410)) then v1316=v2410:FindFirstChild("teddyhubGlow") or Instance.new("Highlight") ;v1316.Name="teddyhubGlow";v1316.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop;v1316.Adornee=v2410;v1316.Parent=v2410;end local v3172=Options.GL_Pulse.Value;local v3173=((v3172>0) and (0.5 + (0.5 * math.sin(tick() * v3172 )))) or 1 ;local v3174=(Toggles.FX_Rainbow.Value and Color3.fromHSV((tick() * 0.2)%1 ,1,1)) or Options.FX_Color.Value ;v1316.Enabled=true;v1316.FillColor=v3174;v1316.OutlineColor=v3174;v1316.FillTransparency=1 -((Options.GL_Fill.Value/100) * v3173) ;v1316.OutlineTransparency=1 -(Options.GL_Outline.Value/100) ;end if ( not Toggles.FX_On.Value or  not v2411) then if v1317 then v1317.Enabled=false;end return;end local v2412=v1315[Options.FX_Preset.Value] or v1315['Fire'] ;local v2413=v1318(v2411);local v2414=Options.FX_Rate.Value/100 ;local v2415=Options.FX_Size.Value/100 ;local v2416=(Toggles.FX_Rainbow.Value and Color3.fromHSV((tick() * 0.25)%1 ,1,1)) or Options.FX_Color.Value ;v2413.Enabled=true;v2413.Texture=v2412.tex;v2413.Rate=v2412.rate * v2414 ;v2413.Lifetime=NumberRange.new(v2412.life[1],v2412.life[2]);v2413.Speed=NumberRange.new(v2412.speed[1],v2412.speed[2]);v2413.SpreadAngle=Vector2.new(v2412.spread,v2412.spread);v2413.Size=NumberSequence.new(v2412.size * v2415 );v2413.LightEmission=v2412.light;v2413.Acceleration=v2412.accel;v2413.RotSpeed=NumberRange.new(v2412.rot[1],v2412.rot[2]);v2413.Shape=v2412.shape;v2413.Color=ColorSequence.new(v2416);if v2412.fade then v2413.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)});else v2413.Transparency=NumberSequence.new(0);end end);v143.SelfFX.cleanup=function() if v1319 then v1319:Disconnect();end if v1316 then pcall(function() v1316:Destroy();end);end if v1317 then pcall(function() v1317:Destroy();end);end end;end v15("effects",v427);local function v428() local v1321=v400.setR:AddTab("search");v1321:AddInput("SR_Query",{Text="find",Default="",Finished=false,Placeholder="name..."});v1321:AddLabel("shows matching options and their value.");local v1322=Instance.new("ScreenGui");v1322.Name="teddyhubSearch";v1322.ResetOnSpawn=false;v1322.DisplayOrder=260;v1322.IgnoreGuiInset=true;pcall(function() v1322.Parent=game:GetService("CoreGui");end);if  not v1322.Parent then v1322.Parent=v163;end local v1327=Instance.new("Frame");v1327.Name="Panel";v1327.Size=UDim2.fromOffset(220,0);v1327.AutomaticSize=Enum.AutomaticSize.Y;v1327.Position=UDim2.new(1, -230,0,60);v1327.BackgroundColor3=v152.MainColor;v1327.BorderSizePixel=0;v1327.Visible=false;v1327.Parent=v1322;local v1338=Instance.new("UIStroke");v1338.Color=v152.OutlineColor;v1338.Thickness=1;v1338.Parent=v1327;local v1343=Instance.new("Frame");v1343.Size=UDim2.new(1,0,0,2);v1343.BorderSizePixel=0;v1343.BackgroundColor3=v152.AccentColor;v1343.ZIndex=5;v1343.Parent=v1327;local v1350=Instance.new("UIListLayout");v1350.SortOrder=Enum.SortOrder.LayoutOrder;v1350.Padding=UDim.new(0,2);v1350.Parent=v1327;local v1355=Instance.new("UIPadding");v1355.PaddingTop=UDim.new(0,7);v1355.PaddingBottom=UDim.new(0,6);v1355.PaddingLeft=UDim.new(0,8);v1355.PaddingRight=UDim.new(0,8);v1355.Parent=v1327;local v1361={};local function v1362(v2434) if  not v1361[v2434] then local v3182=Instance.new("TextLabel");v3182.BackgroundTransparency=1;v3182.Font=Enum.Font.Code;v3182.TextSize=13;v3182.TextXAlignment=Enum.TextXAlignment.Left;v3182.Size=UDim2.new(1,0,0,15);v3182.LayoutOrder=v2434;v3182.TextColor3=v152.FontColor;v3182.Visible=false;v3182.Parent=v1327;local v3195=Instance.new("UIStroke");v3195.Color=Color3.new(0,0,0);v3195.Thickness=1;v3195.LineJoinMode=Enum.LineJoinMode.Miter;v3195.Parent=v3182;v1361[v2434]=v3182;end return v1361[v2434];end local function v1363(v2435) local v2436=string.lower(v2435 or "" );if (v2436=="") then v1327.Visible=false;return;end local v2437={};for v2954,v2955 in pairs(Toggles) do if string.find(string.lower(v2954),v2436,1,true) then table.insert(v2437,{name=v2954,value=tostring(v2955.Value)});end end for v2956,v2957 in pairs(Options) do if (string.find(string.lower(v2956),v2436,1,true) and  not Toggles[v2956]) then local v3439=v2957.Value;if (typeof(v3439)=="Color3") then v3439="#"   .. string.format("%02X%02X%02X",v3439.R * 255 ,v3439.G * 255 ,v3439.B * 255 ) ;end table.insert(v2437,{name=v2956,value=tostring(v3439)});end end table.sort(v2437,function(v2958,v2959) return v2958.name<v2959.name ;end);v1327.Visible=true;local v2439=math.min( #v2437,14);for v2960=1,v2439 do local v2961=v1362(v2960 + 1 );v2961.Visible=true;v2961.Text=v2437[v2960].name   .. " = "   .. v2437[v2960].value ;end for v2964=v2439 + 2 , #v1361 do v1361[v2964].Visible=false;end if ( #v2437==0) then local v3203=v1362(2);v3203.Visible=true;v3203.Text="no match";for v3440=3, #v1361 do v1361[v3440].Visible=false;end end end local v1364=Instance.new("TextLabel");v1364.LayoutOrder=0;v1364.BackgroundTransparency=1;v1364.Font=Enum.Font.Code;v1364.TextSize=13;v1364.TextXAlignment=Enum.TextXAlignment.Left;v1364.Size=UDim2.new(1,0,0,16);v1364.Text="search";v1364.TextColor3=v152.AccentColor;v1364.Parent=v1327;Options.SR_Query:OnChanged(function(v2440) v1363(v2440);end);v143.SearchUI.cleanup=function() pcall(function() v1322:Destroy();end);end;end v15("search ui",v428);local function v429() local v1377=game:GetService("Lighting");local v1378=v400.visR2:AddTab("extra");v1378:AddToggle("XF_Tint",{Text="tint",Default=false});v1378:AddLabel("tint color"):AddColorPicker("XF_TintColor",{Default=Color3.fromRGB(120,180,255)});v1378:AddToggle("XF_Blur",{Text="blur",Default=false});v1378:AddSlider("XF_BlurSize",{Text="blur size",Default=8,Min=0,Max=30,Rounding=0});v1378:AddSlider("XF_Sat",{Text="saturation",Default=0,Min= -100,Max=100,Rounding=0});local v1379=v400.movR:AddTab("extra");v1379:AddToggle("XM_GravOn",{Text="gravity",Default=false});v1379:AddSlider("XM_Gravity",{Text="gravity",Default=196,Min=0,Max=400,Rounding=0});v1379:AddToggle("XM_Sprint",{Text="sprint (shift)",Default=false});v1379:AddSlider("XM_SprintMul",{Text="sprint x",Default=2,Min=1,Max=5,Rounding=1});local v1380=v400.chR:AddTab("extra");v1380:AddToggle("XC_Dot",{Text="center dot",Default=false});v1380:AddSlider("XC_DotSize",{Text="dot size",Default=2,Min=1,Max=10,Rounding=0});v1380:AddLabel("dot color"):AddColorPicker("XC_DotColor",{Default=Color3.new(1,1,1)});local v1381=v400.miscR:AddTab("extra");v1381:AddToggle("XT_Timer",{Text="session timer",Default=false});v1381:AddInput("XN_Notes",{Text="notes",Default="",Finished=true,Placeholder="type..."});v1381:AddButton({Text="save notes",Func=function() pcall(function() if  not isfolder("teddyhub_V1") then makefolder("teddyhub_V1");end writefile("teddyhub_V1/notes.txt",Options.XN_Notes.Value);end);print("[extra] notes saved");end});v1381:AddButton({Text="load notes",Func=function() pcall(function() if isfile("teddyhub_V1/notes.txt") then Options.XN_Notes:SetValue(readfile("teddyhub_V1/notes.txt"));end end);print("[extra] notes loaded");end});local v1382=Instance.new("ColorCorrectionEffect");v1382.Name="teddyhubTint";v1382.Enabled=false;v1382.Parent=v1377;local v1386=Instance.new("BlurEffect");v1386.Name="teddyhubBlur";v1386.Enabled=false;v1386.Parent=workspace.CurrentCamera;local v1391=v230.new("Circle");v1391.Filled=true;v1391.Visible=false;v1391.NumSides=24;local v1395=Instance.new("ScreenGui");v1395.Name="teddyhubTimer";v1395.ResetOnSpawn=false;v1395.DisplayOrder=240;pcall(function() v1395.Parent=game:GetService("CoreGui");end);if  not v1395.Parent then v1395.Parent=v163;end local v1399=Instance.new("TextLabel");v1399.Size=UDim2.fromOffset(120,20);v1399.Position=UDim2.new(0.5, -60,0,4);v1399.BackgroundTransparency=0.3;v1399.BackgroundColor3=v152.MainColor;v1399.TextColor3=v152.FontColor;v1399.Font=Enum.Font.Code;v1399.TextSize=14;v1399.Visible=false;v1399.Parent=v1395;local v1412=tick();local v1413=workspace.Gravity;local v1414={};local v1415=v155.RenderStepped:Connect(function() if v152.Unloaded then return;end local v2442=Toggles.XF_Tint.Value;if (v1414.tintOn~=v2442) then v1414.tintOn=v2442;v1382.Enabled=v2442;end local v2443=(v2442 and Options.XF_TintColor.Value) or Color3.new(1,1,1) ;if (v1414.tintCol~=v2443) then v1414.tintCol=v2443;v1382.TintColor=v2443;end local v2444=Options.XF_Sat.Value/100 ;if (v1414.sat~=v2444) then v1414.sat=v2444;v1382.Saturation=v2444;end local v2445=Toggles.XF_Blur.Value;if (v1414.blurOn~=v2445) then v1414.blurOn=v2445;v1386.Enabled=v2445;end local v2446=Options.XF_BlurSize.Value;if (v1414.blurSize~=v2446) then v1414.blurSize=v2446;v1386.Size=v2446;end if Toggles.XM_GravOn.Value then workspace.Gravity=Options.XM_Gravity.Value;elseif (workspace.Gravity~=v1413) then workspace.Gravity=v1413;end local v2447=v161.Character;local v2448=v2447 and v2447:FindFirstChildOfClass("Humanoid") ;if (v2448 and Toggles.XM_Sprint.Value and v156:IsKeyDown(Enum.KeyCode.LeftShift)) then v2448.WalkSpeed=16 * Options.XM_SprintMul.Value ;end local v2449=workspace.CurrentCamera.ViewportSize;local v2450=Toggles.XC_Dot.Value;if (v1414.dotOn~=v2450) then v1414.dotOn=v2450;v1391.Visible=v2450;end if v2450 then local v3221=Vector2.new(v2449.X/2 ,v2449.Y/2 );if (v1414.dotPos~=v3221) then v1414.dotPos=v3221;v1391.Position=v3221;end local v3222=Options.XC_DotSize.Value;if (v1414.dotR~=v3222) then v1414.dotR=v3222;v1391.Radius=v3222;end local v3223=Options.XC_DotColor.Value;if (v1414.dotC~=v3223) then v1414.dotC=v3223;v1391.Color=v3223;end end local v2451=Toggles.XT_Timer.Value;if (v1414.timerOn~=v2451) then v1414.timerOn=v2451;v1399.Visible=v2451;end if v2451 then local v3226=math.floor(tick() -v1412 );local v3227=string.format("%02d:%02d:%02d",math.floor(v3226/3600 ),math.floor(v3226/60 )%60 ,v3226%60 );if (v1414.timerTxt~=v3227) then v1414.timerTxt=v3227;v1399.Text=v3227;end end end);v143.Extra.cleanup=function() if v1415 then v1415:Disconnect();end workspace.Gravity=v1413;pcall(function() v1382:Destroy();v1386:Destroy();v1395:Destroy();end);pcall(function() v1391:Remove();end);end;end v15("extra",v429);local function v430() local v1417={conns={},originals={},watches={},ignore={},ignoreText={},raw={},restoring=false};local v1418=v161:WaitForChild("PlayerGui");local v1419=nil;pcall(function() v1419=v152.ScreenGui;end);local function v1420(v2454) return (v2454:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]","%%%1"));end local function v1421() local v2455=Options.NC_Spoof.Value;if ((type(v2455)~="string") or (v2455=="")) then return "spoofed";end return v2455;end local function v1422() v1417.ignore,v1417.ignoreText={},{};local v2458=Options.NC_Ignore.Value or "" ;for v2967 in v2458:gmatch("[^,]+") do local v2968=v2967:match("^%s*(.-)%s*$");if (v2968~="") then local v3442=v2968:lower();v1417.ignore[v3442]=true;v1417.ignoreText[v3442]=true;end end end local function v1423(v2459) if (type(v2459)~="string") then return;end local v2460=v2459:match("^%s*(.-)%s*$");if ( #v2460<2) then return;end local v2461=v2460:lower();if v1417.raw[v2461] then return;end v1417.raw[v2461]=v2460;end local v1424={};local function v1425() v1424={};local v2463,v2464=pcall(function() return v7:GetFriendsAsync(v161.UserId);end);if ( not v2463 or  not v2464) then return;end for v2969=1,25 do local v2970=v2464:GetCurrentPage();for v3228,v3229 in ipairs(v2970) do table.insert(v1424,v3229);end if v2464.IsFinished then break;end local v2971=pcall(function() v2464:AdvanceToNextPageAsync();end);if  not v2971 then break;end end end local function v1426() v1417.raw={};if Toggles.NC_Self.Value then v1423(v161.Name);end local v2466=Options.NC_Match.Value;if (v2466~="friends") then for v3445,v3446 in ipairs(v7:GetPlayers()) do if ((v3446~=v161) or Toggles.NC_Self.Value) then v1423(v3446.Name);if Toggles.NC_Display.Value then v1423(v3446.DisplayName);end end end end if (v2466~="players") then for v3447,v3448 in ipairs(v1424) do v1423(v3448.Username);if (Toggles.NC_Display.Value and v3448.DisplayName) then v1423(v3448.DisplayName);end end if ( #v1424==0) then task.spawn(function() v1425();v1426();applyAll();end);end end end local v1427=function(v2467,v2468) local v2469=v1420(v2468);return v2467:find("%f[%w]"   .. v2469   .. "%f[^%w]" )~=nil ;end;local v1428=function(v2470) local v2471=Options.NC_Mode.Value;local v2472=(Toggles.NC_Case and Toggles.NC_Case.Value and v2470) or v2470:lower() ;for v2972,v2973 in pairs(v1417.raw) do local v2974=(Toggles.NC_Case and Toggles.NC_Case.Value and v2973) or v2972 ;if (v2471=="exact") then if (v2472==v2974) then return true;end elseif (v2471=="wholeword") then if v1427(v2472,v2974) then return true;end else if v1427(v2472,v2974) then return true;end if (( #v2974>=3) and v2472:find(v2974,1,true)) then return true;end end end return false;end;local v1429=0;local function v1430(v2473) if (v1417.restoring or  not Toggles.NC_On.Value) then return;end local v2474=v1421();local v2475=v2473.Text;if ((type(v2475)~="string") or (v2475=="") or (v2475==v2474)) then return;end local v2476=v2475:lower();if v1417.ignoreText[v2476] then return;end if v1417.ignore[v2473.Name and v2473.Name:lower() ] then return;end local v2477,v2478=pcall(v1428,v2475);if ( not v2477 or  not v2478) then return;end if  not v1417.originals[v2473] then v1417.originals[v2473]={text=v2475,color=v2473.TextColor3};v1429=v1429 + 1 ;end pcall(function() v2473.Text=v2474;if (Toggles.NC_Colors and Toggles.NC_Colors.Value and Options.NC_Color) then v2473.TextColor3=Options.NC_Color.Value;end end);end local function v1431(v2479) if  not v2479.Parent then return true;end if (v1419 and v2479:IsDescendantOf(v1419)) then return true;end local v2480=v2479:FindFirstAncestor("teddyhubBoot");if v2480 then return true;end v2480=v2479:FindFirstAncestor("KeySystemUI");if v2480 then return true;end return false;end local function v1432(v2481) if ( not v2481:IsA("TextLabel") and  not v2481:IsA("TextButton")) then return;end if v1417.conns[v2481] then return;end if v1431(v2481) then return;end local v2482=v2481;v1417.conns[v2482]=v2482:GetPropertyChangedSignal("Text"):Connect(function() v1430(v2482);end);task.spawn(v1430,v2482);end local function v1433(v2484) local v2485=v1417.conns[v2484];if v2485 then v2485:Disconnect();v1417.conns[v2484]=nil;end end local function v1434() v1417.restoring=true;for v2976,v2977 in pairs(v1417.originals) do pcall(function() if v2976.Parent then v2976.Text=v2977.text;v2976.TextColor3=v2977.color;end end);end v1417.originals={};v1429=0;v1417.restoring=false;end local function v1435(v2488) if v1417.watches[v2488] then return;end v1417.watches[v2488]={added=v2488.DescendantAdded:Connect(v1432),removed=v2488.DescendantRemoving:Connect(v1433)};end local function v1436() for v2978,v2979 in pairs(v1417.watches) do pcall(function() v2979.added:Disconnect();end);pcall(function() v2979.removed:Disconnect();end);end v1417.watches={};end local function v1437(v2491) local v2492,v2493=pcall(function() return v2491:GetDescendants();end);if  not v2492 then return;end for v2980,v2981 in ipairs(v2493) do v1432(v2981);end end local function v1438() local v2494={workspace};if Toggles.NC_ScopeGui.Value then pcall(function() if gethui then local v3620=gethui();if v3620 then table.insert(v2494,v3620);end end end);pcall(function() local v3451=game:GetService("CoreGui");if v3451 then table.insert(v2494,v3451);end end);if v1418 then table.insert(v2494,v1418);end end return v2494;end local function v1439() if  not Toggles.NC_On.Value then return;end for v2982 in pairs(v1417.conns) do task.spawn(v1430,v2982);end end local v1440=(v400.miscL2 and v400.miscL2:AddTab("name changer")) or v402.Misc:AddLeftGroupbox("name changer") ;local v1441;local function v1442() if ( not v1441 or  not v1441.SetText) then return;end if  not Toggles.NC_On.Value then v1441:SetText("off");return;end v1441:SetText("on - "   .. v1429   .. " replaced" );end v1440:AddToggle("NC_On",{Text="enable",Default=false,Tooltip="Rewrite player names in game UI",Callback=function(v2495) v1422();v1426();v1425();v1426();if v2495 then v1436();for v3452,v3453 in ipairs(v1438()) do v1435(v3453);v1437(v3453);end v1439();else v1434();v1436();end v1442();end});v1440:AddInput("NC_Spoof",{Text="replacement",Default="teddyhub",Finished=false,Placeholder="spoof text",Callback=function() if Toggles.NC_On.Value then v1434();v1426();for v3454,v3455 in ipairs(v1438()) do v1437(v3455);end v1439();end v1442();end});v1440:AddDropdown("NC_Match",{Text="targets",Default="both",Values={"players","friends","both"},Callback=function() v1426();v1439();end});v1440:AddDropdown("NC_Mode",{Text="match",Default="contains",Values={"contains","wholeword","exact"},Callback=function() if Toggles.NC_On.Value then v1439();end end});v1440:AddToggle("NC_Self",{Text="include self",Default=false,Callback=function() v1426();v1439();end});v1440:AddToggle("NC_Display",{Text="include displaynames",Default=true,Callback=function() v1426();v1439();end});v1440:AddToggle("NC_Case",{Text="case sensitive",Default=false,Callback=function() if Toggles.NC_On.Value then v1439();end end});v1440:AddToggle("NC_ScopeGui",{Text="scan CoreGui/PlayerGui",Default=true,Callback=function() v1436();if Toggles.NC_On.Value then for v3456,v3457 in ipairs(v1438()) do v1435(v3457);v1437(v3457);end v1439();end end});v1440:AddToggle("NC_Colors",{Text="recolor",Default=false,Callback=function() if Toggles.NC_On.Value then v1439();end end});v1440:AddLabel("color"):AddColorPicker("NC_Color",{Default=Color3.fromRGB(120,170,255),Callback=function() if Toggles.NC_On.Value then v1439();end end});v1440:AddInput("NC_Ignore",{Text="ignore names/labels",Default="",Finished=true,Placeholder="name1,name2",Callback=function() v1422();if Toggles.NC_On.Value then v1439();end end});v1440:AddSlider("NC_Refresh",{Text="friend refresh (s)",Default=30,Min=5,Max=300,Rounding=0});v1440:AddButton({Text="rescan now",Func=function() v1422();v1426();v1425();v1426();if Toggles.NC_On.Value then v1436();for v3458,v3459 in ipairs(v1438()) do v1435(v3459);v1437(v3459);end v1439();end v1442();end});v1441=v1440:AddLabel("off");local v1443=0;local v1444= #v7:GetPlayers();local v1445=v7.PlayerAdded:Connect(function(v2496) v1423(v2496.Name);if Toggles.NC_Display.Value then v1423(v2496.DisplayName);end if Toggles.NC_On.Value then v1439();end end);local v1446=v155.Heartbeat:Connect(function() if v152.Unloaded then return;end local v2497=tick();if ((v2497-v1443)>2) then v1443=v2497;v1442();end if  not Toggles.NC_On.Value then return;end local v2498= #v7:GetPlayers();if (v2498~=v1444) then v1444=v2498;v1426();v1439();end local v2499=tonumber(Options.NC_Refresh and Options.NC_Refresh.Value ) or 30 ;if ((v2497-(v1417._lastFriends or 0))>v2499) then v1417._lastFriends=v2497;task.spawn(function() v1425();v1426();v1439();end);end end);v143.NameChanger={cleanup=function() pcall(function() v1445:Disconnect();end);pcall(function() v1446:Disconnect();end);v1434();v1436();v1417.raw={};end};end v15("name changer",v430);local function v431() local v1448={conn=nil,hum=nil,dir=1,lastFlip=0};local function v1449() return v161.Character;end local function v1450() local v2501=v1449();return v2501 and v2501:FindFirstChildOfClass("Humanoid") ;end local function v1451() local v2502=v1449();return v2502 and v2502:FindFirstChild("HumanoidRootPart") ;end local function v1452(v2503) if  not v2503 then return;end local v2504=v2503.AssemblyLinearVelocity;if ((v2504.X~=0) or (v2504.Z~=0)) then v2503.AssemblyLinearVelocity=Vector3.new(0,v2504.Y,0);end end local function v1453() if v1448.conn then v1448.conn:Disconnect();v1448.conn=nil;end v1448.hum=nil;v1452(v1451());end local function v1454() v1453();v1448.hum=v1450();v1448.conn=v155.RenderStepped:Connect(function() if (v152.Unloaded or  not v165("AS_On")) then return;end local v2983=v1450();local v2984=v1451();if ( not v2983 or  not v2984 or (v2983.Health<=0)) then return;end if v2983.SeatPart then return;end local v2985=v2983.MoveDirection;if (v2985.Magnitude<0.05) then if v165("AS_InstantStop",true) then v1452(v2984);end return;end local v2986=Vector3.new(v2984.AssemblyLinearVelocity.X,0,v2984.AssemblyLinearVelocity.Z);local v2987=v2986.Magnitude;if (v2987<0.5) then v2983:Move(v2985,false);return;end local v2988=v2986.Unit;local v2989=v2988:Cross(v2985).Y;local v2990=math.clamp(v2988:Dot(v2985), -1,1);local v2991=math.atan2(v2989,v2990);local v2992=math.rad(Options.AS_Angle.Value);local v2993=Options.AS_Smooth.Value/100 ;local v2994=v2991-(v2992 * v1448.dir) ;if (v165("AS_Straighten",true) and (math.abs(v2991)<math.rad(6))) then v2994=v2991;end local v2995=(v2988 * math.cos(v2994)) + (v2988:Cross(Vector3.new(0,1,0)) * math.sin(v2994)) ;local v2996=v2985:Lerp(v2995.Unit,math.clamp(1 -v2993 ,0.05,1));v2983:Move(v2996,false);if (v165("AS_AutoFlip") and (v2987>Options.AS_MinSpeed.Value)) then local v3460=tick();if ((v3460-v1448.lastFlip)>Options.AS_FlipRate.Value) then v1448.lastFlip=v3460;v1448.dir= -v1448.dir;end end if (v165("AS_SpeedBoost") and (v2987<Options.AS_MaxSpeed.Value)) then local v3461=Options.AS_Boost.Value;local v3462=v2988 * math.min(v2987 + v3461 ,Options.AS_MaxSpeed.Value) ;v2984.AssemblyLinearVelocity=Vector3.new(v3462.X,v2984.AssemblyLinearVelocity.Y,v3462.Z);end end);end local v1455=v400.movR:AddTab("auto strafer");v1455:AddToggle("AS_On",{Text="enable",Default=false,Callback=function(v2508) if v2508 then v1454();else v1453();end end});v1455:AddToggle("AS_InstantStop",{Text="instant stop",Default=true});v1455:AddSlider("AS_Angle",{Text="strafe angle",Default=30,Min=1,Max=90,Rounding=0});v1455:AddSlider("AS_Smooth",{Text="smoothness",Default=40,Min=0,Max=95,Rounding=0});v1455:AddToggle("AS_Straighten",{Text="straighten on aim",Default=true});v1455:AddToggle("AS_AutoFlip",{Text="auto flip",Default=false});v1455:AddSlider("AS_FlipRate",{Text="flip rate (s)",Default=1.2,Min=0.2,Max=5,Rounding=1});v1455:AddSlider("AS_MinSpeed",{Text="flip above speed",Default=8,Min=0,Max=100,Rounding=0});v1455:AddToggle("AS_SpeedBoost",{Text="speed boost",Default=false});v1455:AddSlider("AS_Boost",{Text="boost / frame",Default=0.4,Min=0.05,Max=5,Rounding=2});v1455:AddSlider("AS_MaxSpeed",{Text="max speed",Default=40,Min=16,Max=500,Rounding=0});v161.CharacterAdded:Connect(function() task.wait(0.4);if v165("AS_On") then v1454();end end);v143.Strafer={cleanup=function() v1453();end};end v15("auto strafer",v431);local function v432() local v1457={red=Color3.fromRGB(255,45,45),orange=Color3.fromRGB(255,130,25),yellow=Color3.fromRGB(255,230,40),green=Color3.fromRGB(45,255,90),cyan=Color3.fromRGB(25,240,255),blue=Color3.fromRGB(45,100,255),purple=Color3.fromRGB(170,45,255),pink=Color3.fromRGB(255,65,190),white=Color3.fromRGB(255,255,255)};local v1458={"red","orange","yellow","green","cyan","blue","purple","pink","white"};local v1459=v143.EffectsGroup;v1459:AddDivider();v1459:AddToggle("FX_Wings",{Text="wings",Default=false});v1459:AddDropdown("FX_WingStyle",{Text="wing style",Default="angel",Values={"angel","demon","crystal","energy"}});v1459:AddDropdown("FX_WingColor",{Text="wing color",Default="white",Values=v1458});v1459:AddToggle("FX_WingAnim",{Text="flap",Default=true});v1459:AddSlider("FX_WingSize",{Text="wing size",Default=1,Min=0.5,Max=3,Rounding=1});v1459:AddSlider("FX_WingSpeed",{Text="flap speed",Default=3,Min=1,Max=10,Rounding=1});v1459:AddDivider();v1459:AddDropdown("FX_TrailStyle",{Text="trail style",Default="medium",Values={"short","medium","long","ghost"}});v1459:AddDropdown("FX_TrailColor",{Text="trail color",Default="cyan",Values=v1458});local v1460=game:GetService("Lighting");local v1461={Ambient=v1460.Ambient,OutdoorAmbient=v1460.OutdoorAmbient,Brightness=v1460.Brightness,ClockTime=v1460.ClockTime,FogColor=v1460.FogColor,FogStart=v1460.FogStart,FogEnd=v1460.FogEnd};local function v1462() for v2997,v2998 in pairs(v1461) do pcall(function() v1460[v2997]=v2998;end);end end local v1463={};local function v1464(v2509) local v2510=v1463[v2509];if (v2510 and v2510.obj) then pcall(function() v2510.obj:Destroy();end);end if (v2510 and v2510.parts) then for v3464,v3465 in ipairs(v2510.parts) do pcall(function() v3465:Destroy();end);end end v1463[v2509]=nil;end local function v1465() return v161.Character;end local function v1466() local v2512=v1465();return v2512 and (v2512:FindFirstChild("UpperTorso") or v2512:FindFirstChild("Torso")) ;end local function v1467() local v2513=v1465();return v2513 and v2513:FindFirstChild("HumanoidRootPart") ;end local function v1468() local v2514=v1466();local v2515=v1465();if ( not v2514 or  not v2515) then return;end local v2516=v1457[Options.FX_WingColor.Value] or v1457.white ;local v2517=Options.FX_WingStyle.Value;local v2518=Options.FX_WingSize.Value;local v2519=Instance.new("Folder");v2519.Name="teddyhubWings";v2519.Parent=v2515;local v2522={};for v2999= -1,1,2 do for v3236=1,8 do local v3237=Instance.new("Part");v3237.Material=Enum.Material.Neon;v3237.Color=v2516;v3237.Transparency=0.08;v3237.CanCollide=false;v3237.CanTouch=false;v3237.CanQuery=false;v3237.Massless=true;v3237.CastShadow=false;local v3247=(1.6 + (v3236 * 0.28)) * v2518 ;if (v2517=="angel") then v3237.Size=Vector3.new(0.3,v3247,0.18);elseif (v2517=="demon") then v3237.Size=Vector3.new(0.25,v3247 * 1.2 ,0.2);elseif (v2517=="crystal") then v3237.Size=Vector3.new(0.4,v3247,0.35);else v3237.Size=Vector3.new(0.18,v3247,0.15);end v3237.Parent=v2519;local v3249=Instance.new("SpecialMesh");v3249.MeshType=((v2517=="crystal") and Enum.MeshType.Brick) or Enum.MeshType.Sphere ;v3249.Parent=v3237;local v3252=Instance.new("Weld");v3252.Part0=v2514;v3252.Part1=v3237;local v3255=CFrame.new(v2999 * (0.45 + (v3236 * 0.35)) * v2518 ,0.3 -(v3236 * 0.1) ,(0.65 + (v3236 * 0.035)) * v2518 ) * CFrame.Angles(0,math.rad(v2999 * 10 ),math.rad(v2999 * (20 + (v3236 * 6)) )) ;v3252.C0=v3255;v3252.Parent=v3237;table.insert(v2522,{w=v3252,b=v3255,s=v2999});end end v1463.wings={obj=v2519,feathers=v2522,char=v2515};end local function v1469() local v2524=v1467();if  not v2524 then return;end local v2525=v1457[Options.FX_AuraColor.Value] or v1457.orange ;local v2526=Options.FX_AuraStyle.Value;local v2527=Instance.new("Attachment");v2527.Name="teddyhubAura";v2527.Parent=v2524;local v2530=Instance.new("ParticleEmitter");v2530.Color=ColorSequence.new(v2525);v2530.LightEmission=1;v2530.Rate=Options.FX_AuraRate.Value;v2530.Lifetime=NumberRange.new(0.5,1.5);v2530.Speed=NumberRange.new(1,4);v2530.SpreadAngle=Vector2.new(360,360);v2530.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.25),NumberSequenceKeypoint.new(0.5,0.6),NumberSequenceKeypoint.new(1,0)});if (v2526=="fire") then v2530.Acceleration=Vector3.new(0,8,0);v2530.Rate=math.max(v2530.Rate,55);elseif (v2526=="smoke") then v2530.Acceleration=Vector3.new(0,2,0);v2530.Speed=NumberRange.new(0.5,1.5);elseif (v2526=="energy") then v2530.Speed=NumberRange.new(4,8);elseif (v2526=="magic") then v2530.Rotation=NumberRange.new(0,360);v2530.RotSpeed=NumberRange.new( -180,180);elseif (v2526=="spark") then v2530.Lifetime=NumberRange.new(0.1,0.4);v2530.Speed=NumberRange.new(5,12);v2530.Size=NumberSequence.new(0.15);elseif (v2526=="floating") then v2530.Acceleration=Vector3.new(0,5,0);v2530.Speed=NumberRange.new(0,1);end v2530.Parent=v2527;v1463.aura={obj=v2527,em=v2530,char=v1465()};end local function v1470() local v2541=v1467();if  not v2541 then return;end local v2542={short={0.2,1},medium={0.5,2},long={1,3},ghost={1.5,1.5}};local v2543=v2542[Options.FX_TrailStyle.Value] or v2542.medium ;local v2544=v1457[Options.FX_TrailColor.Value] or v1457.cyan ;local v2545=Instance.new("Folder");v2545.Name="teddyhubTrail";v2545.Parent=v1465();local v2548=Instance.new("Attachment");v2548.Position=Vector3.new(0,v2543[2],0);v2548.Parent=v2541;local v2551=Instance.new("Attachment");v2551.Position=Vector3.new(0, -v2543[2],0);v2551.Parent=v2541;local v2554=Instance.new("Trail");v2554.Attachment0=v2548;v2554.Attachment1=v2551;v2554.Color=ColorSequence.new(v2544);v2554.Lifetime=v2543[1];v2554.LightEmission=1;v2554.FaceCamera=true;v2554.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)});v2554.Parent=v2541;v1463.trail={obj=v2545,parts={v2548,v2551,v2554},char=v1465()};v2545.Parent=v1465();end local function v1471() v1462();local v2565=v1457[Options.FX_WorldColor.Value] or v1457.blue ;local v2566=Options.FX_WorldStyle.Value;v1460.Ambient=v2565;v1460.OutdoorAmbient=v2565;if (v2566=="bright") then v1460.Brightness=3;v1460.ClockTime=14;v1460.FogEnd=100000;elseif (v2566=="dark") then v1460.Brightness=0.5;v1460.ClockTime=0;v1460.FogEnd=500;elseif (v2566=="foggy") then v1460.Brightness=1;v1460.FogColor=v2565;v1460.FogStart=10;v1460.FogEnd=100;elseif (v2566=="neon") then v1460.Brightness=2;v1460.ClockTime=0;elseif (v2566=="sunset") then v1460.Brightness=2;v1460.ClockTime=18;elseif (v2566=="dream") then v1460.Brightness=2.5;v1460.ClockTime=12;v1460.FogColor=v2565;v1460.FogEnd=300;end end for v2569,v2570 in ipairs({"FX_WingStyle","FX_WingColor","FX_WingSize"}) do Options[v2570]:OnChanged(function() v1464("wings");if Toggles.FX_Wings.Value then v1468();end end);end for v2571,v2572 in ipairs({"FX_AuraStyle","FX_AuraColor","FX_AuraRate"}) do Options[v2572]:OnChanged(function() v1464("aura");end);end for v2573,v2574 in ipairs({"FX_TrailStyle","FX_TrailColor"}) do Options[v2574]:OnChanged(function() v1464("trail");end);end local v1472;local v1473=0;local v1474=v155.Heartbeat:Connect(function(v2575) if v152.Unloaded then return;end local v2576=v1465();if Toggles.FX_Wings.Value then if ( not v1463.wings or (v1463.wings.char~=v2576)) then v1464("wings");v1468();end if v1463.wings then if Toggles.FX_WingAnim.Value then local v3656=tick() * Options.FX_WingSpeed.Value * 1.5 ;local v3657=math.rad(22);for v3680,v3681 in ipairs(v1463.wings.feathers) do if v3681.w.Parent then local v3728=math.sin(v3656) * v3657 ;v3681.w.C0=v3681.b * CFrame.Angles(0,v3728 * v3681.s ,0) ;end end else for v3682,v3683 in ipairs(v1463.wings.feathers) do if v3683.w.Parent then v3683.w.C0=v3683.b;end end end end elseif v1463.wings then v1464("wings");end if Toggles.FX_Aura.Value then if ( not v1463.aura or (v1463.aura.char~=v2576)) then v1464("aura");v1469();end elseif v1463.aura then v1464("aura");end if Toggles.FX_Trail.Value then if ( not v1463.trail or (v1463.trail.char~=v2576)) then v1464("trail");v1470();end elseif v1463.trail then v1464("trail");end local v2577=(Toggles.FX_World.Value and (Options.FX_WorldStyle.Value   .. Options.FX_WorldColor.Value)) or nil ;if (v2577~=v1472) then v1472=v2577;if v2577 then v1471();else v1462();end end end);v143.VFX={cleanup=function() if v1474 then v1474:Disconnect();end v1464("wings");v1464("aura");v1464("trail");v1462();end};end v15("visual fx",v432);local function v433() local v1476=v400.miscL2:AddTab("smooth cam");v1476:AddToggle("SC_On",{Text="enable",Default=false});v1476:AddSlider("SC_Pos",{Text="position",Default=40,Min=0,Max=95,Rounding=0});v1476:AddSlider("SC_Rot",{Text="rotation",Default=50,Min=0,Max=95,Rounding=0});v1476:AddSlider("SC_Fov",{Text="fov",Default=60,Min=0,Max=95,Rounding=0});v1476:AddSlider("SC_Damp",{Text="damping",Default=0,Min=0,Max=100,Rounding=0});v1476:AddToggle("SC_Lock",{Text="freeze y",Default=false});v1476:AddSlider("SC_Dist",{Text="distance (0 = first person)",Default=8,Min=0,Max=30,Rounding=1});v1476:AddButton({Text="reset",Func=function() Options.SC_Pos:SetValue(40);Options.SC_Rot:SetValue(50);Options.SC_Fov:SetValue(60);Options.SC_Damp:SetValue(0);Toggles.SC_Lock:SetValue(false);end});local v1477="teddyhubSmoothCam";local v1478=game:GetService("UserInputService");local v1479,v1480,v1481,v1482,v1483,v1484;local v1485=false;local v1486=nil;local function v1487() if v152.Unloaded then return;end local v2578=workspace.CurrentCamera;local v2579=v161.Character;local v2580=v2579 and v2579:FindFirstChild("Head") ;if ( not Toggles.SC_On.Value or  not v2580) then MouseAcc.x=0;MouseAcc.y=0;if v1485 then v1485=false;v2578.CameraType=Enum.CameraType.Custom;game:GetService("UserInputService").MouseBehavior=Enum.MouseBehavior.Default;if v2579 then for v3684,v3685 in ipairs(v2579:GetDescendants()) do if v3685:IsA("BasePart") then v3685.LocalTransparencyModifier=0;end end end end return;end if  not v1485 then v1485=true;pcall(function() Toggles.TP_On:SetValue(false);end);local v3265=v2578.CFrame.LookVector;v1479=math.atan2( -v3265.X, -v3265.Z);v1480=math.asin(math.clamp(v3265.Y, -1,1));v1481,v1482,v1483,v1484=v1479,v1480,v2580.Position,v2578.FieldOfView;end local v2581=v14();game:GetService("UserInputService").MouseBehavior=Enum.MouseBehavior.LockCenter;v1479=v1479-(v2581.X * 0.005) ;v1480=math.clamp(v1480-(v2581.Y * 0.005) , -1.4,1.4);local v2584=1 -(Options.SC_Damp.Value/100) ;local v2585=math.clamp((1 -(Options.SC_Rot.Value/100)) * v2584 ,0.02,1);local v2586=math.clamp((1 -(Options.SC_Pos.Value/100)) * v2584 ,0.02,1);local v2587=math.clamp((1 -(Options.SC_Fov.Value/100)) * v2584 ,0.02,1);v1481=v1481 + ((v1479-v1481) * v2585) ;v1482=v1482 + ((v1480-v1482) * v2585) ;v1483=v1483:Lerp(v2580.Position,v2586);if Toggles.SC_Lock.Value then v1483=Vector3.new(v1483.X,v2580.Position.Y,v1483.Z);end v1484=v1484 + ((v2578.FieldOfView-v1484) * v2587) ;v2578.CameraType=Enum.CameraType.Scriptable;local v2590=Vector3.new( -math.sin(v1481) * math.cos(v1482) ,math.sin(v1482), -math.cos(v1481) * math.cos(v1482) );local v2591=Options.SC_Dist.Value;local v2592=v1483-(v2590 * v2591) ;local v2593=v2591<0.5 ;if (v2579 and (v2593~=v1486)) then v1486=v2593;for v3466,v3467 in ipairs(v2579:GetDescendants()) do if v3467:IsA("BasePart") then v3467.LocalTransparencyModifier=(v2593 and 1) or 0 ;end end end v2578.CFrame=CFrame.lookAt(v2592,v1483);v2578.FieldOfView=v1484;v2578:SetAttribute("teddyhubSmoothYaw",v1481);if (v267.enabled and v267.apply) then v267.apply();end end v155:BindToRenderStep(v1477,Enum.RenderPriority.Camera.Value + 1 ,v1487);v143.SmoothCam={cleanup=function() pcall(function() v155:UnbindFromRenderStep(v1477);end);pcall(function() workspace.CurrentCamera.CameraType=Enum.CameraType.Custom;end);end};end v15("smooth cam",v433);local function v434() local v1489=v400.miscR:AddTab("3rd person");v1489:AddToggle("TP_On",{Text="enable",Default=false});v1489:AddSlider("TP_Dist",{Text="distance",Default=10,Min=2,Max=40,Rounding=1});v1489:AddSlider("TP_Height",{Text="height",Default=2,Min= -5,Max=12,Rounding=1});v1489:AddSlider("TP_Shoulder",{Text="shoulder",Default=1.5,Min= -6,Max=6,Rounding=1});v1489:AddSlider("TP_Fov",{Text="fov",Default=70,Min=30,Max=120,Rounding=0});v1489:AddSlider("TP_Smooth",{Text="smooth",Default=30,Min=0,Max=95,Rounding=0});v1489:AddToggle("TP_Collide",{Text="wall check",Default=true});v1489:AddToggle("TP_Hide",{Text="hide head",Default=false});v1489:AddButton({Text="reset",Func=function() Options.TP_Dist:SetValue(10);Options.TP_Height:SetValue(2);Options.TP_Shoulder:SetValue(1.5);Options.TP_Fov:SetValue(70);Options.TP_Smooth:SetValue(30);end});Toggles.TP_On:AddKeyPicker("TP_Key",{Default="None",Mode="Toggle",SyncToggleState=true,Text="thirdperson"});local v1490="teddyhubThirdPerson";local v1491;local v1492,v1493=0,0.25;local v1494=false;local v1495=game:GetService("UserInputService");local v1496=nil;local v1497=RaycastParams.new();v1497.FilterType=Enum.RaycastFilterType.Exclude;local function v1500() if v152.Unloaded then return;end local v2596=workspace.CurrentCamera;local v2597=v161.Character;local v2598=v2597 and v2597:FindFirstChild("HumanoidRootPart") ;local v2599=v2597 and v2597:FindFirstChild("Head") ;if ( not Toggles.TP_On.Value or  not v2598 or  not v2599) then if v1494 then game:GetService("UserInputService").MouseBehavior=Enum.MouseBehavior.Default;end v1491=nil;v1494=false;v1496=nil;MouseAcc.x=0;MouseAcc.y=0;return;end if  not v1494 then v1494=true;local v3270=v2596.CFrame.LookVector;v1492=math.atan2( -v3270.X, -v3270.Z);v1493=math.asin(math.clamp(v3270.Y, -1,1)) *  -1 ;end local v2600=v14();game:GetService("UserInputService").MouseBehavior=Enum.MouseBehavior.LockCenter;v1492=v1492-(v2600.X * 0.005) ;v1493=math.clamp(v1493 + (v2600.Y * 0.005) , -1.2,1.2);v2596.CameraType=Enum.CameraType.Scriptable;local v2605=v2599.Position + Vector3.new(0,Options.TP_Height.Value * 0.5 ,0) ;local v2606=Vector3.new(math.sin(v1492) * math.cos(v1493) ,math.sin(v1493),math.cos(v1492) * math.cos(v1493) );local v2607=Vector3.new(math.cos(v1492),0, -math.sin(v1492));local v2608=v2605 + (v2606 * Options.TP_Dist.Value) + (v2607 * Options.TP_Shoulder.Value) + Vector3.new(0,Options.TP_Height.Value,0) ;if Toggles.TP_Collide.Value then v1497.FilterDescendantsInstances={v2597};local v3272=workspace:Raycast(v2605,v2608-v2605 ,v1497);if v3272 then v2608=v3272.Position + ((v2605-v2608).Unit * 0.5) ;end end if  not v1491 then v1491=v2608;end local v2609=math.clamp(1 -(Options.TP_Smooth.Value/100) ,0.02,1);v1491=v1491:Lerp(v2608,v2609);local v2610,v2611=pcall(function() return v2596:GetAttribute("teddyhubAimAt");end);if ( not v2610 or (typeof(v2611)~="Vector3")) then v2611=nil;end if v2611 then local v3273=pcall(function() local v3468=v2611-v2605 ;if (v3468.Magnitude>0.01) then local v3624=v3468.Unit;v1492=math.atan2( -v3624.X, -v3624.Z);v1493=math.asin(math.clamp( -v3624.Y, -1,1));local v3625=Vector3.new(math.sin(v1492) * math.cos(v1493) ,math.sin(v1493),math.cos(v1492) * math.cos(v1493) );local v3626=Vector3.new(math.cos(v1492),0, -math.sin(v1492));local v3627=v2605 + (v3625 * Options.TP_Dist.Value) + (v3626 * Options.TP_Shoulder.Value) + Vector3.new(0,Options.TP_Height.Value,0) ;v1491=v3627;end v2596.CFrame=CFrame.lookAt(v1491,v2611);end);if  not v3273 then v2596.CFrame=CFrame.lookAt(v1491,v2605);end else v2596.CFrame=CFrame.lookAt(v1491,v2605);end v2596.FieldOfView=Options.TP_Fov.Value;v2596:SetAttribute("teddyhubThirdYaw",v1492);if (v267.enabled and v267.apply) then v267.apply();end local v2614=Toggles.TP_Hide.Value;if (v2614~=v1496) then v1496=v2614;if v2599 then v2599.LocalTransparencyModifier=(v2614 and 1) or 0 ;end end end v155:BindToRenderStep(v1490,Enum.RenderPriority.Camera.Value + 2 ,v1500);v143.ThirdPerson={cleanup=function() pcall(function() v155:UnbindFromRenderStep(v1490);end);local v2615=workspace.CurrentCamera;if v2615 then v2615.CameraType=Enum.CameraType.Custom;end end};end v15("third person",v434);local function v435() local v1502=Instance.new("ScreenGui");v1502.Name="teddyhubKeybinds";v1502.ResetOnSpawn=false;v1502.DisplayOrder=250;v1502.IgnoreGuiInset=true;pcall(function() v1502.Parent=game:GetService("CoreGui");end);if  not v1502.Parent then v1502.Parent=v163;end local v1507=Instance.new("Frame");v1507.Name="Panel";v1507.Size=UDim2.fromOffset(170,0);v1507.AutomaticSize=Enum.AutomaticSize.Y;v1507.Position=UDim2.new(0,8,0.4,0);v1507.BackgroundColor3=v152.MainColor;v1507.BorderSizePixel=0;v1507.Parent=v1502;local v1517=Instance.new("UIScale");v1517.Parent=v1507;local v1519=Instance.new("UIStroke");v1519.Color=v152.OutlineColor;v1519.Thickness=1;v1519.Parent=v1507;local v1524=Instance.new("Frame");v1524.Name="Strip";v1524.Size=UDim2.new(1,0,0,2);v1524.BorderSizePixel=0;v1524.BackgroundColor3=v152.AccentColor;v1524.ZIndex=5;v1524.Parent=v1507;local v1532=Instance.new("UIListLayout");v1532.SortOrder=Enum.SortOrder.LayoutOrder;v1532.Padding=UDim.new(0,2);v1532.Parent=v1507;local v1537=Instance.new("UIPadding");v1537.PaddingTop=UDim.new(0,7);v1537.PaddingBottom=UDim.new(0,6);v1537.PaddingLeft=UDim.new(0,8);v1537.PaddingRight=UDim.new(0,8);v1537.Parent=v1507;local function v1543(v2617) v2617.BackgroundTransparency=1;v2617.Font=Enum.Font.Code;v2617.TextXAlignment=Enum.TextXAlignment.Left;local v2623=Instance.new("UIStroke");v2623.Color=Color3.new(0,0,0);v2623.Thickness=1;v2623.LineJoinMode=Enum.LineJoinMode.Miter;v2623.Parent=v2617;return v2617;end local v1544=v1543(Instance.new("TextLabel"));v1544.Name="Header";v1544.LayoutOrder=0;v1544.Size=UDim2.new(1,0,0,16);v1544.Text="keybinds";v1544.Parent=v1507;local v1550={};local function v1551(v2629) if  not v1550[v2629] then local v3277=v1543(Instance.new("TextLabel"));v3277.LayoutOrder=v2629;v3277.Size=UDim2.new(1,0,0,16);v3277.Visible=false;v3277.Parent=v1507;v1550[v2629]=v3277;end return v1550[v2629];end local function v1552() local v2630={};for v3003,v3004 in pairs(Options) do if ((type(v3003)=="string") and ((v3003=="MenuKeybind") or (v3003:sub( -4)=="_Key"))) then local v3470=v3004.Value;if ((type(v3470)=="string") and (v3470~="") and (v3470~="None")) then local v3628,v3629;if (v3003=="MenuKeybind") then v3628,v3629="Menu",true;else v3628=v3003:sub(1, -5);local v3686=Toggles[v3628];v3629=v3686 and (v3686.Value==true) ;end table.insert(v2630,{name=v3628,key=v3470,on=v3629});end end end table.sort(v2630,function(v3005,v3006) return v3005.name<v3006.name ;end);return v2630;end local v1553=0;local v1554=v155.Heartbeat:Connect(function(v2631) if v152.Unloaded then return;end v1553=v1553 + v2631 ;if (v1553<0.15) then return;end v1553=0;local v2632=Toggles.KL_Enable.Value;v1507.Visible=v2632;if  not v2632 then return;end v1507.Position=UDim2.fromScale(Options.KL_X.Value/100 ,Options.KL_Y.Value/100 );v1517.Scale=Options.KL_Scale.Value/100 ;v1507.BackgroundTransparency=Options.KL_Trans.Value/100 ;v1524.BackgroundColor3=v152.AccentColor;v1544.Visible=Toggles.KL_Title.Value;v1544.TextSize=Options.KL_Size.Value;v1544.TextColor3=v152.AccentColor;local v2644=v1552();local v2645=0;for v3007,v3008 in ipairs(v2644) do if (Toggles.KL_ShowOff.Value or v3008.on) then v2645=v2645 + 1 ;local v3471=v1551(v2645 + 1 );v3471.Visible=true;v3471.TextSize=Options.KL_Size.Value;v3471.Text=v3008.name   .. "  ["   .. v3008.key   .. "]" ;v3471.TextColor3=(v3008.on and v152.AccentColor) or v152.FontColor ;end end for v3009=v2645 + 2 , #v1550 do v1550[v3009].Visible=false;end v1507.Visible=v2645>0 ;end);v143.KeyList.cleanup=function() if v1554 then v1554:Disconnect();end pcall(function() v1502:Destroy();end);end;end v15("keybind list",v435);local function v436() local v1556=v400.setR:AddTab("keybinds");v1556:AddToggle("KL_Enable",{Text="enable",Default=true});v1556:AddToggle("KL_ShowOff",{Text="show off",Default=true});v1556:AddToggle("KL_Title",{Text="title",Default=true});v1556:AddDivider();v1556:AddSlider("KL_X",{Text="x",Default=0,Min=0,Max=100,Rounding=0});v1556:AddSlider("KL_Y",{Text="y",Default=40,Min=0,Max=100,Rounding=0});v1556:AddSlider("KL_Scale",{Text="scale",Default=100,Min=50,Max=200,Rounding=0});v1556:AddSlider("KL_Trans",{Text="transparency",Default=10,Min=0,Max=100,Rounding=0});v1556:AddSlider("KL_Size",{Text="text size",Default=13,Min=10,Max=20,Rounding=0});end v152:OnUnload(function() v152.Unloaded=true;if v143.KeyList.cleanup then pcall(v143.KeyList.cleanup);end if (v143.Hitbox and v143.Hitbox.cleanup) then pcall(v143.Hitbox.cleanup);end if v143.SelfFX.cleanup then pcall(v143.SelfFX.cleanup);end if v143.SearchUI.cleanup then pcall(v143.SearchUI.cleanup);end if v143.Extra.cleanup then pcall(v143.Extra.cleanup);end if v143.CustomHUD.cleanup then pcall(v143.CustomHUD.cleanup);end if v143.MiscExtras.cleanup then pcall(v143.MiscExtras.cleanup);end if v143.NameChanger.cleanup then pcall(v143.NameChanger.cleanup);end if v143.Strafer.cleanup then pcall(v143.Strafer.cleanup);end if (v143.SmoothCam and v143.SmoothCam.cleanup) then pcall(v143.SmoothCam.cleanup);end if (v143.VFX and v143.VFX.cleanup) then pcall(v143.VFX.cleanup);end if (v143.ThirdPerson and v143.ThirdPerson.cleanup) then pcall(v143.ThirdPerson.cleanup);end if v413 then v413:Disconnect();v413=nil;end if v311 then v311:Disconnect();v311=nil;end pcall(function() if v421.autoConn then v421.autoConn:Disconnect();end if v421.sound then v421.sound:Stop();v421.sound:Destroy();end if v421._vizGui then v421._vizGui:Destroy();end end);v238=false;pcall(function() v250:Remove();end);v261.enabled=false;v275.master=false;for v2646,v2647 in pairs(v292.players) do for v3011,v3012 in ipairs(v2647.connections) do pcall(v3012.Disconnect,v3012);end for v3013,v3014 in ipairs(v2647.drawings) do pcall(v3014.Remove,v3014);end end v292.players={};v293.Visible=false;pcall(v298);v264=false;v267.enabled=false;v270.enabled=false;v270.rotOwned=false;v305=false;v312();v307=false;v313();if v309 then v314(false);end v358.Enabled=false;v364.Visible=false;pcall(v371,false);pcall(function() v361:Destroy();end);v315=false;v158.Brightness=v319;for v2648,v2649 in ipairs(v325) do if v2649.Active then v2649.Active=false;v2649.Part.CFrame=CFrame.new(0, -1000,0);end end pcall(function() v322:Destroy();end);v225=false;pcall(function() v169.gui:Destroy();end);v327=false;if (v340 and v161.Character) then v345(v161.Character);end v335=false;v372.FreezeTime=false;v354=false;v355=false;if v348 then v348.Enabled=false;end if v351 then v351.Enabled=false;end v158.Ambient=v409;v158.OutdoorAmbient=v410;local v1571=v158:FindFirstChild("teddyhubCustomSky");if v1571 then v1571:Destroy();end v416();local v1572=v161.Character and v161.Character:FindFirstChildOfClass("Humanoid") ;if v1572 then v1572.AutoRotate=true;end v378:Destroy();v379:Destroy();v380:Destroy();v158.ExposureCompensation=v375.Exposure;v158.FogStart=v375.FogStart;v158.FogEnd=v375.FogEnd;v158.FogColor=v375.FogColor;local v1581=workspace.CurrentCamera;if v1581 then v1581.FieldOfView=v375.Fov;end end);if v12 then pcall(v12.finish);else pcall(function() v152.RevealMenu();end);end end;local v17=v7.LocalPlayer or v7:GetPropertyChangedSignal("LocalPlayer"):Wait() ;local v18=v17:WaitForChild("PlayerGui");local v19=Color3.fromRGB(255,255,255);local v20=Color3.fromRGB(28,28,28);local v21=Color3.fromRGB(20,20,20);local v22=Color3.fromRGB(0,85,255);local v23=Color3.fromRGB(50,50,50);local v24=Color3.fromRGB(255,50,50);local v25=Color3.new(0,0,0);local v26=Enum.Font.Code;local v27=16;local v28="[KeySystem] ";local v29="none";local function v30(v437) v29=v437;print(v28   .. "built: "   .. v437 );end local function v31() local v438,v439=pcall(function() return game:HttpGet(v10);end);if ( not v438 or (type(v439)~="string")) then return nil,"Could not reach the key server.";end local v440={};for v1582 in v439:gmatch("[^\r\n]+") do local v1583=v1582:match("^%s*(.-)%s*$");if (v1583 and ( #v1583>0) and (v1583:sub(1,1)~="#")) then table.insert(v440,v1583);end end if ( #v440==0) then return nil,"The key list came back empty.";end return v440;end local function v32(v441,v442) for v1584,v1585 in ipairs(v442) do if (v441==v1585) then return true;end end return false;end local v33="^[%a][%w]*%-[%w]+%-[%w]+$";local function v34(v443) v443.TextStrokeTransparency=1;local v445=Instance.new("UIStroke");v445.Color=v25;v445.Thickness=1;v445.LineJoinMode=Enum.LineJoinMode.Miter;v445.Transparency=0;v445.Parent=v443;return v445;end local function v35(v452) local v453=Instance.new("TextLabel");v453.BackgroundTransparency=1;v453.Font=v26;v453.TextColor3=v19;v453.TextSize=v27;v34(v453);for v1586,v1587 in pairs(v452) do v453[v1586]=v1587;end return v453;end local function v36(v458,v459) local v460=Instance.new(v458);v460.BorderSizePixel=1;v460.BorderColor3=v23;for v1589,v1590 in pairs(v459) do v460[v1589]=v1590;end return v460;end local function v37(v463,v464) v463.Active=true;local v466=false;local v467=Vector2.zero;local v468=UDim2.new();local v469=nil;local function v470() v466=false;if v469 then v469:Disconnect();v469=nil;end end v463.InputBegan:Connect(function(v1592) local v1593=v1592.UserInputType;if ((v1593~=Enum.UserInputType.MouseButton1) and (v1593~=Enum.UserInputType.Touch)) then return;end v466=true;v467=v1592.Position;v468=v463.Position;v469=v1592.Changed:Connect(function() if (v1592.State==Enum.UserInputState.End) then v470();end end);end);v463.InputChanged:Connect(function(v1596) if  not v466 then return;end local v1597=v1596.UserInputType;if ((v1597~=Enum.UserInputType.MouseMovement) and (v1597~=Enum.UserInputType.Touch)) then return;end local v1598=v1596.Position-v467 ;local v1599=workspace.CurrentCamera.ViewportSize;v463.Position=UDim2.new(v468.X.Scale,math.clamp(v468.X.Offset + v1598.X , -v464,v1599.X-v464 ),v468.Y.Scale,math.clamp(v468.Y.Offset + v1598.Y , -v464,v1599.Y-v464 ));end);v463.InputEnded:Connect(v470);end task.spawn(function() if (readfile and isfile and isfile(v11)) then local v2650=readfile(v11):match("^%s*(.-)%s*$");if (v2650 and ( #v2650>0)) then print(v28   .. "Checking Saved Key" );local v3285,v3286=v31();if  not v3285 then print(v28   .. "Saved Key check failed: "   .. tostring(v3286) );elseif v32(v2650,v3285) then print(v28   .. "Saved Key has passed" );v15("main script",v16);return;else print(v28   .. "Saved Key has failed" );if delfile then delfile(v11);end end end end local function v471() local v1601=Instance.new("ScreenGui");v1601.Name="KeySystemUI";v1601.Parent=v18;v1601.ResetOnSpawn=false;v1601.IgnoreGuiInset=true;v1601.DisplayOrder=500;v1601.ZIndexBehavior=Enum.ZIndexBehavior.Global;v30("ScreenGui");local v1609,v1610=420,300;local v1611=v36("Frame",{Name="Outer",BackgroundColor3=v25,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(v1609,v1610),ZIndex=1,Parent=v1601});v37(v1611,60);v30("Outer");local v1612=v36("Frame",{Name="Inner",BackgroundColor3=v20,BorderColor3=v22,BorderMode=Enum.BorderMode.Inset,Position=UDim2.fromOffset(1,1),Size=UDim2.new(1, -2,1, -2),ZIndex=2,Parent=v1611});v30("Inner");local v1613=v35({Name="Title",Position=UDim2.fromOffset(7,0),Size=UDim2.new(1, -40,0,25),Text="key system",TextXAlignment=Enum.TextXAlignment.Left,ZIndex=3,Parent=v1612});v30("Title");local v1614=v36("TextButton",{Name="Close",Font=v26,TextColor3=v19,TextSize=v27,AutoButtonColor=false,Active=true,AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1, -6,0,4),Size=UDim2.fromOffset(16,16),Text="x",ZIndex=4,Parent=v1612});v34(v1614);v30("CloseButton");local v1615=v36("Frame",{Name="MainSectionOuter",BackgroundColor3=v21,BorderColor3=v23,Position=UDim2.fromOffset(8,25),Size=UDim2.new(1, -16,1, -33),ZIndex=3,Parent=v1612});local v1616=v36("Frame",{Name="MainSectionInner",BackgroundColor3=v21,BorderColor3=v25,BorderMode=Enum.BorderMode.Inset,Position=UDim2.fromOffset(0,0),Size=UDim2.new(1,0,1,0),ZIndex=4,Parent=v1615});v30("MainSection");local v1617=v36("Frame",{Name="GroupboxOuter",BackgroundColor3=v20,BorderColor3=v23,Position=UDim2.fromOffset(6,6),Size=UDim2.new(1, -12,1, -12),ZIndex=5,Parent=v1616});local v1618=v36("Frame",{Name="GroupboxInner",BackgroundColor3=v20,BorderColor3=v25,BorderMode=Enum.BorderMode.Inset,Position=UDim2.fromOffset(0,0),Size=UDim2.new(1,0,1,0),ZIndex=6,Parent=v1617});v30("Groupbox");v35({Name="GroupboxLabel",Position=UDim2.fromOffset(8,4),Size=UDim2.new(1, -16,0,18),Text="authentication",TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7,Parent=v1618});v30("GroupboxLabel");local v1619=20;v35({Name="KeyLabel",Position=UDim2.fromOffset(v1619,30),Size=UDim2.new(1, -v1619 * 2 ,0,16),Text="key",TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7,Parent=v1618});v30("KeyLabel");local v1620=v36("Frame",{Name="KeyInputShell",BackgroundColor3=v21,BorderColor3=v23,Position=UDim2.fromOffset(v1619,50),Size=UDim2.new(1, -v1619 * 2 ,0,26),ZIndex=7,Parent=v1618});local v1621=v36("TextBox",{Name="KeyInput",BackgroundColor3=v21,BackgroundTransparency=1,BorderSizePixel=0,Font=v26,TextColor3=v19,TextSize=v27,Text="",PlaceholderText="teddyhub-xxxx-xxxx",PlaceholderColor3=v23,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,Size=UDim2.new(1, -10,1,0),Position=UDim2.fromOffset(4,0),ZIndex=8,Parent=v1620});v30("KeyInput");local v1622=v35({Name="Status",Position=UDim2.fromOffset(v1619,84),Size=UDim2.new(1, -v1619 * 2 ,0,16),Text="",TextXAlignment=Enum.TextXAlignment.Left,ZIndex=7,Parent=v1618});v30("Status");local v1623=v36("TextButton",{Name="SubmitButton",BackgroundColor3=v21,BorderColor3=v23,Position=UDim2.fromOffset(v1619,108),Size=UDim2.new(1, -v1619 * 2 ,0,28),Text="check key",TextColor3=v19,TextSize=v27,Font=v26,AutoButtonColor=false,ZIndex=7,Parent=v1618});v34(v1623);v30("SubmitButton");local v1624=false;local function v1625(v2651,v2652) v1622.Text=v2651;v1622.TextColor3=v2652 or v19 ;end local function v1626(v2655) v8:Create(v1620,TweenInfo.new(0.15),{BorderColor3=v2655}):Play();end local function v1627(v2656,v2657) v1623.Text=v2657;v8:Create(v1623,TweenInfo.new(0.15),{BackgroundColor3=v2656}):Play();end local function v1628(v2659) v1624=true;v1625("Key passed.",v22);v1626(v22);v1627(v22,"Welcome");if writefile then writefile(v11,v2659);end print(v28   .. "Key has passed" );task.wait(1);v1601:Destroy();v15("main script",v16);end local function v1629(v2660) v1624=true;v1625(v2660,v24);v1626(v24);v1627(v24,"Wrong Key");task.wait(1.5);v1626(v23);v1627(v21,"Check Key");v1624=false;end local function v1630() if v1624 then return;end local v2661=v1621.Text:match("^%s*(.-)%s*$");if ( not v2661 or ( #v2661==0)) then v1629("Enter a key first.");return;end if  not v2661:match(v33) then v1629("That is not a valid key format.");return;end v1624=true;v1623.Text="checking key...";v1625("Verifying...",v22);v1626(v22);local v2663,v2664=v31();if  not v2663 then v1629(v2664 or "Key check failed." );return;end if v32(v2661,v2663) then v1628(v2661);else v1629("Wrong key.");end end v1623.MouseButton1Click:Connect(function() v1630();end);v1621.Focused:Connect(function() v1626(v22);end);v1621.FocusLost:Connect(function(v2665) v1626(v23);if ( not v1624 and v2665) then v1630();end end);v1623.MouseEnter:Connect(function() if v1624 then return;end v1627(v22,v1623.Text);end);v1623.MouseLeave:Connect(function() if v1624 then return;end v1627(v21,v1623.Text);end);v1614.InputBegan:Connect(function(v2666) if ((v2666.UserInputType==Enum.UserInputType.MouseButton1) or (v2666.UserInputType==Enum.UserInputType.Touch)) then v1601:Destroy();end end);local function v1631(v2667,v2668) local v2669={v2667};for v3020,v3021 in ipairs(v2667:GetDescendants()) do if v3021:IsA("GuiObject") then table.insert(v2669,v3021);end end for v3022,v3023 in ipairs(v2669) do local v3024={"BackgroundTransparency"};if (v3023:IsA("TextLabel") or v3023:IsA("TextButton") or v3023:IsA("TextBox")) then table.insert(v3024,"TextTransparency");end for v3287,v3288 in ipairs(v3024) do local v3289=v3023[v3288];v3023[v3288]=math.clamp(v3289 + 0.6 ,0,1);v8:Create(v3023,TweenInfo.new(v2668),{[v3288]=v3289}):Play();end end end task.spawn(function() task.wait(0.1);v1631(v1611,0.25);end);end local v472,v473=pcall(v471);if v472 then print(v28   .. "UI build finished, last element: "   .. v29 );else print(v28   .. "UI BUILD FAILED after: "   .. v29 );print(v28   .. "error = "   .. tostring(v473) );end end);
