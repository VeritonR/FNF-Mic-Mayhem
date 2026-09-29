function onEvent(name, value1, value2)

    if name == "BlackOut" then

        if value1 == "1" then
            
            makeLuaSprite('blackScreen', nil, -1000, -1000)
            makeGraphic('blackScreen', 4000, 3000, '000000')

            setScrollFactor('blackScreen', 0, 0)
            setObjectCamera('blackScreen', 'game')
            
            addLuaSprite('blackScreen', true)
            setProperty('blackScreen.alpha', 1)
        end

        if value2 == "2" then
            doTweenAlpha('blackFadeOut', 'blackScreen', 0, 0.5, 'linear')
        end

    end
end

function onTweenCompleted(tag)
    if tag == 'blackFadeOut' then
        removeLuaSprite('blackScreen', true)
    end
end