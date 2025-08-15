-- 创建主UI容器
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomUI"
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 主窗口
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100) -- 居中显示
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true -- 允许拖动窗口

-- 窗口标题
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Roblox 自定义UI"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16

-- 功能按钮
local ActionButton = Instance.new("TextButton")
ActionButton.Name = "ActionButton"
ActionButton.Parent = MainFrame
ActionButton.BackgroundColor3 = Color3.fromRGB(60, 120, 240)
ActionButton.Position = UDim2.new(0.1, 0, 0.3, 0)
ActionButton.Size = UDim2.new(0.8, 0, 0, 30)
ActionButton.Font = Enum.Font.Gotham
ActionButton.Text = "点击执行操作"
ActionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ActionButton.TextSize = 14

-- 按钮点击事件
ActionButton.MouseButton1Click:Connect(function()
    -- 示例：显示通知
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "提示",
        Text = "按钮被点击了！",
        Duration = 3
    })
end)

-- 滑块控件（用于调节数值）
local SliderFrame = Instance.new("Frame")
SliderFrame.Name = "SliderFrame"
SliderFrame.Parent = MainFrame
SliderFrame.BackgroundTransparency = 1
SliderFrame.Position = UDim2.new(0.1, 0, 0.5, 0)
SliderFrame.Size = UDim2.new(0.8, 0, 0, 40)

local SliderLabel = Instance.new("TextLabel")
SliderLabel.Name = "SliderLabel"
SliderLabel.Parent = SliderFrame
SliderLabel.BackgroundTransparency = 1
SliderLabel.Size = UDim2.new(1, 0, 0, 15)
SliderLabel.Font = Enum.Font.Gotham
SliderLabel.Text = "速度调节: 5"
SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SliderLabel.TextSize = 12

local Slider = Instance.new("TextButton")
Slider.Name = "Slider"
Slider.Parent = SliderFrame
Slider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Slider.Position = UDim2.new(0, 0, 0, 20)
Slider.Size = UDim2.new(1, 0, 0, 10)
Slider.Text = ""

-- 滑块拖动逻辑
local isDragging = false
local currentValue = 5

Slider.MouseButton1Down:Connect(function(input)
    isDragging = true
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if isDragging then
        local mousePos = game:GetService("UserInputService"):GetMouseLocation()
        local sliderPos = SliderFrame.AbsolutePosition
        local sliderSize = SliderFrame.AbsoluteSize
        
        -- 计算滑块相对位置（0-10范围）
        local ratio = math.clamp((mousePos.X - sliderPos.X) / sliderSize.X, 0, 1)
        currentValue = math.floor(ratio * 10)
        
        -- 更新显示
        SliderLabel.Text = "速度调节: " .. currentValue
    end
end)

-- 关闭按钮
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- 关闭UI
end)
