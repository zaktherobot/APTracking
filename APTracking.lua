function _OnInit()
if GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
	if ENGINE_VERSION < 5.0 then
		ConsolePrint('LuaBackend is Outdated. Things might not work properly.',2)
	end
	Save = 0x09A7070 - 0x56450E
end
current_emblem_count = 250 -- Starting this number with something large to force a file write at the beginning.
current_wttd_obtained = 50 -- Give this a dummy value so that it can be set to 0 or 1
end

function _OnFrame()
    if current_emblem_count ~= ReadByte(Save+0x3641) then
        current_emblem_count = ReadByte(Save+0x3641)
        local f = io.open("emblem_count.txt", "w")
        f:write(current_emblem_count)
        f:close()
    end
    if current_wttd_obtained ~= ReadByte(Save+0x35C1) then
        current_wttd_obtained = ReadByte(Save+0x35C1)
        local f = io.open("wttd_status.txt", "w")
        if current_wttd_obtained == 0 then
            f:write("☐")
        else
            f:write("☑")
        end
        f:close()
    end
end