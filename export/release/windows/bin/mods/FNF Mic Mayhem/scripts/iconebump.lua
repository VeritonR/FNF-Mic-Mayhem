local bumpScale = 1.15
local bumpTime = 0.08
local returnTime = 0.12

local p1Scale = 1
local p2Scale = 1

function onCreatePost()
    p1Scale = getProperty('iconP1.scale.x')
    p2Scale = getProperty('iconP2.scale.x')
end

function onUpdatePost(elapsed)
    -- Mantém os dois ícones com a escala correta
    setProperty('iconP1.scale.y', getProperty('iconP1.scale.x'))
    setProperty('iconP2.scale.y', getProperty('iconP2.scale.x'))
end

-- Player apertou/acertou uma nota
function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        bumpIcon('iconP1', p1Scale)
    end
end

-- Oponente tocou uma nota
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        bumpIcon('iconP2', p2Scale)
    end
end

function bumpIcon(icon, normalScale)

    -- Cancela o tween anterior
    cancelTween(icon .. 'BumpX')
    cancelTween(icon .. 'BumpY')
    cancelTween(icon .. 'ReturnX')
    cancelTween(icon .. 'ReturnY')

    -- Dá o "bump"
    setProperty(icon .. '.scale.x', normalScale * bumpScale)
    setProperty(icon .. '.scale.y', normalScale * bumpScale)

    -- Volta suavemente
    doTweenX(
        icon .. 'ReturnX',
        icon .. '.scale',
        normalScale,
        returnTime,
        'quadOut'
    )

    doTweenY(
        icon .. 'ReturnY',
        icon .. '.scale',
        normalScale,
        returnTime,
        'quadOut'
    )
end