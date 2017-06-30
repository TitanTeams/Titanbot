local function pre_process(msg)
   if msg.to.type ~= 'pv' then
chat = msg.to.id
user = msg.from.id
	local function check_newmember(arg, data)
		test = load_data(_config.moderation.data)
		lock_bots = test[arg.chat_id]['settings']['lock_bots']
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    if data.type_.ID == "UserTypeBot" then
      if not is_owner(arg.msg) and lock_bots == 'yes' then
kick_user(data.id_, arg.chat_id)
end
end
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_banned(data.id_, arg.chat_id) then
   if not lang then
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : *[ "..data.id_.." ]*\n_is banned_", 0, "md")
   else
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : *[ "..data.id_.." ]*\n_از گروه محروم است_", 0, "md")
end
kick_user(data.id_, arg.chat_id)
end
if is_gbanned(data.id_) then
     if not lang then
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : *[ "..data.id_.." ]*\n_is globally banned_", 0, "md")
    else
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : *[ "..data.id_.." ]*\n_از تمام گروه های ربات محروم است_", 0, "md")
   end
kick_user(data.id_, arg.chat_id)
     end
	end
	if msg.adduser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id,user_id=user,msg=msg})
	end
	if msg.joinuser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id,user_id=user,msg=msg})
	end
if is_silent_user(user, chat) then
del_msg(msg.to.id, msg.id)
end
if is_banned(user, chat) then
del_msg(msg.to.id, tonumber(msg.id))
    kick_user(user, chat)
   end
if is_gbanned(user) then
del_msg(msg.to.id, tonumber(msg.id))
    kick_user(user, chat)
      end
   end
end
local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
  local cmd = arg.cmd
if not tonumber(data.sender_user_id_) then return false end
if data.sender_user_id_ then
  if cmd == "ban" then
local function ban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_You can't ban_ *mods,owners and bot admins*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》شما نمیتوانید مدیران ، صاحبان گروه ، و ادمین های ربات رو از گروه محروم کنید", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is already_ *banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : *[ "..data.id_.." ]*\n* از گروه محروم بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_has been_ *banned*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : *[ "..data.id_.." ]*\n*از گروه محروم شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
   if cmd == "unban" then
local function unban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is not_ *banned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : *[ "..data.id_.." ]*\n*از گروه محروم نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_has been_ *unbanned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از محرومیت گروه خارج شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "silent" then
local function silent_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_You can't silent_ *mods,owners and bot admins*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》شما نمیتوانید توانایی چت کردن رو از مدیران ، صاحبان گروه ، و ادمین های ربات بگیرید", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is already_ *silent*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》از قبل توانایی چت کردن رو نداشت", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_added to_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*توانایی چت کردن رو از دست داد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, silent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "unsilent" then
local function unsilent_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is not_ *silent*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از قبل توانایی چت کردن را داشت*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_removed from_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*توانایی چت کردن رو به دست آورد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unsilent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "banall" then
local function gban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_You can't_ *globally ban* _other admins_", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》شما نمیتوانید ادمین های ربات رو از تمامی گروه های ربات محروم کنید", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is already_ *globally banned*", 0, "md")
    else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از گروه های ربات محروم بود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_has been_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از تمام گروه های ربات محروم شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, gban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "unbanall" then
local function ungban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is not_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از گروه های ربات محروم نبود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_has been_ *globally unbanned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از محرومیت گروه های ربات خارج شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ungban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "kick" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "🌐》_You can't kick_ *mods,owners and bot admins*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "🌐》شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو اخراج کنید", 0, "md")
   end
  else
     kick_user(data.sender_user_id_, data.chat_id_)
     end
  end
  if cmd == "delall" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "🌐》_You can't delete messages_ *mods,owners and bot admins*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "🌐》شما نمیتوانید پیام های مدیران،صاحبان گروه و ادمین های ربات رو پاک کنید", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(data.chat_id_, data.sender_user_id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "🌐》_All_ *messages* _of_ *[ "..data.sender_user_id_.." ]* _has been_ *deleted*", 0, "md")
      elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "🌐》*تمام پیام های* *[ "..data.sender_user_id_.." ]* *پاک شد*", 0, "md")
       end
    end
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "🌐》_کاربر یافت نشد_", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "🌐》*User Not Found*", 0, "md")
      end
   end
