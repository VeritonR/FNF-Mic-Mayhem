--////////////////////////////////////////////////////////////////////////--
--                                CONFIG                                  --
--////////////////////////////////////////////////////////////////////////--

local cardX = -720
local cardY = 35

local cardWidth = 620
local cardHeight = 165

local cardAlpha = 0.42

local cdX = -690
local cdY = 48

local cdScale = 1.05
local cdRotateSpeed = 80

local textX = -410
local textY = 63

local textSize = 23

local enterTime = 1
local exitTime = 1

local holdTime = 3

--////////////////////////////////////////////////////////////////////////--
--                              VARIABLES                                 --
--////////////////////////////////////////////////////////////////////////--

local cdRotation = 0

--////////////////////////////////////////////////////////////////////////--
--                               CREATE                                   --
--////////////////////////////////////////////////////////////////////////--

function onCreate()

    -- Background
    makeLuaSprite('blankBox', nil, cardX, cardY)
    makeGraphic('blankBox', cardWidth, cardHeight, '000000')

    setObjectCamera('blankBox', 'other')
    setProperty('blankBox.alpha', cardAlpha)

    addLuaSprite('blankBox', true)

    -- CD
    makeLuaSprite('CD', 'CD', cdX, cdY)

    setObjectCamera('CD', 'other')

    scaleObject('CD', cdScale, cdScale)

    addLuaSprite('CD', true)

    -- TXT Path
    local path = 'data/'..songPath..'/SongCardInfo.txt'

    if not checkFileExists(path) then
        path = 'data/'..songPath..'/songCardInfo.txt'
    end

    -- Default Values
    local composer = 'Unknown'
    local charter = 'Unknown'
    local artist = 'Unknown'

    -- Read TXT
    if checkFileExists(path) then

        local info = getTextFromFile(path)
        local lines = {}

        for line in info:gmatch("[^\r\n]+") do
            table.insert(lines, line)
        end

        composer = lines[1] or 'Unknown'
        charter = lines[2] or 'Unknown'
        artist = lines[3] or 'Unknown'

    end

    -- Song Text
    makeLuaText('cardTxt',
        songName..
        '\n\nComposer: '..composer..
        '\nCharter: '..charter..
        '\nArtist: '..artist,
        0,
        textX,
        textY
    )

    setTextSize('cardTxt', textSize)

    setTextAlignment('cardTxt', 'left')

    setTextBorder('cardTxt', 2, '000000')

    setTextFont('cardTxt', 'Funkin.ttf')

    setObjectCamera('cardTxt', 'other')

    addLuaText('cardTxt')

    -- Smooth entrance alpha
    setProperty('blankBox.alpha', 0)
    setProperty('CD.alpha', 0)
    setProperty('cardTxt.alpha', 0)

end

--////////////////////////////////////////////////////////////////////////--
--                             SONG START                                 --
--////////////////////////////////////////////////////////////////////////--

function onSongStart()

    -- Move In
    doTweenX('hiBox', 'blankBox', 0, enterTime, 'quintOut')

    doTweenX('hiCD', 'CD', -25, enterTime, 'quintOut')

    doTweenX('hiText', 'cardTxt', 145, enterTime, 'quintOut')

    -- Fade In
    doTweenAlpha('boxAlpha', 'blankBox', cardAlpha, 0.6, 'quadOut')

    doTweenAlpha('cdAlpha', 'CD', 1, 0.6, 'quadOut')

    doTweenAlpha('txtAlpha', 'cardTxt', 1, 0.6, 'quadOut')

    -- Exit Timer
    runTimer('cardWait', holdTime)

end

--////////////////////////////////////////////////////////////////////////--
--                               UPDATE                                   --
--////////////////////////////////////////////////////////////////////////--

function onUpdate(elapsed)

    -- CD Rotation
    cdRotation = cdRotation + (cdRotateSpeed * elapsed)

    setProperty('CD.angle', cdRotation)

end

--////////////////////////////////////////////////////////////////////////--
--                               TIMERS                                   --
--////////////////////////////////////////////////////////////////////////--

function onTimerCompleted(tag)

    if tag == 'cardWait' then

        -- Move Out
        doTweenX('byeBox', 'blankBox', cardX, exitTime, 'quintIn')

        doTweenX('byeCD', 'CD', cdX, exitTime, 'quintIn')

        doTweenX('byeText', 'cardTxt', textX, exitTime, 'quintIn')

        -- Fade Out
        doTweenAlpha('byeAlpha1', 'blankBox', 0, 0.7, 'quadIn')

        doTweenAlpha('byeAlpha2', 'CD', 0, 0.7, 'quadIn')

        doTweenAlpha('byeAlpha3', 'cardTxt', 0, 0.7, 'quadIn')

    end
end

-- Made By Rayzen