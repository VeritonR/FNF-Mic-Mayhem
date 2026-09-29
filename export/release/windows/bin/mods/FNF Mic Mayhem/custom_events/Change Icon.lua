```lua
function onEvent(name, value1, value2)
    if name == 'Change Opponent Icon' then

        if value1 ~= '' then
            runHaxeCode([[
                game.iconP2.changeIcon("]] .. value1 .. [[");
            ]])
        end

        if value2 ~= '' then
            local r, g, b = value2:match('(%d+)%s+(%d+)%s+(%d+)')

            if r and g and b then
                local color = (tonumber(r) * 65536) + (tonumber(g) * 256) + tonumber(b)

                runHaxeCode([[
                    game.iconP2.color = ]] .. color .. [[;
                ]])
            end
        end
    end
end
```
