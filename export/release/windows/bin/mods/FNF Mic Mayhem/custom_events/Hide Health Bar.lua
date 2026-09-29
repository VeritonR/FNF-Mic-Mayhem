function onEvent(n, v1, v2)
if n == 'Hide Health Bar' then
local hide = (v1 == 'true')
local alpha = hide and 0 or 1
local duration = tonumber(v2) or 1 
local tags = {'healthBar','iconP1','iconP2','scoreTxt','timeBar','timeTxt'}
for i = 1, #tags do
doTweenAlpha(tags[i]..'Fade', tags[i], alpha, duration)
end
end
end