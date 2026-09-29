local eccoID = 0

function onEvent(name, value1, value2)
    if name == 'Character Ecco' then
        if value2 == 'true' then
            spawnEcco(value1)
        end
    end
end

function spawnEcco(char)
    eccoID = eccoID + 1
    local tag = 'Ghost'..eccoID

    local iconColor = getProperty('iconP1.color')
    if char == 'dad' then
        iconColor = getProperty('iconP2.color')
    end

    -- tempo baseado na animação atual (fica mais natural)
    local animName = getProperty(char..'.animation.curAnim.name')
    local animLength = getProperty(char..'.animation.curAnim.numFrames') or 4
    local time = (stepCrochet / 1000) * (animLength * 0.5)

    makeAnimatedLuaSprite(tag, getProperty(char..'.imageFile'), getProperty(char..'.x'), getProperty(char..'.y'))
    addAnimationByPrefix(tag, 'idle', getProperty(char..'.animation.frameName'), 1, false)

    setProperty(tag..'.scale.x', getProperty(char..'.scale.x'))
    setProperty(tag..'.scale.y', getProperty(char..'.scale.y'))

    setProperty(tag..'.flipX', getProperty(char..'.flipX'))
    setProperty(tag..'.offset.x', getProperty(char..'.offset.x'))
    setProperty(tag..'.offset.y', getProperty(char..'.offset.y'))

    setProperty(tag..'.color', iconColor)
    setProperty(tag..'.alpha', 0.6)

    addLuaSprite(tag, false)
    setObjectOrder(tag, getObjectOrder(char..'Group') - 1)

    -- leve bump
    doTweenX(tag..'scaleX', tag..'.scale', getProperty(char..'.scale.x') * 1.08, time, 'circOut')
    doTweenY(tag..'scaleY', tag..'.scale', getProperty(char..'.scale.y') * 1.08, time, 'circOut')

    -- fade
    doTweenAlpha(tag..'fade', tag, 0, time, 'quadOut')
end

function onTweenCompleted(tag)
    if string.find(tag, 'fade') then
        local spr = string.gsub(tag, 'fade', '')
        removeLuaSprite(spr, true)
    end
end

-- Made By Rayzen