-- Script created by Santiago.Xml [DEV] on discord.
-- Any problems relate to youtube or discord.

function onCreate()
	--background shit
	makeLuaSprite('bg', 'BancyBg/3Dbg', -600, -200); -- X and Y
	setScrollFactor('bg', 0.9, 0.9); 
	addLuaSprite('bg', false);
end


local shadname = "FLAG"

	function onCreatePost()
		initLuaShader("FLAG")
		setSpriteShader('bg', shadname)
	end
	
	function onUpdate(elapsed)
	setShaderFloat('bg', 'uWaveAmplitude', 0.1)
	setShaderFloat('bg', 'uFrequency', 5)
	setShaderFloat('bg', 'uSpeed', 5) -- Change the number to whatever you want to change the speed. (DEFAULT: 2)
		end

	function onUpdatePost(elapsed)
	setShaderFloat('bg', 'uTime', os.clock())
	end