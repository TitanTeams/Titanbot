-- Begin lock_bots.lua
local function pre_process(msg)
	if is_mod(msg) then return end
	function del_bots(arg, data)
		if data.username_ then
			if string.sub(data.username_:lower(), -3) == 'bot' then
				kick_user(data.id_, arg.chat_id)
			end
		end
	end
	--اخراج با اضافه کردن بات به گروه
	if msg.adduser then
		local data = load_data(_config.moderation.data)
		local lock_bots = data[tostring(msg.chat_id_)]["settings"]["lock_bots"] 
		if lock_bots == 'yes' then
			tdcli_function ({ ID = "GetUser", user_id_ = msg.adduser }, del_bots, {chat_id=msg.chat_id_})
		end
	end
	

	
	 if msg.content_.text_ then
		 local data = load_data(_config.moderation.data)
		local lock_bots = data[tostring(msg.chat_id_)]["settings"]["lock_bots"] 
		 if lock_bots == 'yes' then
			tdcli_function ({ ID = "GetUser", user_id_ = msg.sender_user_id_ }, del_bots, {chat_id=msg.chat_id_})
		 end
	 end
	
end

return { patterns = {}, pre_process = pre_process}

-- @Titanteams