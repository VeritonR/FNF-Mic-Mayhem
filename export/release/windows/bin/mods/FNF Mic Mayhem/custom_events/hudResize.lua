local targetHUDZoom = 1
local lockZoom = false
function onEvent(n,v1,v2)
if n == 'hudResize' then
local zoom = tonumber(v1)
local speed = tonumber(v2)
if zoom == nil then zoom = 1 end
if speed == nil then speed = 1 end
targetHUDZoom = zoom
lockZoom = false
doTweenZoom('hudZoom', 'camHUD', zoom, speed, 'cubeInOut')
runTimer('lockZoomNow', speed)
end
end

function onTimerCompleted(t)
if t== 'lockZoomNow' then
lockZoom = true
end
end

function onUpdate()
if lockZoom then
setProperty('camHUD.zoom', targetHUDZoom)
end
end