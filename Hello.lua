-- PANEL OLUŞTURMA
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomPanel"
ScreenGui.ResetOnSpawn = false  
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(0, 200, 0, 120)
Panel.Position = UDim2.new(0.3, 0, 0.3, 0)
Panel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Panel.Active = true
Panel.Draggable = true
Panel.Parent = ScreenGui

-- FONKSIYON: Buton satırı oluştur
local function CreateRow(name, y)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(1, -10, 0, 40)
    Row.Position = UDim2.new(0, 5, 0, y)
    Row.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
    Row.Parent = Panel

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.Position = UDim2.new(0, 5, 0, 0)
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1
    Label.TextSize = 20
    Label.Parent = Row

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 60, 0.8, 0)
    Button.Position = UDim2.new(0.55, 0, 0.1, 0)
    Button.Text = "click"
    Button.TextColor3 = Color3.fromRGB(255, 0, 0)
    Button.BackgroundTransparency = 1
    Button.TextSize = 20
    Button.Parent = Row

    local Box = Instance.new("Frame")
    Box.Size = UDim2.new(0, 30, 0, 30)
    Box.Position = UDim2.new(1, -35, 0.5, -15)
    Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Box.Parent = Row

    return Button
end

-- Satırlar:
local BoomButton = CreateRow("boom", 5)
local LightButton = CreateRow("light", 60)

-- BOOM FONKSIYONU
BoomButton.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        -- Patlama efekti
        local explosion = Instance.new("Explosion")
        explosion.Position = char.HumanoidRootPart.Position
        explosion.BlastRadius = 5
        explosion.Parent = workspace

        -- Karakteri öldür
        char.Humanoid.Health = 0
    end
end)

-- LIGHT FONKSIYONU
LightButton.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        local head = char:FindFirstChild("Head")
        if head then
            local light = head:FindFirstChild("CustomLight")

            if light then
                light:Destroy()
            else
                local newLight = Instance.new("PointLight")
                newLight.Name = "CustomLight"
                newLight.Range = 16
                newLight.Brightness = 5
                newLight.Parent = head
            end
        end
    end
end)
