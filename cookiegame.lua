-- Cookie Game v1.4
-- By Cookie Game Dev Team Authorized

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 600)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(245, 230, 211)
mainFrame.BorderSizePixel = 5
mainFrame.BorderColor3 = Color3.fromRGB(212, 163, 115)
mainFrame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Text = "🍪 Cookie Game 🍪"
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(181, 101, 30)
title.Parent = mainFrame

-- Cookie button
local cookieButton = Instance.new("TextButton")
cookieButton.Text = "🍪⃢"
cookieButton.Size = UDim2.new(0, 100, 0, 100)
cookieButton.Position = UDim2.new(0.5, -50, 0, 80)
cookieButton.BackgroundColor3 = Color3.fromRGB(255, 250, 224)
cookieButton.BorderSizePixel = 3
cookieButton.Font = Enum.Font.SourceSansBold
cookieButton.TextSize = 60
cookieButton.Parent = mainFrame

-- Crumb counter
local crumbLabel = Instance.new("TextLabel")
crumbLabel.Text = "Crumbs: 0"
crumbLabel.Size = UDim2.new(1, 0, 0, 40)
crumbLabel.Position = UDim2.new(0, 0, 0, 190)
crumbLabel.BackgroundTransparency = 1
crumbLabel.Font = Enum.Font.GothamBold
crumbLabel.TextSize = 20
crumbLabel.Parent = mainFrame

local crumbs = 0

cookieButton.MouseButton1Click:Connect(function()
    crumbs = crumbs + 1
    crumbLabel.Text = "Crumbs: " .. crumbs
    
    -- Click effect
    cookieButton.TextSize = 50
    task.wait(0.1)
    cookieButton.TextSize = 60
end)

-- Shop title
local shopTitle = Instance.new("TextLabel")
shopTitle.Text = "🛒 Cookie Shop"
shopTitle.Size = UDim2.new(1, 0, 0, 40)
shopTitle.Position = UDim2.new(0, 0, 0, 240)
shopTitle.BackgroundTransparency = 1
shopTitle.Font = Enum.Font.GothamBold
shopTitle.TextSize = 18
shopTitle.Parent = mainFrame

-- Shop buttons
local shopItems = {
    {name = "🍪 Regular Cookie", cost = 0, emoji = "🍪⃢"},
    {name = "⭐ Star Cookie", cost = 12, emoji = "⭐⃢🍪"},
    {name = "🌙 Moon Cookie", cost = 10, emoji = "🌙⃢🍪"},
    {name = "🦀 Crab Cookie", cost = 10, emoji = "🦀⃢🍪"}
}

local yOffset = 280
for i, item in ipairs(shopItems) do
    local button = Instance.new("TextButton")
    button.Text = item.name .. " - $" .. item.cost
    button.Size = UDim2.new(0.9, 0, 0, 40)
    button.Position = UDim2.new(0.05, 0, 0, yOffset)
    button.BackgroundColor3 = Color3.fromRGB(212, 163, 115)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 14
    button.Parent = mainFrame
    
    button.MouseButton1Click:Connect(function()
        if crumbs >= item.cost then
            crumbs = crumbs - item.cost
            crumbLabel.Text = "Crumbs: " .. crumbs
            cookieButton.Text = item.emoji
            print("Bought " .. item.name)
        else
            print("Not enough crumbs! Need " .. item.cost)
        end
    end)
    
    yOffset = yOffset + 45
end

-- Pro button
local proButton = Instance.new("TextButton")
proButton.Text = "💎 Go Pro ($500/mo or $2500 forever)"
proButton.Size = UDim2.new(0.9, 0, 0, 40)
proButton.Position = UDim2.new(0.05, 0, 0, yOffset + 20)
proButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
proButton.Font = Enum.Font.SourceSansBold
proButton.TextSize = 12
proButton.Parent = mainFrame

proButton.MouseButton1Click:Connect(function()
    print("👑 Pro membership purchased! (not real money)")
end)

-- Version text
local versionText = Instance.new("TextLabel")
versionText.Text = "Version 1.4 — Coming May 25, 2026"
versionText.Size = UDim2.new(1, 0, 0, 30)
versionText.Position = UDim2.new(0, 0, 1, -30)
versionText.BackgroundTransparency = 1
versionText.Font = Enum.Font.SourceSans
versionText.TextSize = 12
versionText.TextColor3 = Color3.fromRGB(136, 136, 136)
versionText.Parent = mainFrame

print("🍪 Cookie Game loaded! Play nice. Stay crispy.")
