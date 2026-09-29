function onCreate()
    makeLuaSprite('screenCover', nil, -1000, -1000)
    makeGraphic('screenCover', screenWidth*4, screenHeight*4, '000000')
    setScrollFactor('screenCover', 0, 0)
    setObjectCamera('screenCover', 'camHUD')
    addLuaSprite('screenCover', true)
    setProperty('screenCover.alpha', 0)
end

function onEvent(name, value1, value2)
    if name == 'Screen Coverer' then

        local state = value1
        local layer = value2

        -- layer
        if layer == 'front' then
            setObjectOrder('screenCover', 99999)
        else
            setObjectOrder('screenCover', 0)
        end

        -- behavior
        if state == 'true' then
            doTweenAlpha('screenFadeIn', 'screenCover', 1, 0.4, 'quadOut')
        elseif state == 'false' then
            doTweenAlpha('screenFadeOut', 'screenCover', 0, 0.4, 'quadOut')
        end

    end
end

-- Made By Rayzen