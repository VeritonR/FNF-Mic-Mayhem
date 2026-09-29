-- Set Song Length.lua (Psych Engine 1.0.4)
-- 💻 Made by Lua God 💻 — versão 5: transição suave SOMENTE quando o tempo aumenta
-- Exemplo: se songLength atual = 40000 ms e novo = 60000 ms → transição suave 1s
--          se songLength atual = 60000 ms e novo = 40000 ms → mudança instantânea

-- ⚙️ Configuração
local lerpDuration = 1.0   -- tempo da transição (segundos)
local showDebug = false    -- define true se quiser prints no console

-- Variáveis internas
local targetSongLength = nil
local currentSongLength = nil
local transitioning = false

-- Função: converte "MM:SS" em milissegundos
local function mmssToMs(str)
    if type(str) ~= 'string' then return nil end
    local m, s = string.match(str, '^(%d+)%s*:%s*(%d+)$')
    if not m or not s then return nil end
    return (tonumber(m) * 60 + tonumber(s)) * 1000
end

-- Evento principal
function onEvent(name, value1, value2)
    if name ~= 'Set Song Length' then return end

    local parsed = mmssToMs(value1) or tonumber(value1)
    if not parsed or parsed <= 0 then
        if showDebug then debugPrint('[Lua God 💻] ⚠️ Valor inválido: ' .. tostring(value1)) end
        return
    end

    local current = getProperty('songLength')
    if type(current) ~= 'number' then current = parsed end

    -- Se o novo valor for maior, faz transição suave
    if parsed > current then
        targetSongLength = parsed
        currentSongLength = current
        transitioning = true
        if showDebug then debugPrint('[Lua God 💻] Transição suave iniciada: ' .. current .. ' → ' .. parsed .. ' ms') end
    else
        -- Se for menor, aplica direto
        setProperty('songLength', parsed)
        targetSongLength = nil
        currentSongLength = parsed
        transitioning = false
        if showDebug then debugPrint('[Lua God 💻] Mudança instantânea: ' .. parsed .. ' ms') end
    end
end

-- Atualização por frame (suaviza apenas se necessário)
function onUpdate(elapsed)
    if not transitioning or not targetSongLength or not currentSongLength then return end

    local t = elapsed / lerpDuration
    if t > 1 then t = 1 end

    local diff = targetSongLength - currentSongLength
    currentSongLength = currentSongLength + diff * t

    if math.abs(targetSongLength - currentSongLength) < 1 then
        currentSongLength = targetSongLength
        transitioning = false
        if showDebug then debugPrint('[Lua God 💻] Transição concluída. Novo songLength: ' .. currentSongLength .. ' ms') end
    end

    setProperty('songLength', currentSongLength)
end
