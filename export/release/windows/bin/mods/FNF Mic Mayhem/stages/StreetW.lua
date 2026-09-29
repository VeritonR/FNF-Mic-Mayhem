local dir = 'StreetW/'  -- pasta das imagens

function onCreate()
    -- Sky
    makeLuaSprite('sky', dir..'sky', -290, -103)
    scaleObject('sky', 1.1, 1.15)
    setScrollFactor('sky', 0.05, 0.05)
    addLuaSprite('sky', false)

    -- Eskinabar (fundo)
    makeLuaSprite('eskinabar', dir..'eskinabar', -714, -523)
    scaleObject('eskinabar', 1.75, 1.75)
    setScrollFactor('eskinabar', 1, 1)
    addLuaSprite('eskinabar', false)

    -- Chairs (frente)
    makeLuaSprite('chairs', dir..'chairs', -917, -582)
    scaleObject('chairs', 1.9, 1.9)
    setScrollFactor('chairs', 1.5, 1.5)
    addLuaSprite('chairs', false)
end

-- === Shader que você pediu (no final) ===
function onCreatePost()
    if shadersEnabled then
        initLuaShader('adjustColor')
        for i, obj in ipairs({'boyfriend','dad','gf'}) do
            setSpriteShader(obj, 'adjustColor')
            setShaderFloat(obj, 'hue', -20)
            setShaderFloat(obj, 'saturation', -9)
            setShaderFloat(obj, 'contrast', 10)
            setShaderFloat(obj, 'brightness', -10)
        end
    end
end