end
local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
  local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not arg.username then return false end
    if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
  if cmd == "ban" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_You can't ban_ *mods,owners and bot admins*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》شما نمیتوانید مدیران ، صاحبان گروه ، و ادمین های ربات رو از گروه محروم کنید", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is already_ *banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* از گروه محروم بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_has been_ *banned*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از گروه محروم شد*", 0, "md")
   end
end
   if cmd == "unban" then
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is not_ *banned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از گروه محروم نبود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_has been_ *unbanned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از محرومیت گروه خارج شد*", 0, "md")
   end
end
  if cmd == "silent" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_You can't silent_ *mods,owners and bot admins*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》شما نمیتوانید توانایی چت کردن رو از مدیران ، صاحبان گروه و ادمین های ربات بگیرید", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is already_ *silent*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از قبل توانایی چت کردن رو نداشت*", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_added to_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*توانایی چت کردن رو از دست داد*", 0, "md")
   end
end
  if cmd == "unsilent" then
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is not_ *silent*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از قبل توانایی چت کردن را داشت*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_removed from_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*توانایی چت کردن رو به دست آورد*", 0, "md")
   end
end
  if cmd == "banall" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_You can't_ *globally ban* _other admins_", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》شما نمیتوانید ادمین های ربات رو از تمامی گروه های ربات محروم کنید", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is already_ *globally banned*", 0, "md")
    else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از گروه های ربات محروم بود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_has been_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از تمام گروه های ربات محروم شد*", 0, "md")
   end
end
  if cmd == "unbanall" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_is not_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از گروه های ربات محروم نبود*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ : "..user_name.."\n🆔》ID : * "..data.id_.." *\n_has been_ *globally unbanned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر_ : "..user_name.."\n🆔》ایدی : * "..data.id_.." *\n*از محرومیت گروه های ربات خارج شد*", 0, "md")
   end
end
  if cmd == "kick" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_You can't kick_ *mods,owners and bot admins*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》شما نمیتوانید مدیران ، صاحبان گروه و ادمین های ربات رو اخراج کنید", 0, "md")
   end
  else
     kick_user(data.id_, arg.chat_id)
     end
  end
  if cmd == "delall" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_You can't delete messages_ *mods,owners and bot admins*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》شما نمیتوانید پیام های مدیران،صاحبان گروه و ادمین های ربات رو پاک کنید", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_All_ *messages* _of_ "..user_name.." *[ "..data.id_.." ]* _has been_ *deleted*", 0, "md")
      elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》*تمام پیام های* "..user_name.." *[ "..data.id_.." ]* *پاک شد*", 0, "md")
       end
    end
  end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_کاربر یافت نشد_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》*User Not Found*", 0, "md")
      end
   end
end
local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
chat = msg.to.id
user = msg.from.id
   if msg.to.type ~= 'pv' then
 if matches[1] == "kick" and is_mod(msg) or matches[1] == "اخراج" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="kick"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, matches[2]) then
   if not lang then
     tdcli.sendMessage(msg.to.id, "", 0, "🌐》_You can't kick mods,owners or bot admins_", 0, "md")
   elseif lang then
     tdcli.sendMessage(msg.to.id, "", 0, "🌐》شما نمیتوانید مدیران،صاحبان گروه و ادمین های ربات رو اخراج کنید", 0, "md")
         end
     else
kick_user(matches[2], msg.to.id)
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="kick"})
         end
      end
 if matches[1] == "delall" and is_mod(msg) or matches[1] == "پاک کردن پیام ها" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="delall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, matches[2]) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_You can't delete messages mods,owners or bot admins_", 0, "md")
     elseif lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》شما نمیتوانید پیام های مدیران ، صاحبان گروه و ادمین های ربات رو پاک کنید", 0, "md")
   end
     else
tdcli.deleteMessagesFromUser(msg.to.id, matches[2], dl_cb, nil)
    if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_All_ *messages* _of_ *[ "..matches[2].." ]* _has been_ *deleted*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*تمامی پیام های* *[ "..matches[2].." ]* *پاک شد*", 0, "md")
         end
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="delall"})
         end
      end
   end
 if matches[1] == "banall" and is_admin(msg) or matches[1] == "گلوبال مسدود" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="banall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_admin1(matches[2]) then
   if not lang then
    return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_You can't globally ban other admins_", 0, "md")
