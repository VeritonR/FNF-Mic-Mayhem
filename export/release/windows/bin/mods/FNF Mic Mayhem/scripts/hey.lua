function onCreatePost()
    -- Nada precisa ser criado aqui
end

function onUpdate(elapsed)
    -- Detecta quando a tecla SPACE está sendo pressionada
    if keyboardJustPressed('SPACE') then
        characterPlayAnim('boyfriend', 'hey', true)
        setProperty('boyfriend.specialAnim', true)
    end
end