
-- CarlosKavoUI - Interface recriada por ChatGPT para Carlos 🚀
-- Estilo leve, organizado e fácil de expandir 🧠✨

local CarlosUI = {}

function CarlosUI:CreateWindow(config)
    local title = config.Title or "CarlosKavoUI"
    local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    gui.Name = "CarlosKavoUI_" .. tostring(math.random(1000, 9999))

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 500, 0, 350)
    main.Position = UDim2.new(0.5, -250, 0.5, -175)
    main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    main.BorderSizePixel = 0
    main.Active = true
    main.Draggable = true

    local titleBar = Instance.new("TextLabel", main)
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.Text = title
    titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleBar.Font = Enum.Font.GothamBold
    titleBar.TextSize = 18

    local tabList = Instance.new("Frame", main)
    tabList.Size = UDim2.new(0, 130, 1, -30)
    tabList.Position = UDim2.new(0, 0, 0, 30)
    tabList.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

    local content = Instance.new("Frame", main)
    content.Size = UDim2.new(1, -130, 1, -30)
    content.Position = UDim2.new(0, 130, 0, 30)
    content.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

    local uiTabs = {}

    function uiTabs:CreateTab(name)
        local btn = Instance.new("TextButton", tabList)
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.Text = name
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 16

        local tabFrame = Instance.new("Frame", content)
        tabFrame.Size = UDim2.new(1, 0, 1, 0)
        tabFrame.Visible = false
        tabFrame.BackgroundTransparency = 1

        btn.MouseButton1Click:Connect(function()
            for _, v in pairs(content:GetChildren()) do
                v.Visible = false
            end
            tabFrame.Visible = true
        end)

        local tabFunctions = {}

        function tabFunctions:AddButton(text, callback)
            local button = Instance.new("TextButton", tabFrame)
            button.Size = UDim2.new(0, 300, 0, 30)
            button.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren() * 35)
            button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            button.Text = text
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.Gotham
            button.TextSize = 14
            button.MouseButton1Click:Connect(callback)
        end

        function tabFunctions:AddLabel(text)
            local label = Instance.new("TextLabel", tabFrame)
            label.Size = UDim2.new(0, 300, 0, 30)
            label.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren() * 35)
            label.BackgroundTransparency = 1
            label.Text = text
            label.TextColor3 = Color3.fromRGB(180, 180, 180)
            label.Font = Enum.Font.Gotham
            label.TextSize = 14
        end

        function tabFunctions:AddToggle(text, callback)
            local toggle = Instance.new("TextButton", tabFrame)
            toggle.Size = UDim2.new(0, 300, 0, 30)
            toggle.Position = UDim2.new(0, 10, 0, #tabFrame:GetChildren() * 35)
            toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            toggle.Text = text .. ": OFF"
            toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggle.Font = Enum.Font.Gotham
            toggle.TextSize = 14

            local state = false
            toggle.MouseButton1Click:Connect(function()
                state = not state
                toggle.Text = text .. ": " .. (state and "ON" or "OFF")
                callback(state)
            end)
        end

        tabFrame.Visible = #content:GetChildren() == 1
        return tabFunctions
    end

    return uiTabs
end

return CarlosUI
