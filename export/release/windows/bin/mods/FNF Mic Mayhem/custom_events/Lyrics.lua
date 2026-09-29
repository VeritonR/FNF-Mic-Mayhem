function onCreate()

    makeLuaText('easyLyrics', '', 1200, 0, 0)
    setTextSize('easyLyrics', 38)
    setTextAlignment('easyLyrics', 'center')

    setTextColor('easyLyrics', 'FFFFFF')
    setTextBorder('easyLyrics', 3, '000000')

    setTextFont('easyLyrics', '8bit-jve.ttf')
    setObjectCamera('easyLyrics', 'camHUD')

    addLuaText('easyLyrics')

    screenCenter('easyLyrics', 'x')

    setProperty('easyLyrics.y', getProperty('healthBar.y') - 55)

    setProperty('easyLyrics.alpha', 0)
    setProperty('easyLyrics.scale.x', 1)
    setProperty('easyLyrics.scale.y', 1)

    baseY = getProperty('healthBar.y') - 55
end

function onEvent(name, value1, value2)

    if name == 'Easy Lyrics' then

        if value2 == '1' then

            cancelTween('lyricsHide')
            cancelTween('lyricsY')
            cancelTween('lyricsScaleX')
            cancelTween('lyricsScaleY')

            setTextString('easyLyrics', value1)

            screenCenter('easyLyrics', 'x')

            setProperty('easyLyrics.visible', true)
            setProperty('easyLyrics.alpha', 1)

            setProperty('easyLyrics.y', baseY + 12)

            setProperty('easyLyrics.scale.x', 1.15)
            setProperty('easyLyrics.scale.y', 1.15)

            doTweenY('lyricsY', 'easyLyrics', baseY, 0.12, 'cubeOut')
            doTweenX('lyricsScaleX', 'easyLyrics.scale', 1, 0.12, 'cubeOut')
            doTweenY('lyricsScaleY', 'easyLyrics.scale', 1, 0.12, 'cubeOut')

        elseif value2 == '2' then

            doTweenAlpha('lyricsHide', 'easyLyrics', 0, 0.08, 'linear')

        end

    end

end