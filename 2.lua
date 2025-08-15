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

-- 创建左侧分区按钮
createPanelButton("移动功能", 0.15)
createPanelButton("战斗辅助", 0.25)
createPanelButton("资源管理", 0.35)
createPanelButton("设置选项", 0.45)
createPanelButton("关于系统", 0.55)

-- 右侧功能区
local RightPanel = Instance.new("Frame")
RightPanel.Name = "RightPanel"
RightPanel.Parent = MainFrame
RightPanel.Position = UDim2.new(0.25, 0, 0, 0)
RightPanel.Size = UDim2.new(0.75, 0, 1, 0)
RightPanel.BackgroundColor3 = Color3.fromRGB(10, 20, 30)
RightPanel.BackgroundTransparency = 0.7
RightPanel.BorderSizePixel = 1
RightPanel.BorderColor3 = Color3.fromRGB(255, 0, 255)

-- 功能区标题
local FunctionTitle = Instance.new("TextLabel")
FunctionTitle.Name = "FunctionTitle"
FunctionTitle.Parent = RightPanel
FunctionTitle.Size = UDim2.new(1, 0, 0.1, 0)
FunctionTitle.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
FunctionTitle.BackgroundTransparency = 0.7
FunctionTitle.Font = Enum.Font.GothamBold
FunctionTitle.Text = "移动功能控制"
FunctionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FunctionTitle.TextSize = 18
FunctionTitle.TextScaled = true

-- 功能区元素示例（速度控制滑块）
local SpeedSliderFrame = Instance.new("Frame")
SpeedSliderFrame.Name = "SpeedSliderFrame"
SpeedSliderFrame.Parent = RightPanel
SpeedSliderFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
SpeedSliderFrame.Size = UDim2.new(0.8, 0, 0.1, 0)
SpeedSliderFrame.BackgroundTransparency = 1

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Parent = SpeedSliderFrame
SpeedLabel.Size = UDim2.new(1, 0, 0.3, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.Text = "移动速度: 100%"
SpeedLabel.TextColor3 = Color3.fromRGB(200, 255, 255)
SpeedLabel.TextSize = 14

local SpeedSlider = Instance.new("Frame")
SpeedSlider.Name = "SpeedSlider"
SpeedSlider.Parent = SpeedSliderFrame
SpeedSlider.Position = UDim2.new(0, 0, 0.3, 0)
SpeedSlider.Size = UDim2.new(1, 0, 0.2, 0)
SpeedSlider.BackgroundColor3 = Color3.fromRGB(30, 50, 70)
SpeedSlider.BorderColor3 = Color3.fromRGB(0, 255, 255)
SpeedSlider.BorderSizePixel = 1

local SliderHandle = Instance.new("Frame")
SliderHandle.Name = "SliderHandle"
SliderHandle.Parent = SpeedSlider
SliderHandle.Position = UDim2.new(0.5, 0, 0, 0)
SliderHandle.Size = UDim2.new(0, 10, 1, 0)
SliderHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderHandle.BorderColor3 = Color3.fromRGB(0, 255, 255)
SliderHandle.BorderSizePixel = 1

-- 功能按钮示例
local FlyButton = Instance.new("TextButton")
FlyButton.Name = "FlyButton"
FlyButton.Parent = RightPanel
FlyButton.Position = UDim2.new(0.1, 0, 0.4, 0)
FlyButton.Size = UDim2.new(0.35, 0, 0.1, 0)
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
FlyButton.BackgroundTransparency = 0.5
FlyButton.BorderColor3 = Color3.fromRGB(0, 255, 255)
FlyButton.BorderSizePixel = 1
FlyButton.Font = Enum.Font.Gotham
FlyButton.Text = "飞行模式"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.TextSize = 14

local TeleportButton = Instance.new("TextButton")
TeleportButton.Name = "TeleportButton"
TeleportButton.Parent = RightPanel
TeleportButton.Position = UDim2.new(0.55, 0, 0.4, 0)
TeleportButton.Size = UDim2.new(0.35, 0, 0.1, 0)
TeleportButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
TeleportButton.BackgroundTransparency = 0.5
TeleportButton.BorderColor3 = Color3.fromRGB(255, 0, 255)
TeleportButton.BorderSizePixel = 1
TeleportButton.Font = Enum.Font.Gotham
TeleportButton.Text = "快速传送"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.TextSize = 14

-- 状态显示面板
local StatusPanel = Instance.new("Frame")
StatusPanel.Name = "StatusPanel"
StatusPanel.Parent = RightPanel
StatusPanel.Position = UDim2.new(0.1, 0, 0.6, 0)
StatusPanel.Size = UDim2.new(0.8, 0, 0.3, 0)
StatusPanel.BackgroundColor3 = Color3.fromRGB(10, 30, 50)
StatusPanel.BackgroundTransparency = 0.7
StatusPanel.BorderColor3 = Color3.fromRGB(0, 255, 100)
StatusPanel.BorderSizePixel = 1

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = StatusPanel
StatusLabel.Size = UDim2.new(1, 0, 1, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "系统状态: 正常运行中\n当前模式: 移动控制\n延迟: 12ms"
StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.TextYAlignment = Enum.TextYAlignment.Top
StatusLabel.Position = UDim2.new(0.05, 0, 0.05, 0)

-- 关闭按钮
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
CloseButton.BackgroundTransparency = 0.5
CloseButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.BorderSizePixel = 1
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- 窗口拖动功能
local dragToggle = false
local dragInput = nil
local dragStart = nil
local startPos = nil

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragToggle then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
