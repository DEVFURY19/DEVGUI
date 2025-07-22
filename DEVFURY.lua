local player = game:GetService("Players").LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Screen GUI setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BypassLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = PlayerGui

-- Background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
bg.Parent = screenGui

-- Logo/Image
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0.2, 0, 0.2, 0)
logo.Position = UDim2.new(0.4, 0, 0.1, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://71246667907608" -- Replace with your own image ID
logo.Parent = bg

-- Bypassing Text
local bypassText = Instance.new("TextLabel")
bypassText.Size = UDim2.new(1, 0, 0.08, 0)
bypassText.Position = UDim2.new(0, 0, 0.32, 0)
bypassText.BackgroundTransparency = 1
bypassText.TextColor3 = Color3.fromRGB(255, 70, 70)
bypassText.TextScaled = true
bypassText.Font = Enum.Font.GothamBlack
bypassText.Text = "Bypassing Anti-Cheat Wall"
bypassText.Parent = bg

-- Warning Text
local warningText = Instance.new("TextLabel")
warningText.Size = UDim2.new(1, 0, 0.05, 0)
warningText.Position = UDim2.new(0, 0, 0.39, 0)
warningText.BackgroundTransparency = 1
warningText.TextColor3 = Color3.fromRGB(255, 200, 50)
warningText.TextScaled = true
warningText.Font = Enum.Font.GothamBold
warningText.Text = "▲ Warning: Please don't leave, If you leave, you will be banned."
warningText.Parent = bg

-- Percentage Text
local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(0.2, 0, 0.05, 0)
percentText.Position = UDim2.new(0.4, 0, 0.5, 0)
percentText.BackgroundTransparency = 1
percentText.TextColor3 = Color3.fromRGB(255, 255, 255)
percentText.TextScaled = true
percentText.Font = Enum.Font.GothamBold
percentText.Text = "0%"
percentText.Parent = bg

-- Progress Bar
local barContainer = Instance.new("Frame")
barContainer.Size = UDim2.new(0.5, 0, 0.025, 0)
barContainer.Position = UDim2.new(0.25, 0, 0.56, 0)
barContainer.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
barContainer.BorderSizePixel = 0
barContainer.Parent = bg

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barContainer

-- Jumping "Loading..." Text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0.3, 0, 0.08, 0)
loadingText.Position = UDim2.new(0.35, 0, 0.64, 0)
loadingText.Text = "Loading..."
loadingText.TextScaled = true
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.GothamBlack
loadingText.Parent = bg

-- Animate jumping text
coroutine.wrap(function()
	while true do
		for i = 0, 10 do
			local offset = math.sin(i / 10 * math.pi) * 0.02
			loadingText.Position = UDim2.new(0.35, 0, 0.64 - offset, 0)
			wait(0.03)
		end
	end
end)()

-- Simulate loading
for i = 0, 100 do
	percentText.Text = i .. "%"
	barFill.Size = UDim2.new(i / 100, 0, 1, 0)
	wait(1.5) -- Adjust speed here
end

-- Fade and remove GUI
for t = 1, 10 do
	local alpha = t * 0.1
	bg.BackgroundTransparency = alpha
	for _, obj in ipairs(bg:GetChildren()) do
		if obj:IsA("TextLabel") then
			obj.TextTransparency = alpha
		elseif obj:IsA("ImageLabel") then
			obj.ImageTransparency = alpha
		elseif obj:IsA("Frame") then
			obj.BackgroundTransparency = alpha
		end
	end
	wait(600)
end

-- ⏰ Wait 10 minutes before removing GUI
wait(600)
screenGui:Destroy()

