function onCreatePost()
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('scoreTxt.visible', false)

    -- Vertical time bar
    makeLuaSprite('timeBarVertical', nil, screenWidth - 30, 100)
    makeGraphic('timeBarVertical', 10, 400, 'FFFFFF')
    setObjectCamera('timeBarVertical', 'hud')
    addLuaSprite('timeBarVertical', true)

    makeLuaSprite('timeBarProgress', nil, screenWidth - 30, 100)
    makeGraphic('timeBarProgress', 10, 400, '00FF00')
    setObjectCamera('timeBarProgress', 'hud')
    addLuaSprite('timeBarProgress', true)
    setProperty('timeBarProgress.origin.y', 1)

    -- Tempo ao lado da time bar (CENTRALIZADO)
    makeLuaText('customTimeTxtTop', '0:00', 150, screenWidth - 180, 270)
    setTextSize('customTimeTxtTop', 20)
    setTextFont('customTimeTxtTop', 'funkin.ttf')
    setTextAlignment('customTimeTxtTop', 'center')
    setObjectCamera('customTimeTxtTop', 'hud')
    addLuaText('customTimeTxtTop')

    makeLuaText('customTimeTxtMid', '-----', 150, screenWidth - 180, 295)
    setTextSize('customTimeTxtMid', 20)
    setTextFont('customTimeTxtMid', 'funkin.ttf')
    setTextAlignment('customTimeTxtMid', 'center')
    setObjectCamera('customTimeTxtMid', 'hud')
    addLuaText('customTimeTxtMid')

    makeLuaText('customTimeTxtBot', '0:00', 150, screenWidth - 180, 320)
    setTextSize('customTimeTxtBot', 20)
    setTextFont('customTimeTxtBot', 'funkin.ttf')
    setTextAlignment('customTimeTxtBot', 'center')
    setObjectCamera('customTimeTxtBot', 'hud')
    addLuaText('customTimeTxtBot')

    -- Score, Misses, Acc, Rating
    makeLuaText('scoreHUD', 'Score: 0\n\nMisses: 0\n\nAccuracy: 0%\n\nRating: N/A', 400, 10, 10)
    setTextAlignment('scoreHUD', 'left')
    setTextSize('scoreHUD', 22)
    setTextFont('scoreHUD', 'funkin.ttf')
    setObjectCamera('scoreHUD', 'hud')
    addLuaText('scoreHUD')

    -- Música + dificuldade
    makeLuaText('songDiff', songName .. ' - ' .. difficultyName:upper(), 300, 10, screenHeight - 30)
    setTextAlignment('songDiff', 'left')
    setTextSize('songDiff', 20)
    setTextFont('songDiff', 'funkin.ttf')
    setObjectCamera('songDiff', 'hud')
    addLuaText('songDiff')
end

function onUpdatePost()
    local songPercent = getProperty('songPercent') or 0
    local barHeight = 400 * songPercent
    setProperty('timeBarProgress.y', 500 - barHeight)
    setProperty('timeBarProgress.scale.y', songPercent)

    -- Formatador de tempo
    local function formatTime(t)
        local minutes = math.floor(t / 60)
        local seconds = math.floor(t % 60)
        return string.format("%d:%02d", minutes, seconds)
    end

    local songPos = getSongPosition() / 1000
    local totalTime = getProperty('songLength') / 1000

    -- Tempo atualizado
    setTextString('customTimeTxtTop', formatTime(songPos))
    setTextString('customTimeTxtBot', formatTime(totalTime))

    -- Atualiza Score/Misses/Accuracy
    local score = getProperty('songScore')
    local misses = getProperty('songMisses')
    local acc = math.floor(getProperty('ratingPercent') * 10000) / 100
    local rating = ratingName or 'N/A'
    setTextString('scoreHUD', 'Score: ' .. score .. '\n\nMisses: ' .. misses .. '\n\nAccuracy: ' .. acc .. '%\n\nRating: ' .. rating)
end