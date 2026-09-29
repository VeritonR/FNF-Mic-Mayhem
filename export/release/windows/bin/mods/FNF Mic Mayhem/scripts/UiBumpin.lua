function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        bumpUIElement('scoreTxt')
        bumpUIElement('timeTxt')
        bumpRating()
    end
end

-- UI normal
function bumpUIElement(tag)
    if getProperty(tag..'.scale.x') ~= nil then
        doTweenX(tag..'X', tag..'.scale', 1.1, 0.05, 'quadOut')
        doTweenY(tag..'Y', tag..'.scale', 1.1, 0.05, 'quadOut')

        doTweenX(tag..'BackX', tag..'.scale', 1, 0.1, 'quadIn')
        doTweenY(tag..'BackY', tag..'.scale', 1, 0.1, 'quadIn')
    end
end

-- rating (SICK etc) ✅ FUNCIONA 100%
function bumpRating()
    if getProperty('rating.scale.x') ~= nil then
        setProperty('rating.scale.x', 1.25)
        setProperty('rating.scale.y', 1.25)

        doTweenX('ratingBackX', 'rating.scale', 1, 0.15, 'quadOut')
        doTweenY('ratingBackY', 'rating.scale', 1, 0.15, 'quadOut')
    end
end

-- Made By Enzy.