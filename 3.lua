local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/lool8/AetherSuite/refs/heads/main/2.lua"))()

print("初始化成功✅")
print("脚本已运行")
print("版本号为0.3.1")

OrionLib:MakeNotification({
                    Name = "XCK脚本", 
                    Content = "UI测试页",
                    Time = 2 -- 持续时间
                })    
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()
wait(1)

print("UI加载成功✅")
print("弹出(XCK脚本-UI测试页)")

OrionLib:MakeNotification({
                    Name = "XCK脚本", 
                    Content = "欢迎使用XCK脚本",
                    Time = 2 -- 持续时间
                })    
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()
wait(1)

print("弹出(XCK脚本-欢迎使用XCK脚本)")

OrionLib:MakeNotification({
                    Name = "XCK脚本", 
                    Content = "防反挂机已自动启动",
                    Time = 2 -- 持续时间
                })    
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()
wait(1)
print("防反挂机✅")

print("弹出(XCK脚本-防反挂机已自动启动)")

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

print("执行(防反挂机)")

OrionLib:MakeNotification({
                    Name = "XCK脚本", 
                    Content = "你的注入器是:"..identifyexecutor(),
                    Time = 2 -- 持续时间
                })    
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()
wait(1)

print("弹出(XCK脚本-你的注入器是)"..identifyexecutor())

OrionLib:MakeNotification({
                    Name = "XCK脚本", 
                    Content = "你的用户名是:"..game.Players.LocalPlayer.Character.Name,
                    Time = 2 -- 持续时间
                })    
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()

print("弹出(XCK脚本-你的用户名是)"..game.Players.LocalPlayer.Character.Name)

local Window = OrionLib:MakeWindow({Name = "XCK脚本", HidePremium = false, SaveConfig = true,IntroText = "欢迎使用XCK脚本", ConfigFolder = "123"})

print("脚本加载成功✅")
print("创建主UI(XCK脚本-XCK脚本-123)")

local announcement = Window:MakeTab({
    Name = "主页",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
announcement:AddParagraph("作者","XCK")
announcement:AddLabel("你的注入器:"..identifyexecutor())
announcement:AddLabel("你的用户名:"..game.Players.LocalPlayer.Character.Name)
announcement:AddLabel("你的客户端ID:"..game:GetService("RbxAnalyticsService"):GetClientId())
announcement:AddLabel("当前服务器ID:"..game.GameId)
announcement:AddLabel("你的账号年龄:"..game.Players.LocalPlayer.AccountAge)
announcement:AddLabel("你的账号ID:"..game.Players.LocalPlayer.UserId)
announcement:AddButton({
	Name = "QQ群966473735点击复制",
	Callback = function()
print("执行(复制966473735)并弹出(复制成功-你已复制QQ群号)")
setclipboard("979483258")
OrionLib:MakeNotification({
                    Name = "复制成功", 
                    Content = "你已复制QQ群号",
                    Time = 10 -- 持续时间
                })    
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()
end
})     