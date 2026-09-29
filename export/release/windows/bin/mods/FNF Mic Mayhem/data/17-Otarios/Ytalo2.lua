local lastSinger = ""
local ytaloIsSinging = false

function onCreate()
    makeAnimatedLuaSprite('Dad2', 'characters/Ytalorenji17Conto', -500, -95)
    addAnimationByPrefix('Dad2', 'idle', 'ytalo idle', 12, true)
    addAnimationByPrefix('Dad2', 'singLEFT', 'ytalo left', 24, false)
    addAnimationByPrefix('Dad2', 'singDOWN', 'ytalo down', 24, false)
    addAnimationByPrefix('Dad2', 'singUP', 'ytalo up', 24, false)
    addAnimationByPrefix('Dad2', 'singRIGHT', 'ytalo right', 24, false)
    objectPlayAnimation('Dad2', 'idle')
    addLuaSprite('Dad2', false)
end

function onCreatePost()
    setProperty('camGame.angle', 0)
    setProperty('camHUD.angle', 0)
    setProperty('camGame.zoom', 1)
    setProperty('camHUD.zoom', 1)
    setProperty('isCameraOnForcedPos', false)
    setObjectOrder('Dad2', getObjectOrder('boyfriendGroup') + 1)
end

function opponentNoteHit(id, d, t, s)
    if t == "Ytalo" then
        if d == 0 then objectPlayAnimation('Dad2', 'singLEFT', true) end
        if d == 1 then objectPlayAnimation('Dad2', 'singDOWN', true) end
        if d == 2 then objectPlayAnimation('Dad2', 'singUP', true) end
        if d == 3 then objectPlayAnimation('Dad2', 'singRIGHT', true) end
        lastSinger = "ytalo"
        ytaloIsSinging = true
    else
        lastSinger = "dad"
    end
end

function goodNoteHit()
    lastSinger = "bf"
end

function onBeatHit()
    if curBeat % 2 == 0 and not ytaloIsSinging then
        objectPlayAnimation('Dad2', 'idle', true)
    end
    ytaloIsSinging = false
end

function onUpdate()
    if lastSinger == "ytalo" then
        local x = getMidpointX('Dad2') - 30
        local y = getMidpointY('Dad2') - 120

        if getProperty('Dad2.animation.curAnim.name') == 'singLEFT' then
            x = x - 40
        elseif getProperty('Dad2.animation.curAnim.name') == 'singRIGHT' then
            x = x + 40
        elseif getProperty('Dad2.animation.curAnim.name') == 'singUP' then
            y = y - 40
        elseif getProperty('Dad2.animation.curAnim.name') == 'singDOWN' then
            y = y + 40
        end

        setProperty('camFollow.x', x)
        setProperty('camFollow.y', y)
        setProperty('isCameraOnForcedPos', true)
    else
        setProperty('isCameraOnForcedPos', false)
    end
end