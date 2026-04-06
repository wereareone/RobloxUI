    local base = Instance.new("Frame")
    base.Name = "Base"
    base.AnchorPoint = Vector2.new(0.5, 0)
    base.Position = UDim2.new(0.5, 0, 0.5, -100)
    base.Size = UDim2.fromOffset(868, 550)
    base.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    base.BackgroundTransparency = Settings.AcrylicBlur and 0.05 or 0
    base.BorderColor3 = Color3.fromRGB(0, 0, 0)
    base.BorderSizePixel = 0
    base.ClipsDescendants = true

    local uiConstraint = Instance.new("UISizeConstraint", base)
    uiConstraint.MaxSize = Vector2.new(1200, 1000) 
    uiConstraint.MinSize = Vector2.new(500, 100)

    local baseUICorner = Instance.new("UICorner", base)
    baseUICorner.CornerRadius = UDim.new(0, 12)

    local baseUIScale = Instance.new("UIScale", base)

    local function UpdateScale()
        if not camera then return end
        local viewportSize = camera.ViewportSize
        if viewportSize.X < 900 then
            baseUIScale.Scale = math.clamp(viewportSize.X / 1000, 0.65, 0.9)
        else
            baseUIScale.Scale = 1
        end
    end

    if camera then
        camera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)
    end
    UpdateScale() 

    function WindowFunctions:SetScale(Scale)
        baseUIScale.Scale = Scale
    end
    function WindowFunctions:GetScale()
        return baseUIScale.Scale
    end
