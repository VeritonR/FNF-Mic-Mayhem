makeLuaSprite('b')
makeGraphic('b',1,1, '000000')
scaleObject('b',3600,2000,false)
screenCenter('b')
setScrollFactor('b', 0, 0)
setProperty('b.alpha', 0)
addLuaSprite('b')

function onEvent(n,v1,v2)
if n == 'Set blackbg' then
local targetAlpha = tonumber(v1)
if targetAlpha == nil then targetAlpha = 1 end
local fadeDuration = tonumber(v2)
if fadeDuration == nil then fadeDuration = 0.2 end
doTweenAlpha('bFade', 'b', targetAlpha, fadeDuration)
end
end