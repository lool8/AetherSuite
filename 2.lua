-- 创建主容器
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TechUI"
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 主框架（带彩色发光效果）
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 0

-- 发光边框（使用渐变和阴影实现）
local GlowBorder = Instance.new("Frame")
GlowBorder.Name = "GlowBorder"
GlowBorder.Parent = MainFrame
GlowBorder.Position = UDim2.new(-0.01, 0, -0.01, 0)
GlowBorder.Size = UDim2.new(1.02, 0, 1.02, 0)
GlowBorder.BackgroundTransparency = 0.8
GlowBorder.BorderSizePixel = 0
GlowBorder.ZIndex = -1

local gradient = Instance.new("UIGradient")
gradient.Parent = GlowBorder
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
})
gradient.Rotation = 45

local shadow = Instance.new("UIStroke")
shadow.Parent = GlowBorder
shadow.Color = Color3.fromRGB(100, 200, 255)
shadow.Thickness = 3
shadow.Transparency = 0.5
shadow.Enabled = true

-- 左侧分区
local LeftPanel = Instance.new("Frame")
LeftPanel.Name = "LeftPanel"
LeftPanel.Parent = MainFrame
LeftPanel.Position = UDim2.new(0, 0, 0, 0)
LeftPanel.Size = UDim2.new(0.25, 0, 1, 0)
LeftPanel.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
LeftPanel.BackgroundTransparency = 0.5
LeftPanel.BorderSizePixel = 1
LeftPanel.BorderColor3 = Color3.fromRGB(0, 200, 255)

-- 分区标题
local PanelTitle = Instance.new("TextLabel")
PanelTitle.Name = "PanelTitle"
PanelTitle.Parent = LeftPanel
PanelTitle.Size = UDim2.new(1, 0, 0.1, 0)
PanelTitle.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
PanelTitle.BackgroundTransparency = 0.7
PanelTitle.Font = Enum.Font.GothamBold
PanelTitle.Text = "功能分区"
PanelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PanelTitle.TextSize = 18
PanelTitle.TextScaled = true

-- 分区按钮（示例）
local function createPanelButton(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = LeftPanel
    btn.Position = UDim2.new(0.1, 0, yPos, 0)
    btn.Size = UDim2.new(0.8, 0, 0.08, 0)
    btn.BackgroundColor3 = Color3.fromRGB(20, 40, 60)
    btn.BackgroundTransparency = 0.6
    btn.BorderColor3 = Color3.fromRGB(0, 255, 255)
    btn.BorderSizePixel = 1
    btn.Font = Enum.Font.Gotham
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 255, 255)
    btn.TextSize = 14
    
    -- 悬停效果
    btn.MouseEnter:Connect(function()
        btn.BackgroundTransparency = 0.3
        btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundTransparency = 0.6
        btn.BorderColor3 = Color3.fromRGB(0, 255, 255)
    end)
    
    return btn
end

local UITab1 = win:Tab("【通用】",'16060333448')

about:Button("『无限跳』",function()
loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)