else
    return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*شما نمیتوانید ادمین های ربات رو از گروه های ربات محروم کنید*", 0, "md")
        end
     end
   if is_gbanned(matches[2]) then
   if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*User "..matches[2].."\nis already globally banned*", 0, "md")
    else
  return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*کاربر "..matches[2].."\nاز گروه های ربات محروم بود*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.to.id)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》*User "..matches[2].."\nhas been globally banned*", 0, "md")
    else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》*کاربر "..matches[2].."\nاز تمام گروه هار ربات محروم شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="banall"})
      end
   end
 if matches[1] == "unbanall" and is_admin(msg) or matches[1] == "ازاد گلوبال" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unbanall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_gbanned(matches[2]) then
     if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*User "..matches[2].."\nis not globally banned*", 0, "md")
    else
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*کاربر "..matches[2].."\nاز گروه های ربات محروم نبود*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》*User "..matches[2].."\nhas been globally unbanned*", 0, "md")
   else
return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》*کاربر "..matches[2].."\nاز محرومیت گروه های ربات خارج شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unbanall"})
      end
   end
   if msg.to.type ~= 'pv' then
 if matches[1] == "ban" and is_mod(msg) or matches[1] == "مسدود" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="ban"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, matches[2]) then
     if not lang then
    return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_You can't ban mods,owners or bot admins_", 0, "md")
    else
    return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*شما نمیتوانید مدیران ، صاحبان گروه و ادمین های ربات رو از گروه محروم کنید*", 0, "md")
        end
     end
   if is_banned(matches[2], msg.to.id) then
   if not lang then
  return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_User "..matches[2].."\nis already banned_", 0, "md")
  else
  return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*کاربر "..matches[2].."\nاز گروه محروم بود*", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.to.id)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》_User "..matches[2].."\nhas been banned_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》*کاربر "..matches[2].."\nاز گروه محروم شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
     tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="ban"})
      end
   end
 if matches[1] == "unban" and is_mod(msg) or matches[1] == "ازاد" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unban"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_banned(matches[2], msg.to.id) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_User "..matches[2].."\nis not banned_", 0, "md")
  else
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*کاربر "..matches[2].."\nاز گروه محروم نبود*", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》_User "..matches[2].."\nhas been unbanned_", 0, "md")
   else
