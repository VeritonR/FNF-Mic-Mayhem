function onEvent(n,v1,v2)
if n == 'Hide Hud' then
local hide = (v1 == 'true')
local alpha = hide and 0 or 1
local duration = tonumber(v2) or 1 
doTweenAlpha('camHUDFade', 'camHUD', alpha, duration)
end
end