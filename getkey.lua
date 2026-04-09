--[[
    ⚓ Sailor Piece Hub - Loader
    User exe file này → Hiện GUI nhập key → Set script_key → Load Luarmor script
]]

local GETKEY_URL = "https://ads.luarmor.net/get_key?for=OCEAN_HUB-VKrSguUYfFjq"
local LUARMOR_URL = "https://api.luarmor.net/files/v4/loaders/e18db1da2d589242931944ef08da4f1c.lua"

-- Xoá GUI cũ nếu có
if game:GetService("CoreGui"):FindFirstChild("SailorKeyGui") then
    game:GetService("CoreGui"):FindFirstChild("SailorKeyGui"):Destroy()
end

local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui")
gui.Name = "SailorKeyGui"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

-- Overlay
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.BorderSizePixel = 0
overlay.Parent = gui
TweenService:Create(overlay, TweenInfo.new(0.3), {BackgroundTransparency = 0.4}):Play()

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 380, 0, 340)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -170)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 16, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(56, 189, 248)
stroke.Transparency = 0.7
stroke.Thickness = 1.5
stroke.Parent = mainFrame

-- Icon ⚓
local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(1, 0, 0, 45)
icon.Position = UDim2.new(0, 0, 0, 18)
icon.BackgroundTransparency = 1
icon.Text = "⚓"
icon.TextSize = 36
icon.Font = Enum.Font.GothamBold
icon.TextColor3 = Color3.fromRGB(255, 255, 255)
icon.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.Position = UDim2.new(0, 0, 0, 62)
title.BackgroundTransparency = 1
title.Text = "Sailor Piece Hub"
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(56, 189, 248)
title.Parent = mainFrame

-- Subtitle
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 20)
sub.Position = UDim2.new(0, 0, 0, 88)
sub.BackgroundTransparency = 1
sub.Text = "Enter your key to continue"
sub.TextSize = 12
sub.Font = Enum.Font.Gotham
sub.TextColor3 = Color3.fromRGB(148, 163, 184)
sub.Parent = mainFrame

-- Input frame
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(0, 320, 0, 44)
inputFrame.Position = UDim2.new(0.5, -160, 0, 125)
inputFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 45)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = mainFrame
Instance.new("UICorner", inputFrame).CornerRadius = UDim.new(0, 10)

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(55, 65, 81)
inputStroke.Thickness = 1
inputStroke.Parent = inputFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -20, 1, 0)
keyInput.Position = UDim2.new(0, 10, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.Text = ""
keyInput.PlaceholderText = "Paste your key here..."
keyInput.PlaceholderColor3 = Color3.fromRGB(100, 116, 139)
keyInput.TextColor3 = Color3.fromRGB(56, 189, 248)
keyInput.TextSize = 14
keyInput.Font = Enum.Font.Code
keyInput.ClearTextOnFocus = false
keyInput.Parent = inputFrame

-- Submit button
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0, 320, 0, 42)
submitBtn.Position = UDim2.new(0.5, -160, 0, 185)
submitBtn.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
submitBtn.BorderSizePixel = 0
submitBtn.Text = "Submit Key"
submitBtn.TextSize = 15
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.AutoButtonColor = true
submitBtn.Parent = mainFrame
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 10)

-- Get Key button
local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0, 320, 0, 38)
getKeyBtn.Position = UDim2.new(0.5, -160, 0, 237)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 41, 59)
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Text = "Get Key (Free)"
getKeyBtn.TextSize = 13
getKeyBtn.Font = Enum.Font.GothamSemibold
getKeyBtn.TextColor3 = Color3.fromRGB(129, 140, 248)
getKeyBtn.AutoButtonColor = true
getKeyBtn.Parent = mainFrame
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 10)

local gkStroke = Instance.new("UIStroke")
gkStroke.Color = Color3.fromRGB(129, 140, 248)
gkStroke.Transparency = 0.6
gkStroke.Thickness = 1
gkStroke.Parent = getKeyBtn

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0, 290)
status.BackgroundTransparency = 1
status.Text = ""
status.TextSize = 12
status.Font = Enum.Font.GothamSemibold
status.TextColor3 = Color3.fromRGB(239, 68, 68)
status.Parent = mainFrame

-- Close
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -38, 0, 8)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "X"
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.fromRGB(100, 116, 139)
closeBtn.Parent = mainFrame

-- === EVENTS ===
keyInput.Focused:Connect(function()
    TweenService:Create(inputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(56, 189, 248)}):Play()
end)
keyInput.FocusLost:Connect(function()
    TweenService:Create(inputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(55, 65, 81)}):Play()
end)

-- Get Key → copy link to clipboard
getKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if setclipboard then setclipboard(GETKEY_URL) end
    end)
    status.TextColor3 = Color3.fromRGB(56, 189, 248)
    status.Text = "Link copied! Open in browser"
    task.delay(3, function() pcall(function() status.Text = "" end) end)
end)

-- Close
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Submit → set script_key → load Luarmor script
submitBtn.MouseButton1Click:Connect(function()
    local key = keyInput.Text:gsub("%s+", "")
    if key == "" then
        status.TextColor3 = Color3.fromRGB(239, 68, 68)
        status.Text = "Please enter a key!"
        return
    end

    submitBtn.Text = "Verifying..."
    submitBtn.BackgroundColor3 = Color3.fromRGB(100, 116, 139)
    status.Text = ""

    -- Set script_key cho Luarmor
    getgenv().script_key = key

    task.wait(0.3)

    -- Load Luarmor script (Luarmor sẽ verify key server-side)
    local success, err = pcall(function()
        loadstring(game:HttpGet(LUARMOR_URL))()
    end)

    if success then
        -- Key đúng → Luarmor cho phép chạy → đóng GUI
        status.TextColor3 = Color3.fromRGB(16, 185, 129)
        status.Text = "Key valid! Loading script..."
        task.wait(0.8)
        TweenService:Create(overlay, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        TweenService:Create(mainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        for _, child in pairs(mainFrame:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("TextBox") then
                TweenService:Create(child, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
            end
        end
        task.wait(0.4)
        gui:Destroy()
    else
        -- Key sai hoặc lỗi
        status.TextColor3 = Color3.fromRGB(239, 68, 68)
        if tostring(err):find("key") or tostring(err):find("Key") then
            status.Text = "Invalid key!"
        else
            status.Text = "Error: " .. tostring(err):sub(1, 40)
        end
        submitBtn.Text = "Submit Key"
        submitBtn.BackgroundColor3 = Color3.fromRGB(16, 185, 129)
        -- Shake
        local orig = mainFrame.Position
        for i = 1, 3 do
            mainFrame.Position = orig + UDim2.new(0, 8, 0, 0)
            task.wait(0.05)
            mainFrame.Position = orig + UDim2.new(0, -8, 0, 0)
            task.wait(0.05)
        end
        mainFrame.Position = orig
    end
end)

-- Enter to submit
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        submitBtn.MouseButton1Click:Fire()
    end
end)
