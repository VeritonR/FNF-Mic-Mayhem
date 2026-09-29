local comboX = 590
local comboY = 60

function onCreatePost()
    -- camera mais alta de todas
    setObjectCamera('comboGroup', 'camHUD')

    -- posição
    setProperty('comboGroup.x', comboX)
    setProperty('comboGroup.y', comboY)
end

function onUpdatePost()
    -- força ficar sempre no topo
    setObjectOrder('comboGroup', getObjectOrder('healthBar') + 9999)
end