return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》*کاربر "..matches[2].."\nاز محرومیت گروه خارج شد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unban"})
      end
   end
 if matches[1] == "silent" and is_mod(msg) or matches[1] == "مصوت" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="silent"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.to.id, matches[2]) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_You can't silent mods,leaders or bot admins_", 0, "md")
 else
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*شما نمیتوانید توانایی چت کردن رو از مدیران ، صاحبان گروه و ادمین های ربات بگیرید*", 0, "md")
        end
     end
   if is_silent_user(matches[2], chat) then
   if not lang then
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_User "..matches[2].."\nis already silent_", 0, "md")
   else
   return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*کاربر "..matches[2].."\nاز قبل توانایی چت کردن رو نداشت*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
    if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》_User "..matches[2].."\nadded to silent users list_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》*کاربر "..matches[2].."\nتوانایی چت کردن رو از دست داد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="silent"})
      end
   end
 if matches[1] == "unsilent" and is_mod(msg) or matches[1] == "صامت" and is_mod(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="unsilent"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_silent_user(matches[2], chat) then
     if not lang then
     return tdcli.sendMessage(msg.to.id, "", 0, "🌐》_User "..matches[2].."\nis not silent_", 0, "md")
   else
     return tdcli.sendMessage(msg.to.id, "", 0, "🌐》*کاربر "..matches[2].."\nاز قبل توانایی چت کردن رو داشت*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》_User "..matches[2].."\nremoved from silent users list_", 0, "md")
  else
 return tdcli.sendMessage(msg.to.id, msg.id, 0, "🌐》*کاربر "..matches[2].."\nتوانایی چت کردن رو به دست آورد*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="unsilent"})
      end
   end
		if matches[1]:lower() == 'clean' and is_owner(msg) or matches[1]:lower() == 'پاک کردن' and is_owner(msg) then
			if matches[2] == 'bans' or matches[2] == 'مسدود ها' then
				if next(data[tostring(chat)]['banned']) == nil then
     if not lang then
					return "🌐》_No_ *banned* _users in this group_"
   else
					return "🌐》*هیچ کاربری از این گروه محروم نشده*"
              end
				end
				for k,v in pairs(data[tostring(chat)]['banned']) do
					data[tostring(chat)]['banned'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
     if not lang then
				return "🌐》_All_ *banned* _users has been unbanned_"
    else
				return "🌐》*تمام کاربران محروم شده از گروه از محرومیت خارج شدند*"
           end
			end
			if matches[2] == 'silentlist' or matches[2] == 'لیست ساکت ها' then 
				if next(data[tostring(chat)]['is_silent_users']) == nil then
        if not lang then
					return "🌐》_No_ *silent* _users in this group_"
   else
					return "🌐》*لیست کاربران سایلنت شده خالی است*"
             end
				end
				for k,v in pairs(data[tostring(chat)]['is_silent_users']) do
					data[tostring(chat)]['is_silent_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				    end
       if not lang then
				return "🌐》*Silent list* _has been cleaned_"
   else
				return "🌐》*لیست کاربران سایلنت شده پاک شد*"
               end
			    end
        end
     end
		if matches[1]:lower() == 'clean' and is_sudo(msg) or matches[1]:lower() == 'پاک کردن' and is_sudo(msg) then
			if matches[2] == 'gbans' then
				if next(data['gban_users']) == nil then
    if not lang then
					return "🌐》_No_ *globally banned* _users available_"
   else
					return "🌐》*هیچ کاربری از گروه های ربات محروم نشده*"
             end
				end
				for k,v in pairs(data['gban_users']) do
					data['gban_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
      if not lang then
				return "🌐》_All_ *globally banned* _users has been unbanned_"
   else
				return "🌐》*تمام کاربرانی که از گروه های ربات محروم بودند از محرومیت خارج شدند*"
          end
			end
     end
if matches[1] == "gbanlist" and is_admin(msg) then
  return gbanned_list(msg)
 end
   if msg.to.type ~= 'pv' then
if matches[1] == "silentlist" and is_mod(msg) or matches[1] == "لیست ساکت ها" and is_mod(msg) then
  return silent_users_list(chat)
 end
if matches[1] == "banlist" and is_mod(msg) or matches[1] == "لیست مسدود ها" and is_mod(msg) then
  return banned_list(chat)
     end
  end
end
return {
	patterns = {
		"^[!/#](banall)$",
		"^[!/#](banall) (.*)$",
		"^[!/#](unbanall)$",
		"^[!/#](unbanall) (.*)$",
		"^[!/#](gbanlist)$",
		"^[!/#](ban)$",
    "^(مسدود)$",
		"^[!/#](ban) (.*)$",
    "^(مسدود) (.*)$",
		"^[!/#](unban)$",
    "^(ازاد)$",
		"^[!/#](unban) (.*)$",
    "^(ازاد) (.*)$",
		"^[!/#](banlist)$",
    "^(لیست مسدود ها)$",
		"^[!/#](silent)$",
    "^(مصوت)$",
		"^[!/#](silent) (.*)$",
    "^(صامت) (.*)$",
		"^[!/#](unsilent)$",
    "^(صامت)$",
		"^[!/#](unsilent) (.*)$",
    "^(صامت) (.*)$",
		"^[!/#](silentlist)$",
    "^(لیست ساکت ها)$",
		"^[!/#](kick)$",
    "^(اخراج)$",
		"^[!/#](kick) (.*)$",
    "^(اخراج) (.*)$",
		"^[!/#](delall)$",
    "^(پاک کردن پیام ها)$",
		"^[!/#](delall) (.*)$",
    "^(پاک کردن پیام ها) (.*)$",
		"^[!/#](clean) (.*)$",
    "^(پاک کردن) (.*)$",
	},
	run = run,
pre_process = pre_process
}

-- @Titanteams
