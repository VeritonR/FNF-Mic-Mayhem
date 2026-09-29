function onCreate()
    makeLuaSprite('sprite4', 'Street/weeke_sky', -1200, -700)
    setScrollFactor('sprite4', 0.1, 0.1)
    scaleObject('sprite4', 1.1, 1.1)
    addLuaSprite('sprite4', false)

    makeLuaSprite('sprite3', 'Street/tree', -1000, -150)
    setScrollFactor('sprite3', 0.7, 0.7)
    scaleObject('sprite3', 1.5, 1.5)
    addLuaSprite('sprite3', false)

    makeLuaSprite('sprite1', 'Street/front', -800, -50)
    setScrollFactor('sprite1', 1, 1)
    scaleObject('sprite1', 1.44, 1.44)
    addLuaSprite('sprite1', false)

    makeLuaSprite('sprite2', 'Street/placa', 0, 650)
    setScrollFactor('sprite2', 1.2, 1.2)
    addLuaSprite('sprite2', true)

    setProperty('defaultCamZoom', 0.7)
end

function onCreatePost()
    if shadersEnabled then
        initLuaShader('adjustColor')

        for i, obj in ipairs({'boyfriend','dad','gf'}) do
            setSpriteShader(obj, 'adjustColor')

            setShaderFloat(obj, 'hue', -20)
            setShaderFloat(obj, 'saturation', -10)
            setShaderFloat(obj, 'contrast', 10)
            setShaderFloat(obj, 'brightness', -2)
        end
    end
end