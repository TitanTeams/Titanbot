local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return '#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants'
else
     return '#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '#》*Gяσυρ ιѕ αℓяєα∂у α∂∂є∂*✅♻️\n*group name :*'..msg.to.title..'\n➖➖➖➖➖➖➖\nℹ️All messages will be studied this group do not require installation\nby: ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
else
return '#》_گروه در لیست گروه پشتیبان ربات قبلا بوده است✅♻️_\nاسم گروه : '..msg.to.title..'\n➖➖➖➖➖➖➖\nℹ️تمام پیام های این گروه مورد برسی قرار میگیرد نیازی به نصب نیست\nتوسط: ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      settings = {
          set_name = msg.to.title,
          lock_link = 'yes',
          lock_tag = 'yes',
          lock_spam = 'yes',
          lock_webpage = 'no',
          lock_markdown = 'no',
          flood = 'yes',
          lock_bots = 'yes',
          lock_pin = 'no',
          welcome = 'no',
         mute_fwd = 'no',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'no',
                  mute_text = 'no',
                  mute_photos = 'no',
                  mute_gif = 'no',
                  mute_loc = 'no',
                  mute_doc = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
                   mute_all = 'no',
           mute_keyboard = 'no'
          },
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '#》*Gяσυρ нαѕ вєєη α∂∂є∂✅*\n*group name :*'..msg.to.title..'\n➖➖➖➖➖➖➖\nℹ️From now on all messages Group is examined\nby: ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
else
  return '#》گروه به لیست گروه های پشتیبانی اضافه شد✅\nاسم گروه : '..msg.to.title..'\n➖➖➖➖➖➖➖\nℹ️از این پس تمام پیام های گروه مورد برسی قرار میگیرد\nتوسط: ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants'
   else
        return '#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.idbnnn
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '#》*Gяσυρ ιѕ ησт α∂∂є∂❌*\n*group name :*'..msg.to.title..'\n➖➖➖➖➖➖➖\nℹ️Group Support groups are not in the list beginning with the !add instructions to install it'
else
    return '_#》گروه در لیست گروه های پشتیبانی نیست❌_\nاسم گروه : '..msg.to.title..'\n➖➖➖➖➖➖➖\nℹ️گروه در لیست گروه های پشتیبان نیست ابتدا با دستور نصب ان را نصب کنید'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '*#》Gяσυρ нαѕ вєєη яємσνє∂✅*\n*group name :*'..msg.to.title..'\n➖➖➖➖➖➖➖\nℹ️Group removed from the list of support groups and other messages are not examined this group\nby ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
 else
  return '_#》گروه از لیست گروه های پشتیبانی حذف شد✅_\nاسم گروه : '..msg.to.title..'\n➖➖➖➖➖➖➖\nℹ️گروه از لیست گروه های پشتیبان حذف شد و دیگر پیام های این گروه مورد برسی قرار نمیگیرد\nتوسط ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
end
end

local function filter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.to.id)]['filterlist'][(word)] then
   if not lang then
         return '#》_Wσя∂_ *'..word..'* _ιѕ αℓяєα∂у ƒιℓтєяє∂_♻️\n➖➖➖➖➖➖➖\nword : '..word..'\nℹ️The word was already filtering removes the need to filter not again\nby ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'

            else
         return '#》_کلمه_ *'..word..'* _از قبل فیلتر بود_♻️\n➖➖➖➖➖➖➖\nکلمه : '..word..'\nℹ️از قبل فیلتر بود این کلمه پاک میشود نیازی به فیلتر دوباره نیست\nتوسط ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return '#》_Wσя∂_ *'..word..'* _α∂∂є∂ тσ ƒιℓтєяє∂ ωσя∂ѕ ℓιѕт_✅\n➖➖➖➖➖➖➖\nword : '..word..'\nℹ️The word was added to the filter list will be cleared after the word\nby ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
            else
         return '#》_کلمه_ *'..word..'* _به لیست کلمات فیلتر اضافه شد_✅\n➖➖➖➖➖➖➖\nکلمه : '..word..'\nℹ️به لیست فیلتر اضافه شد از این پس این کلمه پاک میشود\nتوسط ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return '#》_Wσя∂_ *'..word..'* _яємσνє∂ ƒяσм ƒιℓтєяє∂ ωσя∂ѕ ℓιѕт_❌word :word : '..word..'\nℹ️The word in the list is not filtered and will not be cleared\nby ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
       elseif lang then
         return '#》_کلمه_ *'..word..'* _از لیست کلمات فیلتر حذف شد_❌\n➖➖➖➖➖➖➖\nکلمه : '..word..'\nℹ️کلمه از لیست فیلتر پاک شد دیگر این کلمه پاک نمیشود\nتوسط ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
     end
      else
       if not lang then
         return '#》_Wσя∂_ *'..word..'* _ιѕ ησт ƒιℓтєяє∂_\n➖➖➖➖➖➖➖\nword : '..word..'\nℹ️The word in the list is not filtered and will not be cleared\nby ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
       elseif lang then
         return '#》_کلمه_ *'..word..'* _از قبل فیلتر نبود_\n➖➖➖➖➖➖➖\nکلمه : '..word..'\nℹ️کلمه در لیست فیلتر نیست و پاک نمیشود\nتوسط ☆>*[*@'..check_markdown(msg.from.username or '')..'*]*'
      end
   end
end
local function run(msg, matches)
if matches[1]=="مقام من" and is_sudo(msg) or matches[1]=="me" and is_sudo(msg) then
return  "💻شما صاحب ربات و سودو میباشید"
elseif matches[1]=="مقام من" and is_admin(msg) then 
return  "🎯شما ادمین ربات و یک مقام پایین تر ازسودو میباشید"
elseif matches[1]=="مقام من" and is_owner(msg) then 
return  "🎩شما سازنده و صاحب گروه میباشید"
elseif matches[1]=="مقام من" and is_mod(msg) then 
return  "👷🏻شما کمک مدیراین گروه میباشید"
else
return  "🌀شما یک عضو عادی هستید"
end
end
local function modlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "#》*Gяσυρ ιѕ ησт α∂∂є∂❌*\n➖➖➖➖➖➖➖\nℹ️Group Support groups are not in the list beginning with the !add instructions to install it"
 else
    return "_#》گروه در لیست گروه های پشتیبانی نیست❌\n➖➖➖➖➖➖➖\n❗️_گروه در لیست گروه های پشتیبان نیست ابتدا با دستور نصب ان را نصب کنید"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
    return "#》_Nσ_ *мσ∂єяαтσя* _ιη тнιѕ gяσυρ_❗\n➖➖➖➖➖➖➖\nℹ️First order of !promote\nDeputy to the Group determines"
else
   return "#》_در این گروه هیچ معاونی برای ربات انتخاب نشده است❗_\n➖➖➖➖➖➖➖\nℹ️ابتدا با دستور ترفیع\nمعاون برای گروه تایین کنید"
  end
end
if not lang then
   message = '☆》📋*Lιѕт σƒ мσ∂єяαтσяѕ :*\n'
else
   message = '☆》📋لیست معاون های گروه \n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
if not lang then
    return "#》*Gяσυρ ιѕ ησт α∂∂є∂❌❗️*\n➖➖➖➖➖➖➖\nℹ️Group Support groups are not in the list beginning with the !add instructions to install it"
else
return "_#》گروه در لیست گروه های پشتیبانی نیست❌❗️_\n➖➖➖➖➖➖➖\nℹ️گروه در لیست گروه های پشتیبان نیست ابتدا با دستور نصب ان را نصب کنید"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return "#》_Nσ_ *σωηєя* _ιη тнιѕ gяσυρ_❕\n➖➖➖➖➖➖➖\nℹ️First, !setowner commands Manager for Group Set"
else
    return "#》هیچ مدیری برای ربات در این گروه انتخاب نشده است❕\n➖➖➖➖➖➖➖\nℹ️ابتدا با دستور تنظیم مدیر مدیر برای گروه تایین کنید"
  end
end
if not lang then
   message = '☆》📋*Lιѕт σƒ мσ∂єяαтσяѕ :*\n'
else
   message = '☆》📋*لیست مدیران گروه :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end
local function config(msg)
  local hash = "gp_lang:"..msg.to.id
  local lang = redis:get(hash)
  local data = load_data(_config.moderation.data)
  local administration = load_data(_config.moderation.data)
  local i = 1
  function padmin(extra,result,success)
    if not data[tostring(msg.chat_id_)] then
      if not lang then
        message = "#》*Gяσυρ ιѕ ησт α∂∂є∂❌*\n➖➖➖➖➖➖➖\nℹ️Group Support groups are not in the list beginning with the !add instructions to install it"
      else
        message = "#》گروه در لیست گروه های پشتیبانی نیست❌\n➖➖➖➖➖➖➖\nℹ️گروه در لیست گروه های پشتیبان نیست ابتدا با دستور نصب ان را نصب کنید"
      end
    end
    function set(arg, data)
      if data.username_ then
        user_name = '@'..check_markdown(data.username_)
      else
        user_name = check_markdown(data.first_name_)
      end
      administration[tostring(msg.to.id)]['mods'][tostring(data.id_)] = user_name
      save_data(_config.moderation.data, administration)
    end
    local admins = result.members_
    for i=0 , #admins do
      tdcli.getUser(admins[i].user_id_,set)
    end
    if not lang then
      message = "<b>All Moderators</b> has been added to <b>Moderators</b> !"
    else
      message = " تمامی ادمین های گروه به لیست معاون ربات اضافه شدند !"
    end
    tdcli.sendMessage(msg.to.id,msg.id_, 1,message, 1, "html")
  end
  tdcli.getChannelMembers(msg.to.id,0,'Administrators',200,padmin)
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "#》*Gяσυρ ιѕ ησт α∂∂є∂❌*\n➖➖➖➖➖➖➖\nℹ️Group Support groups are not in the list beginning with the !add instructions to install it", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#》گروه در لیست گروه های پشتیبانی نیست❌_\n➖➖➖➖➖➖➖\nℹ️گروه در لیست گروه های پشتیبان نیست ابتدا با دستور نصب ان را نصب کنید", 0, "md")
     end
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id_, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ αℓяєα∂у α_ *gяσυρ σωηєя*♻️\n➖➖➖➖➖➖➖\nℹ️No need to adjust before all commands for the user freedom", 0, "md") 
  else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل مدیر بود*♻️\n➖➖➖➖➖➖➖\nℹ️نیازی به تنظیم نیست از قبل تمام دستورات برای این کاربر ازاد بود", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησω тнє_ *gяσυρ σωηєя*✅\n➖➖➖➖➖➖➖\nℹ️He was released the band director can use all the commands for the robot", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*مدیر گروه شد*✅\n➖➖➖➖➖➖➖\nℹ️مدیر گروه شد تمام دستورات ربات برای وی ازاد شد و میتواند استفاده کند", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ αℓяєα∂у α_ *мσ∂єяαтσя*♻\n➖➖➖➖➖➖➖\nℹ️️Vice user to the group, all the orders he was free to not need to adjust again", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل معاون گروه بود*♻️\n➖➖➖➖➖➖➖\nℹ️کاربر از قبل معاون گروه بود و تمام دستورات برای او ازاد بود نیازی به تنظیم دوباره نیست", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_нαѕ вєєη_ *ρяσмσтє∂*✅\n➖➖➖➖➖➖➖\nℹ️Deputy Assistant Administrator User Group and help him go all the commands to be", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*معاون گروه شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر معاون گروه و کمک یار مدیر شد تمام دستورات برای وی ازاد شد", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησт α_ *gяσυρ σωηєя*❌\n➖➖➖➖➖➖➖\nℹ️User already was director general directives for he is free", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل مدیر نبود*❌\n➖➖➖➖➖➖➖\nℹ️کاربر از قبل مدیر نبود و دستورات عمومی برای او ازاد است", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ∂ємσтє σƒ_ *gяσυρ σωηєя*✅\n➖➖➖➖➖➖➖\nℹ️User fell from his position as director of public statements he is free today only", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام مدیر برکنار شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر از مقام مدیر گروه تنزل پیدا کرد اکنون فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησт α_ *мσ∂єяαтσя*❗️\n➖➖➖➖➖➖➖\nℹ️Robot deputy general instructions for the user and only he is free", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام معاون گروه برکنار شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر از مقام معاون گروه برکنار شد اکنون فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_нαѕ вєєη_ *∂ємσтє∂*\n➖➖➖➖➖➖➖\nℹ️User group was removed from his position as deputy general directives for he is free today only", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام معاون گروه برکنار شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر از مقام معاون گروه برکنار شد اکنون فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "id" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "", 0, "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "#》*Gяσυρ ιѕ ησт α∂∂є∂❌*\n➖➖➖➖➖➖➖\nℹGroup Support groups are not in the list beginning with the !add instructions to install it", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#》گروه در لیست گروه های پشتیبانی نیست❌_\n➖➖➖➖➖➖➖\nℹ️گروه در لیست گروه های پشتیبان نیست ابتدا با دستور نصب ان را نصب کنید", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ αℓяєα∂у α_ *gяσυρ σωηєя*♻️\n➖➖➖➖➖➖➖\nℹ️No need to adjust before all commands for the user freedom", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل مدیر بود*♻️\n➖➖➖➖➖➖➖\nℹ️نیازی به تنظیم نیست از قبل تمام دستورات برای این کاربر ازاد بود", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησω тнє_ *gяσυρ σωηєя*✅\n➖➖➖➖➖➖➖\nℹ️He was released the band director can use all the commands for the robot", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*مدیر گروه شد*✅\n➖➖➖➖➖➖➖\nℹ️مدیر گروه شد تمام دستورات ربات برای وی ازاد شد و میتواند استفاده کند", 0, "md")   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ αℓяєα∂у α_ *мσ∂єяαтσя*♻\n➖➖➖➖➖➖➖\nℹ️️Vice user to the group, all the orders he was free to not need to adjust again", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل معاون گروه بود*♻️\n➖➖➖➖➖➖➖\nℹ️کاربر از قبل معاون گروه بود و تمام دستورات برای او ازاد بود نیازی به تنظیم دوباره نیست", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_нαѕ вєєη_ *ρяσмσтє∂*✅\n➖➖➖➖➖➖➖\nℹ️Deputy Assistant Administrator User Group and help him go all the commands to be", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*معاون گروه شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر معاون گروه و کمک یار مدیر شد تمام دستورات برای وی ازاد شد", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησт α_ *gяσυρ σωηєя*❌\n➖➖➖➖➖➖➖\nℹ️User already was director general directives for he is free", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل مدیر نبود*❌\n➖➖➖➖➖➖➖\nℹ️کاربر از قبل مدیر نبود و دستورات عمومی برای او ازاد است", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ∂ємσтє σƒ_ *gяσυρ σωηєя*✅\n➖➖➖➖➖➖➖\nℹ️User fell from his position as director of public statements he is free today only", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام مدیر برکنار شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر از مقام مدیر گروه تنزل پیدا کرد اکنون فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησт α_ *мσ∂єяαтσя*❗️\n➖➖➖➖➖➖➖\nℹ️Robot deputy general instructions for the user and only he is free", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل معاون نبود*❗️\n➖➖➖➖➖➖➖\nℹ️کاربر معاون ربات نیست و فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_нαѕ вєєη_ *∂ємσтє∂*\n➖➖➖➖➖➖➖\nℹ️User group was removed from his position as deputy general directives for he is free today only", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام معاون گروه برکنار شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر از مقام معاون گروه برکنار شد اکنون فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
end
   if cmd == "id" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "#》Rєѕυℓт ƒσя📄 [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. ""..check_markdown(data.title_).."\n"
    .. " ["..data.id_.."]"
  else
     text = "#》اطلاعات برای📄 [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
         end
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "#》*Gяσυρ ιѕ ησт α∂∂є∂❌*\n➖➖➖➖➖➖➖\nℹGroup Support groups are not in the list beginning with the !add instructions to install it", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_#》گروه در لیست گروه های پشتیبانی نیست❌_\n➖➖➖➖➖➖➖\nℹ️گروه در لیست گروه های پشتیبان نیست ابتدا با دستور نصب ان را نصب کنید", 0, "md")
     end
  end
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ αℓяєα∂у α_ *gяσυρ σωηєя*♻️\n➖➖➖➖➖➖➖\nℹ️No need to adjust before all commands for the user freedom", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل مدیر بود*♻️\n➖➖➖➖➖➖➖\nℹ️نیازی به تنظیم نیست از قبل تمام دستورات برای این کاربر ازاد بود", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησω тнє_ *gяσυρ σωηєя*✅\n➖➖➖➖➖➖➖\nℹ️He was released the band director can use all the commands for the robot", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*مدیر گروه شد*✅\n➖➖➖➖➖➖➖\nℹ️مدیر گروه شد تمام دستورات ربات برای وی ازاد شد و میتواند استفاده کند", 0, "md")   end
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ αℓяєα∂у α_ *мσ∂єяαтσя*♻\n➖➖➖➖➖➖➖\nℹ️️Vice user to the group, all the orders he was free to not need to adjust again", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل معاون گروه بود*♻️\n➖➖➖➖➖➖➖\nℹ️کاربر از قبل معاون گروه بود و تمام دستورات برای او ازاد بود نیازی به تنظیم دوباره نیست", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ∂ємσтє σƒ_ *gяσυρ σωηєя*✅\n➖➖➖➖➖➖➖\nℹ️User fell from his position as director of public statements he is free today only", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام مدیر برکنار شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر از مقام مدیر گروه تنزل پیدا کرد اکنون فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησт α_ *gяσυρ σωηєя*❌\n➖➖➖➖➖➖➖\nℹ️User already was director general directives for he is free", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام مدیر برکنار شد*✅", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ∂ємσтє σƒ_ *gяσυρ σωηєя*✅", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام مدیر برکنار شد*✅", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_ιѕ ησт α_ *мσ∂єяαтσя*❗️\n➖➖➖➖➖➖➖\nℹ️Robot deputy general instructions for the user and only he is free", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از قبل معاون نبود*❗️\n➖➖➖➖➖➖➖\nℹ️کاربر معاون ربات نیست و فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》_Uѕєя_ "..user_name.."\n🆔》ID : *"..data.id_.."*\n_нαѕ вєєη_ *∂ємσтє∂*\n➖➖➖➖➖➖➖\nℹ️User group was removed from his position as deputy general directives for he is free today only", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "🌐》کاربر : "..user_name.."\n🆔》ایدی : *"..data.id_.."*\n*از مقام معاون گروه برکنار شد*✅\n➖➖➖➖➖➖➖\nℹ️کاربر از مقام معاون گروه برکنار شد اکنون فقط دستورات عمومی برای او ازاد است", 0, "md")
   end
end
    if cmd == "whois" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
if not lang then
username = '☆》ησт ƒσυη∂❗️'
 else
username = '☆》ندارد❗️'
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, '☆》Iηƒσ ƒσя📃 [ '..data.id_..' ] :\n👤UѕєяNαмє : '..username..'\n💎Nαмє : '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, '☆》اطلاعات برای📃  [ '..data.id_..' ] :\n👤یوزرنیم : '..username..'\n💎نام : '..data.first_name_, 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
    end
  end
end


---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return '#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants'
else
 return '#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است'
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "☆》*Lιηк* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Remove the lock was already active links and messages containing links will be removed not need to lock again\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #لینک در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن لینک از قبل فعال بود و پیام های حاوی لینک حذف خواهند شد نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Lιηк* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock link was active from now on all messages containing links will be deleted\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال #لینک در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل لینک فعال شد از این پس تمام پیام های حاوی لینک پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return "☆》*Lιηк* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send links from messages containing links to is not prohibited and can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
return "☆》ارسال #لینک در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال لینک از قبل ممنوع نیست و پیام های حاوی لینک پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Lιηк* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send link in the group was released and messages containing links can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال #لینک در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال لینک در گروه ازاد شد و پیام های حاوی لینک پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
if not lang then
 return "☆》*username* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Clear lock  and username [@] was already active and will be deleted messages containing not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #یوزرنیم در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن یوزرنیم[@] از قبل فعال بود و پیام های حاوی ان حذف خواهند شد نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*userneme* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock username [@] was activated from now on all messages containing it will be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال #یوزرنیم در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل  یوزرنیم [@] فعال شد از این پس تمام پیام های حاوی ان پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
if not lang then
return "☆》*username* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send a  username [@] is not prohibited from before and messages containing links can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》ارسال یوزرنیم در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال یوزرنیم [@] از قبل ممنوع نیست و پیام های حاوی لینک پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*username* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send a  username [@] in the group was released and messages containing it can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》ارسال #یوزرنیم در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال یوزرنیم [@] در گروه ازاد شد و پیام های حاوی ان پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Lock hashTag-------------------
local function lock_hashtag(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_hashtag = data[tostring(target)]["settings"]["lock_hashtag"] 
if lock_hashtag == "yes" then
if not lang then
 return "☆》*Tαg* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Clear lock hashtag [#]  was already active and will be deleted messages containing not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #هشتگ در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن هشتگ [#]  از قبل فعال بود و پیام های حاوی ان حذف خواهند شد نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["lock_hashtag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Tαg* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock hashtag [#] was activated from now on all messages containing it will be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال #هشتگ  در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل هشتگ [#] فعال شد از این پس تمام پیام های حاوی ان پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_hashtag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_hashtag"]
 if lock_hashtag == "no" then
if not lang then
return "☆》*Tαg* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send a hashtag [#] is not prohibited from before and messages containing links can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》ارسال #هشتگ در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال هشتگ [#] از قبل ممنوع نیست و پیام های حاوی لینک پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_hashtag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Tαg* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send a hashtag [#] in the group was released and messages containing it can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال #هشتگ و یوزرنیم در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال هشتگ [#] در گروه ازاد شد و پیام های حاوی ان پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "☆》*Mєηтιση* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Remove the lock was already active calls and messages will be deleted with no need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #فراخوانی در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن فراخوانی از قبل فعال بود و پیام های حاوی ان حذف خواهند شد نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
 return "☆》*Mєηтιση* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Call lock was activated from now on all messages containing it will be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else 
 return "☆》ارسال #فراخوانی در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل فراخوانی فعال شد از این پس تمام پیام های حاوی ان پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "☆》*Mєηтιση* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Not prohibited from forwarding calls to and messages containing links can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》ارسال #فراخوانی در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال فراخوانی از قبل ممنوع نیست و پیام های حاوی لینک پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mєηтιση* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send calling in the group was released and messages containing it can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال # فراخوانی در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال  فراخوانی در گروه ازاد شد و پیام های حاوی ان پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
 return "☆》*Pєяѕιαη* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Remove the lock was already active Farsi and Persian removed messages containing letters do not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #کلمات فارسی در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن فارسی از قبل فعال بود و پیام های حاوی حروف فارسی حذف خواهند شد نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Pєяѕιαη* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Persian lock was activated from now on all messages containing Persian letters will be erased\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال #کلمات فارسی در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل فارسی فعال شد از این پس تمام پیام های حاوی حروف فارسی پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return "☆》*Pєяѕιαη* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Write letters and messages containing links Farsi is not prohibited from before can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》ارسال #کلمات فارسی در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال حروف فارسی از قبل ممنوع نیست و پیام های حاوی لینک پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Pєяѕιαη* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send letters of Persian in the group was released and messages containing it can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال #کلمات فارسی در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال حروف فارسی در گروه ازاد شد و پیام های حاوی ان پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
 return "☆》*E∂ιтιηg* _Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Clear lock to enable editing of the edited message will be deleted and not need to lock again\nby ☆*>*[@"..check_markdown(msg.from.username or "")..""
elseif lang then
 return "☆》#ویرایش پیام در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن ویرایش از قبل فعال بود و پیام های ویرایش شده پاک خواهند شد و نیازی به قفل دوباره نیست\nتوسط ☆*>*[@"..check_markdown(msg.from.username or "")..""
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*E∂ιтιηg* _Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️The lock was activated from now on all messages will be erased Edit\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》#ویرایش پیام در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل ویرایش فعال شد از این پس تمام پیام های ویرایش شده پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return "☆》*E∂ιтιηg* _Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Edit Message to edit messages were not prohibited and can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》#ویرایش پیام در گروه از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ویرایش پیام از قبل ممنوع نیست و پیام های ویرایش شده پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*E∂ιтιηg* _Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Edit message was released in edited message can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》#ویرایش پیام در گروه ازاد است🔓\n➖➖➖➖➖➖➖\nℹ️ویرایش پیام در گروه ازاد شد و پیام های ویرایش شده پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "☆》*Sραм* _Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock out spam (long message) was already active and will be deleted messages containing not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #هرزنامه ( اسپم) در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن هرزنامه (پیام بلند) از قبل فعال بود و پیام های حاوی آن حذف خواهند شد نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Sραм* _Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Spam lock (long message) was activated from now on all messages that contain it will be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال #هرزنامه ( اسپم) در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل هرزنامه (پیام بلند) فعال شد از این پس تمام پیام های حاوی آن پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return "☆》*Sραм* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Spam (long message) is not prohibited from before and messages containing spam (long messages) can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #هرزنامه (اسپم) در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال هرزنامه (پیام بلند) از قبل ممنوع نیست و پیام های حاوی هرزنامه (پیام بلند) پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
if not lang then 
return "☆》*Sραм* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Spam (long message) in the group was released and messages containing it can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال #هرزنامه (اسپم) در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال هرزنامه (پیام بلند) در گروه ازاد شد و پیام های حاوی آن پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
 return "☆》*Fℓσσ∂ιηg* _Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Clear lock to activate a barrage of messages, and messages will be deleted and the user trespassing fired a barrage, and does not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #پیام مکرر در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن پیام های رگباری از قبل فعال بود و پیام های رگباری حذف خواهند شد و کاربر خاطی اخراج میشود و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Fℓσσ∂ιηg* _Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock messages barrage barrage was activated from now on all messages will be deleted and the user gets fired trespassing\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال # پیام مکرر در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل  پیام های رگباری فعال شد از این پس تمامی پیام های رگباری پاک خواهند شد و کاربر خاطی اخراج میشود\nتوسط  ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return "☆》*Flooding* _Is Not Locked_🔒\n➖➖➖➖➖➖➖\nℹ️Send a message to is not prohibited by a barrage of showers and messages can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》ارسال #پیام مکرر در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال پیام های رگباری از قبل ممنوع نیست و پیام های رگباری پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Flooding* _Has Been Unlocked_🔒\n➖➖➖➖➖➖➖\nℹ️Send a message to is not prohibited by a barrage of showers and messages can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》ارسال #پیام مکرر در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال پیام های رگباری از قبل ممنوع نیست و پیام های رگباری پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "☆》*Bσтѕ* _Pяσтєcтιση Iѕ Aℓяєα∂у Eηαвℓє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock robot was already active malicious and destructive robots will be deleted and not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》#محافظت از گروه در برابر ربات ها از قبل فعال است🔒\n➖➖➖➖➖➖➖\nℹ️قفل ربات های مخرب از قبل فعال بود و ربات های مخرب حذف خواهند شد و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Bσтѕ* _Pяσтєcтιση Hαѕ Bєєη Eηαвℓє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock malicious bot was active from now on all malicious robots will be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》#محافظت از گروه در برابر ربات ها  فعال شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل ربات های مخرب فعال شد از این پس تمامی ربات های مخرب پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "☆》*Bσтѕ* _Pяσтєcтιση Iѕ Nσт Eηαвℓє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Sanctions malicious bot to bot malware is not prohibited and can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
return "محافظت از گروه در برابر ربات ها غیر فعال است\n➖➖➖➖➖➖➖\nℹ️تحریم ربات های مخرب از قبل ممنوع نیست و ربات های مخرب پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Bσтѕ* _Pяσтєcтιση Hαѕ Bєєη Dιѕαвℓє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Sanctions malicious bot was released in destructive robots can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》#محافظت از گروه در برابر ربات ها  ازاد است🔒\n➖➖➖➖➖➖➖\nℹ️تحریم ربات های مخرب در گروه ازاد شد و ربات های مخرب پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
 return "☆》*Mαяк∂σωη* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock text fonts you already have active and full text fonts will be deleted and not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #پیام دارای فونت در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل متن داری فونت از قبل فعال بود و تمامی متن های دارای فونت حذف خواهند شد و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mαяк∂σωη* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Text lock has been activated from now on all text fonts with font will be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال #پیام دارای فونت در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل متن دارای فونت فعال شد از این پس تمامی متن های دارای فونت پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return "☆》*Mαяк∂σωη* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send text has not prohibited the font of the text with font can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
return "☆》ارسال #پیام دارای فونت در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال متن دارای فونت از قبل ممنوع نیست و متن های دارای فونت پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mαяк∂σωη* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send text has been freed and text fonts in a font can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》ارسال #پیام درای فونت در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال متن دارای فونت در گروه ازاد شد و متن های دارای فونت پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
 return "☆》*Wєвραgє* _Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock was already active web pages and all links will be deleted web pages and does not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال #صفحات وب در گروه  از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل صفحات تحت وب از قبل فعال بود و تمامی  لینک صفحات تحت وب حذف خواهند شد و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Wєвραgє* _Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock enabled web page will be deleted from the following link all web pages\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال #صفحات وب در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل صفحات تحت وب فعال شد از این پس  لینک تمامی صفحات تحت وب پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return "☆》*Wєвραgє* _Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Web pages are not prohibited and link to web page can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》ارسال #صفحات وب در گروه  از قبل ممنوع نیست🔓\n➖➖➖➖➖➖➖\nℹ️ارسال صفحات تحت وب از قبل ممنوع نیست و  لینک صفحات تحت وب پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Wєвραgє* _Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send web pages was released in the web page can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال #صفحات وب در گروه  ازاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال صفحات تحت وب در گروه ازاد شد و صفحات تحت وب پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
if not lang then
 return "☆》*Pιηηє∂ Mєѕѕαgє* _Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock pins and pin messages to the active message has been banned and not need to lock again\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》سنجاق کردن پیام در گروه از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل سنجاق پیام از قبل فعال بود و سنجاق پیام ممنوع شده و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Pιηηє∂ Mєѕѕαgє* _Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Pin lock pin message was activated after this message is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》سنجاق کردن پیام در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل سنجاق پیام فعال شد از این پس سنجاق پیام ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "☆》*Pιηηє∂ Mєѕѕαgє* _Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Pin message is not prohibited and is free to\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》سنجاق کردن پیام در گروه ممنوع نمیباشد🔓\n➖➖➖➖➖➖➖\nℹ️سنجاق پیام از قبل ممنوع نیست و آزاد میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Pιηηє∂ Mєѕѕαgє* _Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Pin message was released in groups is forbidden\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》سنجاق کردن پیام در گروه آزاد شد🔓\n➖➖➖➖➖➖➖\nℹ️سنجاق پیام در گروه ازاد شد و ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Lock English-------------------
local function lock_english(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_english = data[tostring(target)]["settings"]["english"] 
if lock_english == "yes" then
if not lang then
 return "☆》*Eηgℓιѕн* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️English letters and messages containing pre-activated lock English letters will be deleted and not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》نوشته انگلیسی در گروه از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل حروف انگلیسی از قبل فعال بود و پیام های حاوی حروف انگلیسی پاک خواهند شد و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["english"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Eηgℓιѕн* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️English caps lock is activated from now on all messages containing English letters will be erased\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》نوشته انگلیسی در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل حروف انگلیسی فعال شد از این پس تمامی پیام های حاوی حروف انگلیسی پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_english = data[tostring(target)]["settings"]["english"]
 if lock_english == "no" then
if not lang then
return "☆》*єηgℓιѕн* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Write letters and messages containing banned English from the English letters can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》نوشته انگلیسی در گروه ممنوع نمیباشد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال حروف انگلیسی از قبل ممنوع نیست و پیام های حاوی حروف انگلیسی پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["english"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Eηgℓιѕн* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send letters of the English in the group was released and messages containing English letters can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》نوشته انگلیسی در گروه آزاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال حروف انگلیسی  در گروه ازاد شد و پیام های حاوی حروف انگلیسی پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Lock Emoji-------------------
local function lock_emoji(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_emoji = data[tostring(target)]["settings"]["emoji"] 
if lock_emoji == "yes" then
if not lang then
 return "☆》*Eмσנι* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock emoticons (emoji) was pre-activated and send emoticons (emoji) is prohibited and will not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》نوشته ایموجی در گروه از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل شکلک (ایموجی) از قبل فعال بود و ارسال شکلک (ایموجی) ممنوع میباشد و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["emoji"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Eмσנι* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock emoticons (emoji) is enabled it will send emoticons (emoji) is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》نوشته ایموجی در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل شکلک (ایموجی) فعال شد از این پس ارسال شکلک (ایموجی) ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_emoji(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_emoji = data[tostring(target)]["settings"]["emoji"]
 if lock_emoji == "no" then
if not lang then
return "☆》*Eмσנι* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send emoticons (emoji) is not prohibited in advance and send Emoji is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》نوشته ایموجی در گروه ممنوع نمیباشد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال شکلک (ایموجی) از قبل ممنوع نیست و  ارسال اموجی ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["emoji"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*Eмσנι* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send emoticons (emoji) in the group was released and emoticons (emoji) will not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》نوشته ایموجی در گروه آزاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال شکلک (ایموجی) در گروه ازاد شد و شکلک (ایموجی) پاک نمیشود\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Lock Ads-------------------
local function lock_ads(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_ads = data[tostring(target)]["settings"]["ads"] 
if lock_ads == "yes" then
if not lang then
 return "☆》*A∂ѕ* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Advertising lock (challenge) was already active and content of advertisements (challenge) will be deleted and not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال تبلیغات در گروه از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل تبلیغات (چالش و...) از قبل فعال بود و محتوای حاوی تبلیغات (چالش و...) حذف خواهند شد و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["ads"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*A∂ѕ* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_\n➖➖➖➖➖➖➖\nℹ️Advertising lock (challenge) was activated from now on all messages containing advertising (challenge) will be deleted\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال تبلیغات در گروه ممنوع شد\n➖➖➖➖➖➖➖\nℹ️قفل تبلیغات (چالش و...) فعال شد از این پس تمامی پیام های حاوی تبلیغات (چالش و...) پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_ads(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_ads = data[tostring(target)]["settings"]["ads"]
 if lock_ads == "no" then
if not lang then
return "☆》*α∂ѕ* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Advertising (challenge) is not prohibited from before and messages containing advertising (and challenges) can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "ارسال تبلیغات در گروه ممنوع نمیباشد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال تبلیغات (چالش و...) از قبل ممنوع نیست و پیام های حاوی تبلیغات (چالش و...) پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["ads"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*A∂ѕ* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Advertising (and challenges) in the group was released and messages containing advertising (and challenges) can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال تبلیغات در گروه آزاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال تبلیغات (چالش و...) در گروه ازاد شد و پیام های حاوی تبلیغات (چالش و...) پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Lock Vewis-------------------
local function lock_views(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_views = data[tostring(target)]["settings"]["views"] 
if lock_views == "yes" then
if not lang then
 return "☆》*Vιєωѕ* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock messages with Visitors (Sin) was activated and messages have already visited (Sin) will be deleted not need to lock again\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال پست ویو دار در گروه از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پیام های دارای بازدید (سین) از قبل فعال بود و پیام های دارای  بازدید (سین)  حذف خواهند شد نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["views"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Vιєωѕ* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock messages with Visitors (Sin) was activated from now on all messages with Visitors (Sin) will be deleted\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال پست ویو دار در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل پیام های دارای بازدید (سین) فعال شد از این پس تمامی پیام های دارای بازدید (سین)  پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_views(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_views = data[tostring(target)]["settings"]["views"]
 if lock_views == "no" then
if not lang then
return "☆》*Vιєωѕ* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send messages with Visitors (Sein) is not prohibited from before and messages with flashing can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》ارسال پست ویو دار در گروه ممنوع نمیباشد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال پیام های دارای بازدید(سین) از قبل ممنوع نیست و پیام های دارای بازدید(سین) پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["views"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Vιєωѕ* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send messages with Visitors (Sin) was released in groups have visited messages (Sin) can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال پست ویو دار در گروه آزاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال پیام های دارای بازدید(سین) در گروه ازاد شد و پیام های دارای  بازدید(سین) پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
local function lock_fosh(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_fosh = data[tostring(target)]["settings"]["fosh"] 
if lock_fosh == "yes" then
if not lang then
 return "☆》*Fosh* _Posting Is Already Locked_🔒\n➖➖➖➖➖➖➖\nℹ️Lock vulgar words (swearing) was already active and messages containing vulgar words (swearing) will be deleted and not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال کلمات رکیک در گروه از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل  کلمات رکیک (فحش) از قبل فعال بود و پیام های حاوی کلمات رکیک (فحش) پاک خواهند شد و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["fosh"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Fσѕн* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️Lock vulgar words (swearing) was activated from now on all messages containing vulgar words (swearing) will be deleted\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال کلمات رکیک در گروه ممنوع شد🔒\n➖➖➖➖➖➖➖\nℹ️قفل کلمات رکیک (فحش) فعال شد از این پس تمامی پیام های حاوی کلمات رکیک (فحش) پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_fosh(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_fosh = data[tostring(target)]["settings"]["english"]
 if lock_fosh == "no" then
if not lang then
return "☆》*Fσѕн* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Arsalklmat profanity (cursing) is not prohibited from before and messages containing vulgar words (swearing) can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》ارسال کلمات رکیک در گروه ممنوع نمیباشد🔓\n➖➖➖➖➖➖➖\nℹ️ارسالکلمات رکیک (فحش) از قبل ممنوع نیست و پیام های حاوی کلمات رکیک (فحش) پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["fosh"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Fσѕн* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️Send vulgar words (swearing) in the group was released and messages containing vulgar words (swearing) can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال کلمات رکیک در گروه آزاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال کلمات رکیک (فحش) در گروه ازاد شد و پیام های حاوی کلمات رکیک (فحش) پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "☆》*Pιηηє∂ Mєѕѕαgє* _Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️" 
elseif lang then
return "☆》سنجاق کردن پیام در گروه ممنوع نمیباشد🔓\n➖➖➖➖➖➖➖\nℹ️"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Pιηηє∂ Mєѕѕαgє* _Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️" 
else
return "☆》سنجاق کردن پیام در گروه آزاد شد🔓\n➖➖➖➖➖➖➖\nℹ️"
end
end
end
---------------Lock tab-------------------
local function lock_tab(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local lock_tab = data[tostring(target)]["settings"]["tab"] 
if lock_tab == "yes" then
if not lang then
 return "☆》*Tabchi* _Pσѕтιηg Iѕ Aℓяєα∂у Lσcкє∂_🔒\n➖➖➖➖➖➖➖\nℹ️lock (TABCHI) was already active and content of  (tabchi) will be deleted and not need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》ارسال پیام اضافه کردن شماره در گروه از قبل ممنوع است🔒\n➖➖➖➖➖➖➖\nℹ️قفل پیام اضافه کردن شماره از قبل فعال بود و محتوای حاوی پیام اضافه کردن شماره حذف خواهند شد و نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["tab"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*tabchi* _Pσѕтιηg Hαѕ Bєєη Lσcкє∂_\n➖➖➖➖➖➖➖\nℹ️lock (tabchi) was activated from now on all messages containing  (tabchi) will be deleted\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》ارسال پیام اضافه کردن شماره در گروه ممنوع شد\n➖➖➖➖➖➖➖\nℹ️قفل اضافه کردن شماره فعال شد از این پس تمامی پیام های حاوی پیام اضافه کردن شماره پاک خواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unlock_tab(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local lock_tab = data[tostring(target)]["settings"]["tab"]
 if lock_tab == "no" then
if not lang then
return "☆》*tabchi* _Pσѕтιηg Iѕ Nσт Lσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️(tabchi) is not prohibited from before and messages containing (tachi) can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "ارسال پیام اضافه کردن شماره در گروه ممنوع نمیباشد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال پیام اضافه کردن شماره از قبل ممنوع نیست و پیام های حاوی پیام اضافه کردن شماره پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["tab"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "☆》*tabchi* _Pσѕтιηg Hαѕ Bєєη Uηℓσcкє∂_🔓\n➖➖➖➖➖➖➖\nℹ️(tabchi) in the group was released and messages containing advertising (and challenges) can not be cleared\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》ارسال پیام اضافه کردن شماره در گروه آزاد شد🔓\n➖➖➖➖➖➖➖\nℹ️ارسال پیام اضافه کردن شماره در گروه ازاد شد و پیام های حاوی پیام اضافه کردن شماره پاک نخواهند شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
--------Mutes---------
--------Mute all--------------------------
local function mute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants" 
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_all = data[tostring(target)]["settings"]["mute_all"] 
if mute_all == "yes" then 
if not lang then
return "☆》*Mυтє Aℓℓ* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Delete all messages beforehand was active from now on all the northern group text messages and deleted photos\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
return "☆》بیصدا کردن #همه  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن تمامی پیام ها  از قبل فعال بود از این پس تمامی پیام های گروه شمال متن عکس و... پاک میشوند\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Aℓℓ* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Erase all messages activated from now on all the northern group text messages and deleted photos\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》بیصدا کردن #همه فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن تمامی پیام ها فعال شد از این پس تمامی پیام های گروه شمال متن عکس و... پاک میشوند\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "♯》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Erase all messages activated from now on all the northern group text messages and deleted photos" 
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️پاک کردن تمامی پیام ها فعال شد از این پس تمامی پیام های گروه شمال متن عکس و... پاک میشوند"
end
end

local mute_all = data[tostring(target)]["settings"]["mute_all"] 
if mute_all == "no" then 
if not lang then
return "☆》*Mυтє Aℓℓ* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Erase all messages disabled and do not have to disable again\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #همه فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن تمامی پیام ها غیرفعال میباشد و نیازی به غیر فعال کردن دوباره ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Aℓℓ* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Erase all messages disabled and out of silent mode\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #همه غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن تمامی پیام ها غیر فعال شد و گروه از حالت سکوت خارج شد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end 
end
end

---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_gif = data[tostring(target)]["settings"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
 return "☆》*Mυтє Gιƒ* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Remove the lock was already active animated images[gif] and messages will be deleted with no need to lock again.\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #تصاویر متحرک  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️قفل پاک کردن تصاویر متحرک[گیف] از قبل فعال بود و پیام های حاوی آن حذف خواهند شد نیازی به قفل دوباره نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
 return "☆》*Mυтє Gιƒ* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear Motion Picture [Gyf] is activated it will send the Motion [Gyf] ban\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #تصاویر متحرک فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن تصاویر متحرک [گیف] فعال شد از این پس ارسال تصاویر متحرک [گیف] ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_gif = data[tostring(target)]["settings"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
return "☆》*Mυтє Gιƒ* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear Motion Picture [Gyf] is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #تصاویر متحرک فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن تصاویر متحرک [گیف] فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Gιƒ* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear Motion Picture [Gyf] was inactive and write Savyr Motion [Gyf] is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن # تصاویر متحرک غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن تصاویر متحرک [گیف] غیر فعال شد و  ارسال صاویر متحرک [گیف] ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_game = data[tostring(target)]["settings"]["mute_game"] 
if mute_game == "yes" then
if not lang then
 return "☆》*Mυтє Gαмє* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear the game was already enabled web browser game is prohibited Post\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #بازی های تحت وب  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن بازی تحت وب  از قبل فعال بود و ارسال بازی تحت وب ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Gαмє* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear Web-enabled games it will send the browser game is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #بازی های تحت وب   فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن بازی های تحت وب فعال شد از این پس ارسال بازی تحت وب ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local mute_game = data[tostring(target)]["settings"]["mute_game"]
 if mute_game == "no" then
if not lang then
return "☆》*Mυтє Gαмє* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear browser game is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #بازی های تحت وب فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن بازی تحت وب فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "☆》*Mυтє Gαмє* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear off the web games and web games is not prohibited Post\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #بازی های تحت وب  غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن بازی های تحت وب غیر فعال شد و  ارسال بازی تحت وب ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_inline = data[tostring(target)]["settings"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
 return "☆》*Mυтє Iηℓιηє* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear glass link and send the link to be active glass is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #کیبورد شیشه ای از قبل فعال است🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن لینک شیشه ای  از قبل فعال بود و ارسال لینک شیشه ای ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Iηℓιηє* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear glass link is activated it will send the link glass is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #کیبورد شیشه ای فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن لینک های شیشه ای فعال شد از این پس ارسال لینک شیشه ای ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_inline = data[tostring(target)]["settings"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
return "☆》*Mυтє Iηℓιηє* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear glass link is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #کیبورد شیشه ای فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن لینک های شیشه ای فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Iηℓιηє* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear glass disabled links and send the link glass is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #کیبورد شیشه ای  غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن لینک های شیشه ای غیر فعال شد و  ارسال لینک شیشه ای ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_text = data[tostring(target)]["settings"]["mute_text"] 
if mute_text == "yes" then
if not lang then
 return "☆》*Mυтє Tєχт* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear Text of the draft text is to be active\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #متن  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن متن از قبل فعال بود و ارسال متن ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Tєχт* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear Text is enabled, it will send the text is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #متن فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن متن فعال شد از این پس ارسال متن ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local mute_text = data[tostring(target)]["settings"]["mute_text"]
 if mute_text == "no" then
if not lang then
return "☆》*Mυтє Tєχт* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear Text is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
return "☆》بیصدا کردن # متن فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن متن فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
end
else 
data[tostring(target)]["settings"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Tєχт* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clean Text is disabled and is not prohibited text message\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن # متن غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن متن غیر فعال شد و  ارسال متن ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_photo = data[tostring(target)]["settings"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
 return "☆》*Mυтє Pнσтσ* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear Photo to be active and submit photos is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #عکس  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن عکس  از قبل فعال بود از و ارسال عکس ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Pнσтσ* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear was activated from the then submit photos is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #عکس فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن عکس فعال شد از این پس ارسال عکس ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end
 
local mute_photo = data[tostring(target)]["settings"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
return "☆》*Mυтє Pнσтσ* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear photos are not active and do not disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #عکس فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن عکس فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Pнσтσ* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear disabled photos and send photos is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن # عکس غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن عکس غیر فعال شد و  ارسال عکس ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_video = data[tostring(target)]["settings"]["mute_video"] 
if mute_video == "yes" then
if not lang then
 return "☆》*Mυтє Vι∂єσ* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear film and upload videos is forbidden to be active\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #ویدیو  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن فیلم از قبل فعال بود و ارسال فیلم ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
 return "☆》*Mυтє Vι∂єσ* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Remove this film was enabled after posting videos is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #ویدیو فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن فیلم فعال شد از این پس ارسال فیلم ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_video = data[tostring(target)]["settings"]["mute_video"]
 if mute_video == "no" then
if not lang then
return "☆》*Mυтє Vι∂єσ* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear film is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #ویدیو فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن فیلم فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Vι∂єσ* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear disabled movies and upload videos is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #ویدیو غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن فیلم غیر فعال شد و  ارسال فیلم ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_audio = data[tostring(target)]["settings"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
 return "☆》*Mυтє Aυ∂ισ* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Deleting songs already was active and write songs is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #اهنگ  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن آهنگ از قبل فعال بود و ارسال آهنگ ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Aυ∂ισ* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear active track is henceforth forbidden to write songs\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else 
return "☆》بیصدا کردن #اهنگ فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن آهنگ فعال شد از این پس ارسال آهنگ ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_audio = data[tostring(target)]["settings"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
return "☆》*Mυтє Aυ∂ισ* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Erasing songs is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #اهنگ فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن آهنگ فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "☆》*Mυтє Aυ∂ισ* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear disabled songs and write songs is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》بیصدا کردن #اهنگ غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن آهنگ غیر فعال شد و  ارسال آهنگ ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_voice = data[tostring(target)]["settings"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
 return "☆》*Mυтє Vσιcє* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Send Weiss [sound] was already active, and is forbidden\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #صدا (وویس)  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️ارسال ویس [صدا] از قبل فعال بود و  ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Vσιcє* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Send Weiss [sound] is enabled it will write Vis [sound] is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #صدا (وویس)  فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️ارسال ویس [صدا] فعال شد از این پس ارسال ویس [صدا] ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_voice = data[tostring(target)]["settings"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
return "☆》*Mυтє Vσιcє* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Send Weiss [sound] is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #صدا (وویس) فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️ارسال ویس [صدا] فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "☆》*Mυтє Vσιcє* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Send Weiss [sound] is disabled and is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #صدا (وویس) غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️ارسال ویس [صدا] غیر فعال شد و  ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_sticker = data[tostring(target)]["settings"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
 return "☆》*Mυтє Sтιcкєя* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Send stickers have already been activated and is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #استیکر  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️ارسال استیکر از قبل فعال است و ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Sтιcкєя* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Send this post Send Sticker Sticker activated is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #استیکر فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️ارسال استیکر فعال شد از این پس ارسال استیکر ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local mute_sticker = data[tostring(target)]["settings"]["mute_sticker"]
 if mute_sticker == "no" then
if not lang then
return "☆》*Mυтє Sтιcкєя* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Send stickers are not active and do not disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #استیکر فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️ارسال استیکر فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "☆》*Mυтє Sтιcкєя* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear sticker disabled is not prohibited and send stickers\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》بیصدا کردن #استیکر غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن استیکر غیر فعال شد و ارسال استیکر ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end 
end
end
---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_contact = data[tostring(target)]["settings"]["mute_contact"] 
if mute_contact == "yes" then
if not lang then
 return "☆》*Mυтє Cσηтαcт* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️To send a contact [number] already active, and is forbidden\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #ارسال مخاطب  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️ارسال مخاطب [شماره] از قبل فعال است و ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Cσηтαcт* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️To send a contact [number] was activated after this is prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #ارسال مخاطب فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️ارسال مخاطب [شماره] فعال شد از این پس  ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_contact = data[tostring(target)]["settings"]["mute_contact"]
 if mute_contact == "no" then
if not lang then
return "☆》*Mυтє Cσηтαcт* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️To send a contact [number] is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #ارسال مخطب فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️ارسال مخاطب [شماره] فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Cσηтαcт* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear audience [number] is disabled and write the contact [number] is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #ارسال مخاطب غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن مخاطب [شماره] غیر فعال شد و ارسال مخاطب [شماره] ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_forward = data[tostring(target)]["settings"]["mute_forward"] 
if mute_forward == "yes" then
if not lang then
 return "☆》*Mυтє Fσяωαя∂* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear message forwarding is already active, and is forbidden\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #فوروارد از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن پیام فوروارد شده از قبل فعال است و ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Fσяωαя∂* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear forwarded message is activated and henceforth banned\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #فوروارد فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن پیام فوروارد شده فعال شد و از این پس  ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_forward = data[tostring(target)]["settings"]["mute_forward"]
 if mute_forward == "no" then
if not lang then
return "☆》*Mυтє Fσяωαя∂* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear forwarded message is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
return "☆》بیصدا کردن #فوروارد فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن پیام فوروارد شده فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end 
else 
data[tostring(target)]["settings"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "☆》*Mυтє Fσяωαя∂* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Disabled Clean forwarded and forwarded message is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #فوروارد غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن فوروارد غیر فعال شد و ارسال پیام فوروارد شده ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_location = data[tostring(target)]["settings"]["mute_location"] 
if mute_location == "yes" then
if not lang then
 return "☆》*Mυтє Lσcαтιση* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Send location is already active, and is forbidden\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #موقعیت از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️ارسال مکان از قبل فعال است و ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
 return "☆》*Mυтє Lσcαтιση* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear the Send location is activated and henceforth banned\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #موقعیت فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن ارسال مکان فعال شد و از این پس  ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_location = data[tostring(target)]["settings"]["mute_location"]
 if mute_location == "no" then
if not lang then
return "☆》*Mυтє Lσcαтιση* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Send the place is clean and does not disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #موقعیت فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن ارسال مکان فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Lσcαтιση* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear was sent off location's position is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #موقعیت غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن ارسال مکان غیر فعال شد و ارسال مکان ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_document = data[tostring(target)]["settings"]["mute_document"] 
if mute_document == "yes" then
if not lang then
 return "☆》*Mυтє Dσcυмєηт* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear active, and is forbidden to send files\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #اسناد  از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن ارسال فایل از قبل فعال است و ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Dσcυмєηт* _Hαѕ Bєєη Eηαвℓє∂_🔇Clear and henceforth forbidden file uploads enabled\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
 return "☆》بیصدا کردن #اسناد فعال شد🔇پاک کردن ارسال فایل فعال شد و از این پس  ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end 

local mute_document = data[tostring(target)]["settings"]["mute_document"]
 if mute_document == "no" then
if not lang then
return "☆》*Mυтє Dσcυмєηт* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Delete the file upload is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
elseif lang then
return "☆》بیصدا کردن #اسناد فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن ارسال فایل فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else 
data[tostring(target)]["settings"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє Dσcυмєηт* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear disabled file uploads's position is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*" 
else
return "☆》بیصدا کردن #اسناد غیر فعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن ارسال فایل غیر فعال شد و ارسال مکان ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end
---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_tgservice = data[tostring(target)]["settings"]["mute_tgservice"] 
if mute_tgservice == "yes" then
if not lang then
 return "☆》*Mυтє TgSєяνιcє* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear telegram service is already active, and is forbidden\n➖➖➖➖➖➖➖\nTelegram for new updates may take place if the robot is the group's chief director for admins will not work\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن #خدمات تلگرام از قبل فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن خدمات تلگرام از قبل فعال است و ممنوع میباشد\n➖➖➖➖➖➖➖\nبه خاطر ابدیت جدید تلگرام این امکان زمانی ممکن است که ربات مدیر اصلی گروه باشد و برای ادمین ها کارساز نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє TgSєяνιcє* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clear telegram service is activated and henceforth banned\n➖➖➖➖➖➖➖\nTelegram for new updates may take place if the robot is the group's chief director for admins will not work\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》بیصدا کردن #خدمات تلگرام  فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن خدمات تلگرام فعال شد و از این پس  ممنوع میباشد\n➖➖➖➖➖➖➖\nبه خاطر ابدیت جدید تلگرام این امکان زمانی ممکن است که ربات مدیر اصلی گروه باشد و برای ادمین ها کارساز نیست\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local mute_tgservice = data[tostring(target)]["settings"]["mute_tgservice"]
 if mute_tgservice == "no" then
if not lang then
return "☆》*Mυтє TgSєяνιcє* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear telegram service is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
return "☆》بیصدا کردن #خدمات تلگرام فعال نیست🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن خدمات تلگرام فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end 
else 
data[tostring(target)]["settings"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє TgSєяνιcє* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clear telegram services were disabled and telegram services is not prohibited\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》بیصدا کردن #خدمات تلگرام  غیرفعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن خدمات تلگرام غیر فعال شد و خدمات تلگرام ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end 
end
end

---------------Mute Keyboard-------------------
local function mute_keyboard(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end

local mute_keyboard = data[tostring(target)]["settings"]["mute_keyboard"] 
if mute_keyboard == "yes" then
if not lang then
 return "☆》*Mυтє Kєувσαя∂* _Iѕ Aℓяєα∂у Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clean the keyboard is active, and is forbidden to\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
 return "☆》بیصدا کردن صفحه کلید فعال است🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن استفاده از  کیبورد از قبل فعال است و ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
else
 data[tostring(target)]["settings"]["mute_keyboard"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "☆》*Mυтє Kєувσαя∂* _Hαѕ Bєєη Eηαвℓє∂_🔇\n➖➖➖➖➖➖➖\nℹ️Clean the keyboard is activated and henceforth banned\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》بیصدا کردن صفحه کلید فعال شد🔇\n➖➖➖➖➖➖➖\nℹ️پاک کردن استفاده از کیبورد فعال شد و از این پس  ممنوع میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
end

local function unmute_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants"
else
return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end 
end

local mute_keyboard = data[tostring(target)]["settings"]["mute_keyboard"]
 if mute_keyboard == "no" then
if not lang then
return "☆》*Mυтє Kєувσαя∂* _Iѕ Aℓяєα∂у Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clean the keyboard is not active and does not need to disable\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
elseif lang then
return "☆》بیصدا کردن صفحه کلید غیرفعال است🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن استفاده از کیبورد فعال نیست و نیازی به غیر فعال کردن ندارد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end 
else 
data[tostring(target)]["settings"]["mute_keyboard"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "☆》*Mυтє TgSєяνιcє* _Hαѕ Bєєη Dιѕαвℓє∂_🔊\n➖➖➖➖➖➖➖\nℹ️Clean the keyboard and the keyboard is not prohibited disabled\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
else
return "☆》بیصدا کردن صفحه کلید غیرفعال شد🔊\n➖➖➖➖➖➖➖\nℹ️پاک کردن استفاده ازکیبورد غیر فعال شد و کیبورد ممنوع نمیباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end 
end
end
----------Settings---------
local function group_settings(msg, target)  
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
  return "#》*Yσυ αяє ησт вσт α∂мιη*🚷\n➖➖➖➖➖➖➖\nℹ️Run this command is only for managers and assistants" 
else
 return "#》_شما مدیر ربات نیستید_🚷\n➖➖➖➖➖➖➖\nℹ️اجرای این دستور فقط برای مدیران و معاونان است"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)] then  
if data[tostring(target)]["settings"]["num_msg_max"] then   
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
  print('custom'..NUM_MSG_MAX)  
else  
NUM_MSG_MAX = 5
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_link"] then     
data[tostring(target)]["settings"]["lock_link"] = "yes"   
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_tag"] then      
data[tostring(target)]["settings"]["lock_tag"] = "yes"    
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_hashtag"] then      
data[tostring(target)]["settings"]["lock_hashtag"] = "yes"    
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_mention"] then      
data[tostring(target)]["settings"]["lock_mention"] = "no"   
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_arabic"] then     
data[tostring(target)]["settings"]["lock_arabic"] = "no"    
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_edit"] then     
data[tostring(target)]["settings"]["lock_edit"] = "no"    
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_spam"] then     
data[tostring(target)]["settings"]["lock_spam"] = "yes"   
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_flood"] then      
data[tostring(target)]["settings"]["lock_flood"] = "yes"    
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_bots"] then     
data[tostring(target)]["settings"]["lock_bots"] = "yes"   
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_markdown"] then     
data[tostring(target)]["settings"]["lock_markdown"] = "no"    
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["lock_webpage"] then      
data[tostring(target)]["settings"]["lock_webpage"] = "no"   
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["welcome"] then     
data[tostring(target)]["settings"]["welcome"] = "no"    
end
end

if data[tostring(target)]["settings"] then   
if not data[tostring(target)]["settings"]["lock_pin"] then     
data[tostring(target)]["settings"]["lock_pin"] = "no"    
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["english"] then     
data[tostring(target)]["settings"]["english"] = "no"   
end
end

if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_all"] then      
data[tostring(target)]["settings"]["mute_all"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_gif"] then      
data[tostring(target)]["settings"]["mute_gif"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_text"] then     
data[tostring(target)]["settings"]["mute_text"] = "no"    
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_photo"] then      
data[tostring(target)]["settings"]["mute_photo"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_video"] then      
data[tostring(target)]["settings"]["mute_video"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_audio"] then      
data[tostring(target)]["settings"]["mute_audio"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_voice"] then      
data[tostring(target)]["settings"]["mute_voice"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_sticker"] then      
data[tostring(target)]["settings"]["mute_sticker"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_contact"] then      
data[tostring(target)]["settings"]["mute_contact"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_forward"] then      
data[tostring(target)]["settings"]["mute_forward"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_location"] then     
data[tostring(target)]["settings"]["mute_location"] = "no"    
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_document"] then     
data[tostring(target)]["settings"]["mute_document"] = "no"    
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_tgservice"] then      
data[tostring(target)]["settings"]["mute_tgservice"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_inline"] then     
data[tostring(target)]["settings"]["mute_inline"] = "no"    
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_game"] then     
data[tostring(target)]["settings"]["mute_game"] = "no"    
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["mute_keyboard"] then     
data[tostring(target)]["settings"]["mute_keyboard"] = "no"    
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["emoji"] then     
data[tostring(target)]["settings"]["emoji"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["views"] then     
data[tostring(target)]["settings"]["views"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["ads"] then     
data[tostring(target)]["settings"]["ads"] = "no"    
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["fosh"] then      
data[tostring(target)]["settings"]["fosh"] = "no"   
end
end
if data[tostring(target)]["settings"] then    
if not data[tostring(target)]["settings"]["tab"] then      
data[tostring(target)]["settings"]["tab"] = "no"   
end
end
local expire_date = ''
local expi = redis:ttl('ExpireDate:'..msg.to.id)
if expi == -1 then
if lang then
  expire_date = 'نامحدود!'
else
  expire_date = 'Unlimited!'
end
else
  local day = math.floor(expi / 86400) + 1
if lang then
  expire_date = day..' *روز*'
else
  expire_date = day..' *Days*'
end
end
if not lang then
local settings = data[tostring(target)]["settings"] 
 text ="*тıтαивøт*\n↧⚜️*Groυp Seттιɴɢѕ:↧*\n*___________________________*\n📋*Group lock List*彡 :\n🎗》_Lσcк є∂ιт :_  *"..settings.lock_edit.."*\n🎗》_Lσcк ℓιηкѕ :_  *"..settings.lock_link.."*\n🎗》_Lσcк нαѕнтαgѕ :_  *"..settings.lock_hashtag.."*\n🎗》_Lσcк υѕєяηαмє :_  *"..settings.lock_tag.."*\n🎗》_Lσcк ємσנι :_ *"..settings.emoji.."*\n🎗》_Lσcк Tabchi :_ *"..settings.tab.."*\n🎗》_Lσcк ƒℓσσ∂ :_  *"..settings.flood.."*\n🎗》_Lσcк ƒσѕн:_ *"..settings.fosh.."*\n🎗》_Lσcк ѕραм :_  *"..settings.lock_spam.."*\n🎗》_Lσcк мєηтιση :_  *"..settings.lock_mention.."*\n🎗》_Lσcк α∂ѕ:_ *"..settings.ads.."*\n🎗》_Lσcк αяαвιc :_  *"..settings.lock_arabic.."*\n🎗》_Lσcк єηgℓιѕн :_ *"..settings.english.."*\n🎗》_Lσcк ωєвραgє :_  *"..settings.lock_webpage.."*\n🎗》_Lσcк мαяк∂σωη :_  *"..settings.lock_markdown.."*\n🎗》_Lσcк ριη мєѕѕαgє :_  *"..settings.lock_pin.."*\n🎗》_Lσcк νιєωѕ мєѕѕαgє:_ *"..settings.views.."*\n*___________________________*\n🎴σтнєя ѕєттιηgѕ彡 :\n🎗》_Gяσυρ ωєℓcσмє :_  *"..settings.welcome.."*\n🎗》_Bσтѕ ρяσтєcтιση :_  *"..settings.lock_bots.."*\n🎗》_Fℓσσ∂ ѕєηѕιтινιту :_  *"..NUM_MSG_MAX.."*\n🎗》_Eχριяє ∂αтє_ : "..expire_date.."\n*___________________________*\n📋*Group Mute List*彡 : \n🎗》_Mυтє αℓℓ : _  *"..settings.mute_all.."*\n🎗》_Mυтє gιƒ :_  *"..settings.mute_gif.."*\n🎗》_Mυтє тєχт :_  *"..settings.mute_text.."*\n🎗》_Mυтє ιηℓιηє :_  *"..settings.mute_inline.."*\n🎗》_Mυтє gαмє :_  *"..settings.mute_game.."*\n🎗》_Mυтє ρнσтσ :_  *"..settings.mute_photo.."*\n🎗》_Mυтє νι∂єσ :_  *"..settings.mute_video.."*\n🎗》_Mυтє αυ∂ισ :_  *"..settings.mute_audio.."*\n🎗》_Mυтє νσιcє :_  *"..settings.mute_voice.."*\n🎗》_Mυтє ѕтιcкєя :_  *"..settings.mute_sticker.."*\n🎗》_Mυтє cσηтαcт :_  *"..settings.mute_contact.."*\n🎗》_Mυтє ƒσяωαя∂ :_  *"..settings.mute_forward.."*\n🎗》_Mυтє ℓσcαтιση :_  *"..settings.mute_location.."*\n🎗》_Mυтє ∂σcυмєηт :_  *"..settings.mute_document.."*\n🎗》_Mυтє TgSєяνιcє :_  *"..settings.mute_tgservice.."*\n🎗》_Mυтє Kєувσαя∂ :_  *"..settings.mute_keyboard.."*\n*___________________________*\n🚦Iηƒσямαтιση彡 :\n🌐》gяσυρ ηαмє : "..msg.to.title.."\n🌐》gяσυρ ID : "..msg.to.id.."\n🌐》уσυя ID : "..msg.from.id.."\n🌐》υѕєяηαмє : @"..check_markdown(msg.from.username or "").."\n*___________________________*\n🏷*channel*: @TitanTeams\n🔠*Group Language* : *EN*\nツ"
else
local settings = data[tostring(target)]["settings"] 
 text = "*تیــتاטּ بوت*\n↧⚜️*تنظیـــمـات گروهــ↧:*\n*___________________________*\nلیــست قــفـل هــا彡 :\n🎗》🔒_قفل_ ویرایش پیام : *"..settings.lock_edit.."*\n🎗》🔒_قفل_ لینک : *"..settings.lock_link.."*\n🎗》🔒_قفل_ هشتگ : *"..settings.lock_hashtag.."*\n🎗》_🔒قفل_ یوزرنیم : *"..settings.lock_tag.."*\n🎗》_🔒قفل_ ایموجی : *"..settings.emoji.."*\n🎗》_🔒قفل_ تبچی : *"..settings.tab.."*\n🎗》_🔒قفل_ پیام مکرر : *"..settings.flood.."*\n🎗》_🔒قفل_ فحش : *"..settings.fosh.."*\n🎗》_🔒قفل_ هرزنامه : *"..settings.lock_spam.."*\n🎗》_🔒قفل_ فراخوانی : *"..settings.lock_mention.."*\n🎗》_🔒قفل_ تبلیغات :  *"..settings.ads.."*\n🎗》_🔒قفل_ عربی : *"..settings.lock_arabic.."*\n🎗》_🔒قفل_ انگلیسی : *"..settings.english.."*\n🎗》_🔒قفل_ صفحات وب : *"..settings.lock_webpage.."*\n🎗》_🔒قفل_ فونت : *"..settings.lock_markdown.."*\n🎗》_🔒قفل_ سنجاق کردن : *"..settings.lock_pin.."*\n🎗》_🔒قفل_ پیام ویو دار : *"..settings.views.."*\n*___________________________*\n🎴تنظیـمـات בیگر  :\n🎗》_📌پیام خوشآمد گویی :_ *"..settings.welcome.."*\n🎗》_📌محافظت در برابر ربات :_ *"..settings.lock_bots.."*\n🎗》_📌حداکثر پیام مکرر :_ *"..NUM_MSG_MAX.."*\n🎗》_📌تاریخ اقضا_ : "..expire_date.."\n*___________________________*\n📋*لیــست بیــصـבا هــا彡*:\n🎗》_🔇بیصدا_ همه :  *"..settings.mute_all.."*\n🎗》_🔇بیصدا_ تصاویر متحرک : *"..settings.mute_gif.."*\n🎗》_🔇بیصدا_ متن : *"..settings.mute_text.."*\n🎗》_🔇بیصدا_ دکمه شیشه ای : *"..settings.mute_inline.."*\n🎗》_🔇بیصدا_ بازی تحت وب : *"..settings.mute_game.."*\n🎗》_🔇بیصدا_ عکس : *"..settings.mute_photo.."*\n🎗》_🔇بیصدا_ فیلم : *"..settings.mute_video.."*\n🎗》_🔇بیصدا_ آهنگ : *"..settings.mute_audio.."*\n🎗》_🔇بیصدا_ وویس : *"..settings.mute_voice.."*\n🎗》_🔇بیصدا_ برچسب : *"..settings.mute_sticker.."*\n🎗》_🔇بیصدا_ ارسال مخاطب : *"..settings.mute_contact.."*\n🎗》_🔇بیصدا_ نقل قول : *"..settings.mute_forward.."*\n🎗》_🔇بیصدا_ موقعیت : *"..settings.mute_location.."*\n🎗》_🔇بیصدا_ اسناد : *"..settings.mute_document.."*\n🎗》_🔇بیصدا_ خدمات تلگرام : *"..settings.mute_tgservice.."*\n🎗》_🔇بیصدا_ صفحه کلید : *"..settings.mute_keyboard.."*\n*___________________________*\n🚦اطلاعات彡 :\n🌐》اسم گروه : "..msg.to.title.."\n🌐》ایدی گروه : "..msg.to.id.."\n🌐》ایدی شما : "..msg.from.id.."\n🌐》یوزرنیم : @"..check_markdown(msg.from.username or "").."\n*___________________________*\n🏷ڪانال ما: @TitanTeams\n🔠_زبان سوپرگروه_ : *FA*\nツ"
end
text = string.gsub(text, "yes", "[✓]")
text = string.gsub(text, "no", "[✘]")
return text
end
local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id

if msg.to.type ~= 'pv' then
if matches[1] == "id" or matches[1]=="ایدی"then
if not matches[2] and not msg.reply_id then	
local function getpro(extra, result, success)

   if result.photos_[0] then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,'\n☆》ηαмє : '..msg.from.print_name..'\n☆》Sυρєяgяσυρ ID:  '..msg.chat_id_..'\n☆》υѕєяηαмє: @'..(msg.from.username or '')..'\n☆》Yσυя ID: '..msg.sender_user_id_,msg.id_)
   else
      tdcli.sendMassage(msg.chat_id_, msg.id_, 1, 'You Havent Profile Photo!!\n☆》ηαмє : '..msg.from.print_name..'\n☆》Sυρєяgяσυρ ID:  '..msg.chat_id_..'\n☆》υѕєяηαмє: @'..(msg.from.username or '')..'\n☆》Yσυя ID: '..msg.sender_user_id_,msg.id_)
   end
   end
   tdcli_function ({
    ID = "GetUserProfilePhotos",
    user_id_ = msg.sender_user_id_,
    offset_ = 0,
    limit_ = 1
  }, getpro, nil)
  end
  end
if matches[2] then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="id"})
      end
   end
if matches[1] == "pin" and is_mod(msg) and msg.reply_id or matches[1] == "سنجاق" and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(chat)]['pin'] = msg.reply_id
    save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Mєѕѕαgє Hαѕ Bєєη Pιηηє∂*\n➖➖➖➖➖➖➖\n🔖Disable pin [!unpin]"
elseif lang then
return "_پیام سنجاق شد_✅\n➖➖➖➖➖➖➖\n🔖غیر فعال سازی سنجاق [حذف سنجاق]"
end
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(chat)]['pin'] = msg.reply_id
    save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Mєѕѕαgє Hαѕ Bєєη Pιηηє∂*\n➖➖➖➖➖➖➖\n🔖Disable pin [!unpin]"
elseif lang then
return "_پیام سنجاق شد_✅\n➖➖➖➖➖➖➖\n🔖غیر فعال سازی سنجاق [حذف سنجاق]"
end
end
end
if matches[1] == 'unpin' and is_mod(msg) or matches[1] == 'برداشتن سنجاق' and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pιη мєѕѕαgє нαѕ вєєη υηριηηє∂*\n➖➖➖➖➖➖➖\n🔖Activation pin [!pin]"
elseif lang then
return "پیام سنجاق شده پاک شد✅\n➖➖➖➖➖➖➖\n🔖فعال سازی سنجاق [سنجاق]"
end
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pιη мєѕѕαgє нαѕ вєєη υηριηηє∂*\n➖➖➖➖➖➖➖\n🔖Activation pin [!pin]"
elseif lang then
return "پیام سنجاق شده پاک شد✅\n➖➖➖➖➖➖➖\n🔖فعال سازی سنجاق [سنجاق]"
end
end
end
if matches[1] == "add" or  matches[1] == "نصب" then
return modadd(msg)
end
if matches[1] == "rem" or  matches[1] == "حذف" then
return modrem(msg)
end
if matches[1] == "setowner" and is_admin(msg) or  matches[1] == "تنظیم مدیر" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="setowner"})
      end
   end
if matches[1] == "remowner" and is_admin(msg) or  matches[1] == "حذف مدیر" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remowner"})
      end
   end
if matches[1] == "promote" and is_owner(msg) or matches[1] == "ترفیع" and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="promote"})
      end
   end
if matches[1] == "demote" and is_owner(msg) or matches[1] == "تنزل" and is_owner(msg) then
if not matches[2] and msg.reply_id then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="demote"})
      end
   end

if matches[1] == "lock" and is_mod(msg) or  matches[1] == "قفل" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "link" or matches[2]=="لینک" then
return lock_link(msg, data, target)
end
if matches[2] == "tag"  or matches[2]=="تگ" then
return lock_hashtag(msg, data, target)
end
if matches[2] == "mention"  or matches[2]=="فراخوانی" then
return lock_mention(msg, data, target)
end
if matches[2] == "arabic"  or matches[2]=="عربی" then
return lock_arabic(msg, data, target)
end
if matches[2] == "edit"  or matches[2]=="ویرایش" then
return lock_edit(msg, data, target)
end
if matches[2] == "spam"  or matches[2]=="اسپم" then
return lock_spam(msg, data, target)
end
if matches[2] == "flood"  or matches[2]=="حساسیت" then
return lock_flood(msg, data, target)
end
if matches[2] == "bots"  or matches[2]=="ربات" then
return lock_bots(msg, data, target)
end
if matches[2] == "markdown" or matches[2]=="فونت" then
return lock_markdown(msg, data, target)
end
if matches[2] == "webpage"  or matches[2]=="وب" then
return lock_webpage(msg, data, target)
end
if matches[2] == "pin" and is_owner(msg)  or matches[2]=="سنجاق" and is_owner(msg) then
return lock_pin(msg, data, target)
end
if matches[2] == "english"  or matches[2]=="انگلیسی"  then
return lock_english(msg, data, target)
end
if matches[2] == "views"  or matches[2]=="ویو" then
return lock_views(msg, data, target)
end
if matches[2] == "emoji"  or matches[2]=="ایموجی" then
return lock_emoji(msg, data, target)
end
if matches[2] == "fosh"  or matches[2]=="فحش" then
return lock_fosh(msg, data, target)
end
if matches[2] == "ads"  or matches[2]=="تبلیغات" then
return lock_ads(msg, data, target)
end
if matches[2] == "reply"  or matches[2]=="تبلیغات" then
return lock_reply(msg, data, target)
end
if matches[2] == "username"  or matches[2]=="یوزرنیم" then
return lock_tag(msg, data, target)
end
if matches[2] == "tabchi"  or matches[2]=="تبچی" then
return lock_tab(msg, data, target)
end
end


if matches[1] == "unlock" and is_mod(msg) or matches[1]=="بازکردن" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "link"  or matches[2]=="لینک" then
return unlock_link(msg, data, target)
end
if matches[2] == "tag"  or matches[2]=="تگ" then
return unlock_hashtag(msg, data, target)
end
if matches[2] == "mention"  or matches[2]=="فراخوانی" then
return unlock_mention(msg, data, target)
end
if matches[2] == "arabic"  or matches[2]=="عربی" then
return unlock_arabic(msg, data, target)
end
if matches[2] == "edit"  or matches[2]=="ویرایش" then
return unlock_edit(msg, data, target)
end
if matches[2] == "spam"  or matches[2]=="اسپم" then
return unlock_spam(msg, data, target)
end
if matches[2] == "flood" or matches[2]=="حساسیت" then
return unlock_flood(msg, data, target)
end
if matches[2] == "bots"  or matches[2]=="ربات" then
return unlock_bots(msg, data, target)
end
if matches[2] == "markdown"  or matches[2]=="فونت" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "webpage" or matches[2]=="وب" then
return unlock_webpage(msg, data, target)
end
if matches[2] == "pin" and is_mod(msg)  or matches[2]=="سنجاق" and is_mod(msg)  then
return unlock_pin(msg, data, target)
end
if matches[2] == "english" or matches[2]=="انگلیسی"  then
return unlock_english(msg, data, target)
end
if matches[2] == "views" or matches[2]=="ویو" then
return unlock_views(msg, data, target)
end
if matches[2] == "emoji" or matches[2]=="ایموجی" then
return unlock_emoji(msg, data, target)
end
if matches[2] == "fosh"  or matches[2]=="فحش" then
return unlock_fosh(msg, data, target)
end
if matches[2] == "ads"  or matches[2]=="تبلیغات" then
return unlock_ads(msg, data, target)
end
if matches[2] == "username"  or matches[2]=="یوزرنیم" then
return unlock_tag(msg, data, target)
end
if matches[2] == "tabchi"  or matches[2]=="تبچی" then
return unlock_tab(msg, data, target)
end
end

if matches[1] == "mute" and is_mod(msg) or matches[1]== "بیصدا" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "all"  or matches[2]=="همه" then
return mute_all(msg, data, target)
end
if matches[2] == "gif"  or matches[2]=="گیف" then
return mute_gif(msg, data, target)
end
if matches[2] == "text"  or matches[2]=="متن" then
return mute_text(msg ,data, target)
end
if matches[2] == "photo"  or matches[2]=="عکس" then
return mute_photo(msg ,data, target)
end
if matches[2] == "video"  or matches[2]=="ویدیو" then
return mute_video(msg ,data, target)
end
if matches[2] == "audio"  or matches[2]=="اهنگ" then
return mute_audio(msg ,data, target)
end
if matches[2] == "voice"  or matches[2]=="ویس" then
return mute_voice(msg ,data, target)
end
if matches[2] == "sticker"  or matches[2]=="استیکر" then
return mute_sticker(msg ,data, target)
end
if matches[2] == "contact"  or matches[2]=="مخاطب" then
return mute_contact(msg ,data, target)
end
if matches[2] == "forward"  or matches[2]=="فوروارد" then
return mute_forward(msg ,data, target)
end
if matches[2] == "location"  or matches[2]=="مکان" then
return mute_location(msg ,data, target)
end
if matches[2] == "document"  or matches[2]=="فایل" then
return mute_document(msg ,data, target)
end
if matches[2] == "tgservice"  or matches[2]=="سرویس تلگرام" then
return mute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2]=="دکمه شیشه ای" then
return mute_inline(msg ,data, target)
end
if matches[2] == "game"  or matches[2]=="بازی" then
return mute_game(msg ,data, target)
end
if matches[2] == "keyboard"  or matches[2]=="کیبورد" then
return mute_keyboard(msg ,data, target)
end
end

if matches[1] == "unmute" and is_mod(msg) or matches[1]=="باصدا" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "all"  or matches[2]=="همه" then
return unmute_all(msg, data, target)
end
if matches[2] == "gif"  or matches[2]=="گیف"then
return unmute_gif(msg, data, target)
end
if matches[2] == "text" or matches[2]=="متن" then
return unmute_text(msg, data, target)
end
if matches[2] == "photo" or matches[2]=="عکس" then
return unmute_photo(msg ,data, target)
end
if matches[2] == "video" or matches[2]=="ویدیو" then
return unmute_video(msg ,data, target)
end
if matches[2] == "audio" or matches[2]=="اهنگ" then
return unmute_audio(msg ,data, target)
end
if matches[2] == "voice" or matches[2]=="ویس" then
return unmute_voice(msg ,data, target)
end
if matches[2] == "sticker" or matches[2]=="استیکر" then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "contact" or matches[2]=="مخاطب" then
return unmute_contact(msg ,data, target)
end
if matches[2] == "forward" or matches[2]=="فوروارد" then
return unmute_forward(msg ,data, target)
end
if matches[2] == "location"  or matches[2]=="مکان" then
return unmute_location(msg ,data, target)
end
if matches[2] == "document"  or matches[2]=="فایل" then
return unmute_document(msg ,data, target)
end
if matches[2] == "tgservice" or matches[2]=="سرویس تلگرام" then
return unmute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2]=="دکمه شیشه ای" then
return unmute_inline(msg ,data, target)
end
if matches[2] == "game"  or matches[2]=="بازی" then
return unmute_game(msg ,data, target)
end
if matches[2] == "keyboard"   or matches[2]=="کیبورد" then
return unmute_keyboard(msg ,data, target)
end
end
if matches[1] == "gpinfo" and is_mod(msg) and msg.to.type == "channel" or matches[1] == "اطلاعات گروه" and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "*Gяσυρ Iηƒσ :*\n📋_A∂мιη Cσυηт :_ *"..data.administrator_count_.."*\n📋_Mємвєя Cσυηт :_ *"..data.member_count_.."*\n📋_Kιcкє∂ Cσυηт :_ *"..data.kicked_count_.."*\n_Gяσυρ ID :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
elseif lang then
ginfo = "*اطلاعات گروه :*\n📋_تعداد مدیران :_ *"..data.administrator_count_.."*\n📋_تعداد اعضا :_ *"..data.member_count_.."*\n📋_تعداد اعضای حذف شده :_ *"..data.kicked_count_.."*\n_شناسه گروه :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.to.id, group_info, {chat_id=msg.to.id,msg_id=msg.id})
end
if matches[1] == 'newlink' and is_mod(msg) or matches[1] == 'لینک جدید' and is_mod(msg) then
      local function callback_link (arg, data)
   local hash = "gp_lang:"..msg.to.id
   local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data) 
        if not data.invite_link_ then
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_Bσт ιѕ ησт gяσυρ cяєαтσя_\n_ѕєт α ℓιηк  σя ƒσя gяσυρ ωιтн υѕιηg_ /setlink or تنظیم لینک", 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_ربات سازنده گروه نیست_\n_با دستور_ setlink/  _یا تنظیم لینک لینک جدیدی برای گروه ثبت کنید_", 1, 'md')
    end
          administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
          save_data(_config.moderation.data, administration)
        else
        if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "*Nєωℓιηк Cяєαтє∂*", 1, 'md')
        elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_لینک جدید ساخته شد_", 1, 'md')
     end
          administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
          save_data(_config.moderation.data, administration)
        end
      end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
    end
    if matches[1] == 'setlink' and is_owner(msg) or matches[1] == 'تنظیم لینک' and is_owner(msg) then
      data[tostring(chat)]['settings']['linkgp'] = 'waiting'
      save_data(_config.moderation.data, data)
      if not lang then
      return '_Please send the new group_ *link* _now_'
    else 
         return 'لطفا لینک گروه خود را ارسال کنید'
       end
    end

    if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
      if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
        data[tostring(chat)]['settings']['linkgp'] = msg.text
        save_data(_config.moderation.data, data)
            if not lang then
        return "*Newlink* _has been set_✅"
           else
           return "لینک جدید ذخیره شد✅"
      end
       end
    end
    if matches[1] == 'link' or matches[1] == 'لینک' then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_Fιяѕт cяєαтє α ℓιηк ƒσя gяσυρ ωιтн υѕιηg_ /newlink or {لینک جدید} \n_Iƒ вσт ησт gяσυρ cяєαтσя ѕєт α ℓιηк ωιтн υѕιηg_ /setlink or {تنظیم لینک}"
     else
        return "ابتدا با دستور newlink/ یا {لینک جدید} لینک جدیدی برای گروه بسازید\nو اگر ربات سازنده گروه نیس با دستور setlink/ یا {تنظیم لینک} لینک جدیدی برای گروه ثبت کنید"
      end
      end
     if not lang then
       text = "<b>Gяσυρ Lιηк :</b>\n"..linkgp
     else
      text = "<b>لینک گروه :</b>\n"..linkgp
         end
        return tdcli.sendMessage(chat, msg.id, 1, text, 1, 'html')
     end
  if matches[1] == "setrules" and matches[2] and is_mod(msg) or matches[1] == "تنظیم قوانین" and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
    save_data(_config.moderation.data, data)
     if not lang then
    return "*Group rules* _has been set_\n➖➖➖➖➖➖➖\n🔖New laws [!setrules]"
   else 
  return "قوانین گروه ثبت شد\n➖➖➖➖➖➖➖\n🔖تنظیم قوانین جدید [تنظیم قوانین]"
   end
  end
  if matches[1] == "rules" or matches[1] == "قوانین" and matches[2] then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "ℹNO Rυℓєѕ 🔖New laws [!setrules]"
    elseif lang then
       rules = "قوانینی وجود ندارد\n➖➖➖➖➖➖➖\n🔖تنظیم قوانین جدید [تنظیم قوانین]"
 end
        else
     rules = "*Group Rules :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if matches[1] == "res" and matches[2] and is_mod(msg) or matches[1] == "اطلاعاتد یوزرنیم" and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="res"})
  end
if matches[1] == "whois" and matches[2] and is_mod(msg) or matches[1] == "اطلعات ایدی" and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="whois"})
  end
  if matches[1] == 'setflood' and is_mod(msg) or matches[1] == 'حساسیت اسپم' and is_mod(msg) then
      if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
        return "_Wяσηg ηυмвєя, яαηgє ιѕ_ *[1-50]*"
      end
      local flood_max = matches[2]
      data[tostring(chat)]['settings']['num_msg_max'] = flood_max
      save_data(_config.moderation.data, data)
    return "_Gяσυρ_ *ƒℓσσ∂* _ѕєηѕιтινιту нαѕ вєєη ѕєт тσ :_ *[ "..matches[2].." ]*"
       end
    if matches[1]:lower() == 'clean' and is_owner(msg) or matches[1]:lower() == 'پاک کردن' and is_owner(msg) then
      if matches[2] == 'mods' or matches[2] == 'معاون ها' then
        if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
          return "_Nσ_ *мσ∂єяαтσяѕ* _ιη тнιѕ gяσυρ_\n➖➖➖➖➖➖➖\n🔖Deputy setting for [!promote]"
             else
                return "هیچ معاونی برای ربات در این گروه انتخاب نشده است\n➖➖➖➖➖➖➖\n🔖تنظیم معاون برای گروه [ترفیع]"
        end
            end
        for k,v in pairs(data[tostring(chat)]['mods']) do
          data[tostring(chat)]['mods'][tostring(k)] = nil
          save_data(_config.moderation.data, data)
        end
            if not lang then
        return "_Aℓℓ_ *мσ∂єяαтσяѕ* _нαѕ вєєη ∂ємσтє∂_\n➖➖➖➖➖➖➖\n🔖Deputy setting for [!promote]"
          else
            return "تمام مدیران ربات در گروه تنزیل مقام شدند\n➖➖➖➖➖➖➖\n🔖تنظیم معاون برای گروه [ترفیع]"
      end
         end
      if matches[2] == 'filterlist' or matches[2] == 'لیست فیلتر' then
        if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
          return "*Fιℓтєяє∂ ωσя∂ѕ ℓιѕт* _ιѕ ємρту_\n➖➖➖➖➖➖➖\n🔖Filter the word [!filter]"
         else
          return "_لیست کلمات فیلتر شده خالی است_\n➖➖➖➖➖➖➖\n🔖فیلتر کردن کلمه [فیلتر]"
             end
        end
        for k,v in pairs(data[tostring(chat)]['filterlist']) do
          data[tostring(chat)]['filterlist'][tostring(k)] = nil
          save_data(_config.moderation.data, data)
        end
       if not lang then
        return "*Fιℓтєяє∂ ωσя∂ѕ ℓιѕт* _нαѕ вєєη cℓєαηє∂_\n➖➖➖➖➖➖➖\n🔖Filter the word [!filter]"
           else
        return "_لیست کلمات فیلتر شده پاک شد_\n➖➖➖➖➖➖➖\n🔖فیلتر کردن کلمه [فیلتر]"
           end
      end
      if matches[2] == 'rules' or matches[2] == 'قوانین' then
        if not data[tostring(chat)]['rules'] then
            if not lang then
          return "_Nσ_ *яυℓєѕ* _αναιℓαвℓє_\n➖➖➖➖➖➖➖\n🔖New laws [!setrules]"
             else
               return "قوانین برای گروه ثبت نشده است\n➖➖➖➖➖➖➖\n🔖تنظیم قوانین جدید [تنظیک قوانین]"
             end
        end
          data[tostring(chat)]['rules'] = nil
          save_data(_config.moderation.data, data)
             if not lang then
        return "*Gяσυρ яυℓєѕ* _нαѕ вєєη cℓєαηє∂_\n➖➖➖➖➖➖➖\n🔖New laws [!setrules]"
          else
            return "قوانین گروه پاک شد\n➖➖➖➖➖➖➖\n🔖تنظیم قوانین جدید [تنظیک قوانین]"
      end
       end
      if matches[2] == 'welcome' or  matches[2] == 'خوشامد گویی' then
        if not data[tostring(chat)]['setwelcome'] then
            if not lang then
          return "*Wєℓcσмє Mєѕѕαgє ησт ѕєт*\n➖➖➖➖➖➖➖\n🔖Set the welcome message [!setwelcome]"
             else
               return "پیام خوشآمد گویی ثبت نشده است\n➖➖➖➖➖➖➖\n🔖تنظیم پیام خوش امد گویی [تنظیم خوشامد گویی]"
             end
        end
          data[tostring(chat)]['setwelcome'] = nil
          save_data(_config.moderation.data, data)
             if not lang then
        return "*Wєℓcσмє мєѕѕαgє* _нαѕ вєєη cℓєαηє∂_\n➖➖➖➖➖➖➖\n🔖Set the welcome message [!setwelcome]"
          else
            return "پیام خوشآمد گویی پاک شد\n➖➖➖➖➖➖➖\n🔖تنظیم پیام خوش امد گویی [تنظیم خوشامد گویی]"
      end
       end
      if matches[2] == 'about' or matches[2] == 'درباره گروه' then
        if msg.to.type == "chat" then
        if not data[tostring(chat)]['about'] then
            if not lang then
          return "_Nσ_ *∂єѕcяιρтιση* _αναιℓαвℓє_\n➖➖➖➖➖➖➖\n🔖Settings About Group [!setabout]"
            else
              return "پیامی مبنی بر درباره گروه ثبت نشده است\n➖➖➖➖➖➖➖\n🔖تنظیم درباره گروه [تنظیم درباره]"
          end
        end
          data[tostring(chat)]['about'] = nil
          save_data(_config.moderation.data, data)
        elseif msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
        return "*Gяσυρ ∂єѕcяιρтιση* _нαѕ вєєη cℓєαηє∂_\n➖➖➖➖➖➖➖\n🔖Settings About Group [!setabout]"
           else
              return "پیام مبنی بر درباره گروه پاک شد\n➖➖➖➖➖➖➖\n🔖تنظیم درباره گروه [تنظیم درباره]"
             end
        end
        end
    if matches[1]:lower() == 'clean' and is_admin(msg) or matches[1]:lower() == 'پاک کردن' and is_admin(msg) then
      if matches[2] == 'owners' or matches[2] == 'مدیر' then
        if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
          return "_Nσ_ *σωηєяѕ* _ιη тнιѕ gяσυρ_\n➖➖➖➖➖➖➖\n🔖Admin settings for the group [!setowner]"
            else
                return "مالکی برای گروه انتخاب نشده است\n➖➖➖➖➖➖➖\n🔖تنظیم مدیر برای گروه [تنظیم مدیر]"
            end
        end
        for k,v in pairs(data[tostring(chat)]['owners']) do
          data[tostring(chat)]['owners'][tostring(k)] = nil
          save_data(_config.moderation.data, data)
        end
            if not lang then
        return "_Aℓℓ_ *σωηєяѕ* _нαѕ вєєη ∂ємσтє∂_\n➖➖➖➖➖➖➖\n🔖Admin settings for the group [!setowner]"
           else
            return "تمامی مالکان گروه تنزیل مقام شدند\n➖➖➖➖➖➖➖\n🔖تنظیم مدیر برای گروه [تنظیم مدیر]"
          end
      end
     end
if matches[1] == "setname" and matches[2] and is_mod(msg) or matches[1] == "تنظیم نام" and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if matches[1] == "setabout" and matches[2] and is_mod(msg) or  matches[1] == "تنظیم درباره گروه" and matches[2] and is_mod(msg) then
     if msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif msg.to.type == "chat" then
    data[tostring(chat)]['about'] = matches[2]
    save_data(_config.moderation.data, data)
     end
     if not lang then
    return "*Gяσυρ ∂єѕcяιρтιση* _нαѕ вєєη ѕєт_\n➖➖➖➖➖➖➖\n🔖Settings About Group [!setabout]"
    else
     return "پیام مبنی بر درباره گروه ثبت شد\n➖➖➖➖➖➖➖\n🔖تنظیم درباره گروه [تنظیم درباره]"
      end
  end
  if matches[1] == "about" and msg.to.type == "chat" or matches[1] == "درباره گروه" and msg.to.type == "chat" then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "_Nσ_ *∂єѕcяιρтιση* _αναιℓαвℓє_\n➖➖➖➖➖➖➖\n🔖Settings About Group [!setabout]"
      elseif lang then
      about = "پیامی مبنی بر درباره گروه ثبت نشده است\n➖➖➖➖➖➖➖\n🔖تنظیم درباره گروه [تنظیم درباره]"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if matches[1] == 'filter' and is_mod(msg) or matches[1] == 'فیلتر' and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if matches[1] == 'unfilter' and is_mod(msg) or matches[1] == 'حذف فیلتر' and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if matches[1] == 'filterlist' and is_mod(msg) or  matches[1] == 'لیست فیلتر' and is_mod(msg) then
    return filter_list(msg)
  end
if matches[1] == "settings" or matches[1] == "تنظیمات" then
return group_settings(msg, target)
end
if matches[1] == "modlist" or matches[1] == "لیست معاون ها" then
return modlist(msg)
end
if matches[1] == "ownerlist" and is_owner(msg) or  matches[1] == "لیست مدیران" and is_owner(msg)  then
return ownerlist(msg)
end
if matches[1] == "config" or matches[1] == "ارتقا ادمین ها" and is_owner(msg) then
return config(msg)
end

if matches[1] == "setlang" and is_owner(msg) or matches[1] == "تنظیم زبان" and is_owner(msg) then
   if matches[2] == "en" then 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 redis:del(hash)
return "_Gяσυρ Lαηgυαgє Sєт Tσ:_ EN✅\n➖➖➖➖➖➖➖\n🔖From then call the robot is in english commands\nby ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
  elseif matches[2] == "fa" then
redis:set(hash, true)
return "*زبان گروه تنظیم شد به : فارسی*✅\n➖➖➖➖➖➖➖\n🔖از این به بعد پاسخ ربات به دستورات فارسی میباشد\nتوسط ☆>*[*@"..check_markdown(msg.from.username or "").."*]*"
end
end
if matches[1] == "help" and is_mod(msg) or  matches[1] == "راهنما" and is_mod(msg) then
text = [[
🏷*Help bot*
_🛡Tιтαηвσт🛡_
*___________________________*
راهنمای دستورات فارسی:

🔶دستورات مدیریتی
📋برای مدریت گروه 

🔷دستورات قفلی
📋برای تنظیم قفل ها

🔶دستورات فان
📋دستورات عمومی و اضافی

➰➰➰➰➰➰➰➰➰➰➰
راهنمای دستورات انگلیسی:
🔶*!modhelp*
📋برای مدریت گروه

🔷*!lockhelp*
📋تنظیم قفل ها

🔶*!funhelp*
📋دستورات عمومی و اضافی

〰〰〰〰〰〰〰〰〰〰〰
🔹برای دریافت راهنمای هر بخش متن ان را وارد کنید
➖➖➖➖➖
🔸شما عزیزان میتوانید در ابتدای دستورات انگلیسی که با [!] اغاز میشود از [/],[#] نیز استفاده کنید
➖➖➖➖➖
🔸دستورات مدیریتی و قفلی برای مدیران و معاون هاست و امکان استفاده از ان برای افراد عادی نیست و استفاده از دستورات عمومی برای همه است
➖➖➖➖➖
🔷ربات داری دو زبان دستورات فارسی و انگلیسی هم چنین تنظیم جواب به صورت فارسی و انگلیسی است شما میتوانید با دستورات
!setlang `[fa-en]` 
تنظیم زبان `[fa - en]` 
زبان پاسخگویی ربات را تنظیم کنید
*Ex: !setlang fa*
*___________________________*
🔖*Channel*: @TitanTeams
🤖*Tιтαη вσт*
]]
return text
end
if matches[1] == "lockhelp" and is_mod(msg) then
text = [[
📌پاک کردن لینک 
🔹*!lock link*
🔸*!unlock link*
〰〰〰〰〰〰〰〰〰
📌پاک کردن هشتگ
🔹*!lock tag*
🔸*!unlock tag*
〰〰〰〰〰〰〰〰〰
📌پاک کردن یوزرنیم
🔹*!lock username*
🔸*!unlock username*
〰〰〰〰〰〰〰〰〰
📌پاک کردن فراخوانی
🔹*!lock mention*
🔸*!unlock mention*
〰〰〰〰〰〰〰〰〰
📌پاک کردن نوشتن به انگلیسی
🔹*!lock english*
🔸*!unlock english*
〰〰〰〰〰〰〰〰〰
📌پاک کردن نوشتن فارسی
🔹*!lock arabic*
🔸*!unlock arabic*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ویرایش پیام
🔹*!lock edit*
🔸*!unlock edit*
〰〰〰〰〰〰〰〰〰
📌پاک کردن هرزنامه(پیام بلند)
🔹*!lock spam*
🔸*!unlock spam*
〰〰〰〰〰〰〰〰〰
📌پاک کردن تعداد پیام مکرر و حدف فرد
🔹*!lock flood*
🔸*!unlock flood*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ربات های مخرب
🔹*!lock bots*
🔸*!unlock bots*
〰〰〰〰〰〰〰〰〰
📌پاک کردن فونت خاص
🔹*!lock markdown*
🔸*!unlock markdown*
〰〰〰〰〰〰〰〰〰
📌پاک کردن صفحات وب
🔹*!lock webpage*
🔸*!unlock webpage*
〰〰〰〰〰〰〰〰〰
📌پاک کردن پین پیام
🔹*!lock pin*
🔸*!unlock pin*
〰〰〰〰〰〰〰〰〰
🔶پاک کردن تبلیغات
🔹*!lock ads*
🔸*!unlock ads*
〰〰〰〰〰〰〰〰〰
📌پاک کردن کلمات رکیک
🔹*!lock fosh*
🔸*!unlock fosh*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ایموجی 
🔹*!lock emoji*
🔸*!unlock emoji*
〰〰〰〰〰〰〰〰〰
📌پاک کردن پیام اضافه کردن شماره 
🔹*!lock tabchi*
🔸*!unlock tabchi*
〰〰〰〰〰〰〰〰〰
📌پاک کردن پیام های سین دار
🔹*!lock views*
🔸*!unlock views*
〰〰〰〰〰〰〰〰〰
📌پاک کردن همه پیام ها
🔹*!mute all*
🔸*!unmute all*
〰〰〰〰〰〰〰〰〰
📌پاک کردن همه پیام ها با زمان مشخص
🔹*!mutetime* `[hours|minutes]`
🔸*!unmutetime*
🔖نکته : به جای `hours , minutes` عدد وارد کنید
مثال :!mutetime 1 2
〰〰〰〰〰〰〰〰〰
📌پاک کردن تصاویر متحرک
🔹*!mute gif*
🔸*!unmute gif*
〰〰〰〰〰〰〰〰〰
📌پاک کردن متن
🔹*!mute text*
🔸*!unmute text*
〰〰〰〰〰〰〰〰〰
📌پاک کردن عکس
🔹*!mute photo*
🔸*!unmute photo*
〰〰〰〰〰〰〰〰〰
📌پاک کردن فیلم
🔹*!mute video*
🔸*!unmte video*
〰〰〰〰〰〰〰〰〰
📌پاک کردن اهنگ
🔹*!mute audio*
🔸*!unmute audio*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ویس
🔹*!mute voice*
🔸*!unmute voice*
〰〰〰〰〰〰〰〰〰
📌پاک کردن استیکر
🔹*!mute sticker*
🔸*!unmute sticker*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ارسال مخاطب
🔹*!mute contact*
🔸*!unmute contact*
〰〰〰〰〰〰〰〰〰
📌پاک کردن فوروارد
🔹*!mute forward*
🔸*!unmute forward*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ارسال مکان
🔹*!mute location*
🔸*!unmute location*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ارسال فایل
🔹*!mute document*
🔸*!unmute document*
〰〰〰〰〰〰〰〰〰
📌پاک کردن خدمات تلگرام
🔹*!mute tgservice*
🔸*!unmute tgservice*
〰〰〰〰〰〰〰〰〰
📌پاک کردن دکمه شیشه ای
🔹*!mute inline*
🔸*!unmute inline*
〰〰〰〰〰〰〰〰〰
📌پاک کردن بازی تحت وب
🔹*!mute game*
🔸*!unmute game*
〰〰〰〰〰〰〰〰〰
📌پاک کردن کیبورد
🔹*!mute keyboard*
🔸*!unmute keyboard*
*___________________________*
⚠️*mute* , *lock* : به معنی قفل است و زمان فعال بودن ان پیام پاک میشود

⚠️*unmute* , *unlock* : قفل های مورد نظر رو غیر فعال میکند
*___________________________*
🔖*Channel*: @TitanTeams
🤖*Tιтαη вσт*
]]
return text
end
if matches[1] == "دستورات قفلی" and is_mod(msg) then
text = [[
📌پاک کردن لینک 
🔹*قفل لینک*
🔸*بازکردن لینک*
〰〰〰〰〰〰〰〰〰
📌پاک کردن هشتگ
🔹*قفل تگ*
🔸*بازکردن تگ*
〰〰〰〰〰〰〰〰〰
📌پاک کردن یوزرنیم
🔹*قفل یوزرنیم*
🔸*بازکردن یوزرنیم*
〰〰〰〰〰〰〰〰〰
📌پاک کردن فراخوانی
🔹*قفل فراخوانی*
🔸*بازکردن فراخوانی*
〰〰〰〰〰〰〰〰〰
📌پاک کردن نوشتن به انگلیسی
🔹*قفل انگلیسی*
🔸*بازکردن انگلیسی*
〰〰〰〰〰〰〰〰〰
📌پاک کردن نوشتن فارسی
🔹*قفل عربی*
🔸*بازکردن عربی*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ویرایش پیام
🔹*قفل ویرایش*
🔸*بازکردن ویرایش*
〰〰〰〰〰〰〰〰〰
📌پاک کردن هرزنامه(پیام بلند)
🔹*قفل اسپم*
🔸*بازکردن اسپم*
〰〰〰〰〰〰〰〰〰
📌پاک کردن تعداد پیام مکرر و حذف فرد
🔹*قفل حساسیت*
🔸*بازکردن حساسیت*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ربات های مخرب
🔹*قفل ربات*
🔸*بازکردن ربات*
〰〰〰〰〰〰〰〰〰
📌پاک کردن فونت خاص
🔹*قفل فونت*
🔸*بازکردن فونت*
〰〰〰〰〰〰〰〰〰
📌پاک کردن صفحات وب
🔹*قفل وب*
🔸*بازکردن وب*
〰〰〰〰〰〰〰〰〰
📌پاک کردن پین پیام
🔹*قفل سنجاق*
🔸*بازکردن سنجاق*
〰〰〰〰〰〰〰〰〰
📌پاک کردن تبلیغات
🔹*قفل تبلیغات*
🔸*بازکردن تبلیغات*
〰〰〰〰〰〰〰〰〰
📌پاک کردن کلمات رکیک
🔹*قفل فحش*
🔸*بازکردن فحش*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ایموجی 
🔹*قفل ایموجی*
🔸*بازکردن ایموجی*
〰〰〰〰〰〰〰〰〰
📌پاک کردن پیام اضافه کردن شماره 
🔹*قفل تبچی*
🔸*بازکردن تبچی*
〰〰〰〰〰〰〰〰〰
📌پاک کردن پیام های سین دار
🔹*قفل ویو*
🔸*بازکردن ویو*
〰〰〰〰〰〰〰〰〰
📌پاک کردن همه پیام ها
🔹*بیصدا همه*
🔸*باصدا همه*
〰〰〰〰〰〰〰〰〰
📌پاک کردن همه پیام ها با زمان مشخص
🔹*زمان بیصدا* `[ساعت|دقیقه]`
🔸*باصدا زمان*
🔖نکته : به جای ساعت و دقیقه عدد وارد کنید
مثال : زمان بیصدا 1 2
〰〰〰〰〰〰〰〰〰
📌پاک کردن تصاویر متحرک
🔹*بیصدا گیف*
🔸*باصدا گیف*
〰〰〰〰〰〰〰〰〰
📌پاک کردن متن
🔹*بیصدا متن*
🔸*باصدا متن*
〰〰〰〰〰〰〰〰〰
📌پاک کردن عکس
🔹*بیصدا عکس*
🔸*باصدا عکس*
〰〰〰〰〰〰〰〰
📌پاک کردن فیلم
🔹*بیصدا ویدیو*
🔸*باصدا ویدیو*
〰〰〰〰〰〰〰〰〰
📌پاک کردن اهنگ
🔹*بیصدا اهنگ*
🔸*باصدا اهنگ*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ویس
🔹*بیصدا ویس*
🔸*باصدا ویس*
〰〰〰〰〰〰〰〰〰
📌پاک کردن استیکر
🔹*بیصدا استیکر*
🔸*باصدا استیکر*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ارسال مخاطب
🔹*بیصدا مخاطب*
🔸*باصدا مخاطب*
〰〰〰〰〰〰〰〰〰
📌پاک کردن فوروارد
🔹*بیصدا فوروارد*
🔸*باصدا فوروارد*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ارسال مکان
🔹*بیصدا مکان*
🔸*باصدا مکان*
〰〰〰〰〰〰〰〰〰
📌پاک کردن ارسال فایل
🔹*بیصدا فایل*
🔸*باصدا فایل*
〰〰〰〰〰〰〰〰〰
📌پاک کردن خدمات تلگرام
🔹*بیصدا سرویس تلگرام*
🔸*باصدا سرویس تلگرام*
〰〰〰〰〰〰〰〰〰
📌پاک کردن دکمه شیشه ای
🔹*بیصدا دکمه شیشه ای*
🔸*باصدا دکمه شیششه ای*
〰〰〰〰〰〰〰〰〰
📌پاک کردن بازی تحت وب
🔹*بیصدا بازی*
🔸*باصدا بازی*
〰〰〰〰〰〰〰〰〰
📌پاک کردن کیبورد
🔹*بیصدا کیبورد*
🔸*باصدا کیبورد*
*___________________________*
🔖*Channel*: @TitanTeams
🤖*Tιтαη вσт*
]]
return text
end
if matches[1] == "modhelp" and is_mod(msg) then
text = [[
*!id*
🔹نمایش ایدی شما و گروه به همراه عکس شما
🔘🔘🔘🔘🔘
*!setowner* `[username|id|reply]`
🔸تنظیم شخص به عنوان مدیر گروه
🔘🔘🔘🔘🔘
*!remowner* `[username|id|reply]`
🔹تنزل مقام شخص از معاون گروه
🔘🔘🔘🔘🔘
*!promote* `[username|id|reply]`
🔸تنظیم شخص به عنوان معاون گروه
🔘🔘🔘🔘🔘
*!demote* `[username|id|reply]`
🔹تنزل مقام شخص از معاون گروه
🔘🔘🔘🔘🔘
*!setflood* `[1-50]`
🔸تنظیم حساسیت پیام مکرر
🔘🔘🔘🔘🔘
*!silent* `[username|id|reply]`
🔹ساکت کردن فرد
🔘🔘🔘🔘🔘
*!unsiletnt* `[username|id|reply]`
🔸ازاد شدن فرد از حالت سایلنت
🔘🔘🔘🔘🔘
*!kick* `[username|id|reply]`
🔹اخراج فرد از گروه
🔘🔘🔘🔘🔘
*!ban* `[username|id|reply]`
🔸مسدود کردن فرد از گروه
🔘🔘🔘🔘🔘
*!unban* `[username|id|reply]`
🔹ازاد کردن فرد از گروه
🔘🔘🔘🔘🔘
*!res* `[username]`
🔸نمایش اطلاعات یوزرنیم
🔘🔘🔘🔘🔘
*!whois* `[id]`
🔹نمایش اطلاعات ایدی
🔘🔘🔘🔘🔘
*!config*
🔸معاون کردن تمام ادمین ها
🔘🔘🔘🔘🔘
*!set*`[rules | name | photo | link | about | welcome]`
🔸تنظیم به ترتیب [قوانین ، نام ، عکس ، لینک ، درباره ، پیام خوش امد گویی] برای گروه
🔘🔘🔘🔘🔘
*!clean* `[bans | mods | bots | rules | about | silentlist | filtelist | welcome]`
🔹پاک کردن به ترتیب [مسدود ها ، معاون ها ، ربات ها ، قوانین ، درباره گروه ، ساکت ها ، فیلتر ها ، پیام خوش امد گویی ]
🔘🔘🔘🔘🔘
*!filter* `[word]`
🔸فیلتر کلمه مورد نظر 
🔘🔘🔘🔘🔘
*!unfilter* `[word]`
🔹پاک شدن کلمه از لیست فیلتر
🔘🔘🔘🔘🔘
*!pin* `[reply]`
🔸سنجاق پیام مورد نظر
🔘🔘🔘🔘🔘
*!unpin*
🔹غیر فعال کردن سنجاق
🔘🔘🔘🔘🔘
*!welcome* `[on-off]`
🔸فعال کردن و غیر فعال کردن پیام خوش امد گویی
🔘🔘🔘🔘🔘
*!settings*
🔹نمایش تنظیمات گروه
🔘🔘🔘🔘🔘
*!silentlist*
🔸نمایش لیست افراد ساکت
🔘🔘🔘🔘🔘
*!filterlist*
🔹نمایش لیست کلمات فیلتر
🔘🔘🔘🔘🔘
*!banlist*
🔸نمایش لیست افراد مسدود شده
🔘🔘🔘🔘🔘
*!ownerlist*
🔹نمایش لیست مدیران
🔘🔘🔘🔘🔘
*!modlist*
🔸نمایش لیست معاون ها
🔘🔘🔘🔘🔘
*!rules*
🔹نمایش قوانین گروه
🔘🔘🔘🔘🔘
*!about*
🔸نمایش درباره گروه
🔘🔘🔘🔘🔘
*!gpinfo*
🔹نمایش اطلاعات گروه
🔘🔘🔘🔘🔘
*!newlink*
🔸ساخت لینک جدید
🔘🔘🔘🔘🔘
*!link*
🔹دریافت لینک گروه
🔘🔘🔘🔘🔘
*!delall* `[username|id|reply]`
🔸پاک کردن تمام پیام های فرد
🔘🔘🔘🔘🔘
*!setwelcome* `[text]`
🔸تنظیم پیام خوش امد گویی
🔘🔘🔘🔘🔘
*!rmsg* `[number]`
🔹پاک کردن تعداد پیام اخیر سوپر گروه
🔘🔘🔘🔘🔘
*!addban*
🔸اضافه کردن افرادی که در لیست مسدود های گروه هستن به گروه
🔘🔘🔘🔘🔘
*!clean deleted*
🔹پاک کردن دلیت اکنتی ها از گروه
*___________________________*
🔹هرگاه در جلوی دستوری این نوشته
`[username|id|reply]`
 بود به این معناست که جلوی ان دستور بایدی یکی از اطلاعات رو قرار بدین 
[یوزرنیم ، ایدی ، ریپلای بر روی پیام وی]
*EX* : !silent @mohammadrezajiji
*___________________________*
🔖*Channel*: @TitanTeams
🤖*Tιтαη вσт*
]]
return text
end
if matches[1] == "دستورات مدیریتی" and is_mod(msg) then
text = [[*ایدی*
🔹نمایش ایدی شما و گروه به همراه عکس شما
🔘🔘🔘🔘🔘
*تنظیم مدیر* `[یوزرنیم|ایدی|ریپلای]`
🔸تنظیم شخص به عنوان مدیر گروه
🔘🔘🔘🔘🔘
*حذف مدیر* `[یوزرنیم|ایدی|ریپلای]`
🔹تنزل مقام شخص از مدیر گروه
🔘🔘🔘🔘🔘
*ترفیع* `[یوزرنیم|ایدی|ریپلای]`
🔸تنظیم شخص به عنوان معاون گروه
🔘🔘🔘🔘🔘
*تنزل* `[یوزرنیم|ایدی|ریپلای]`
🔹تنزل مقام شخص از معاون گروه
🔘🔘🔘🔘🔘
*حساسیت اسپم* `[1-50]`
🔸تنظیم حساسیت پیام مکرر
🔘🔘🔘🔘🔘
*مصوت* `[یوزرنیم|ایدی|ریپلای]`
🔹ساکت کردن فرد
🔘🔘🔘🔘🔘
*صامت* `[یوزرنیم|ایدی|ریپلای]`
🔸ازاد شدن فرد از حالت سایلنت
🔘🔘🔘🔘🔘
*اخراج* `[یوزرنیم|ایدی|ریپلای]`
🔹اخراج فرد از گروه
🔘🔘🔘🔘🔘
*مسدود* `[یوزرنیم|ایدی|ریپلای]`
🔸مسدود کردن فرد از گروه
🔘🔘🔘🔘🔘
*ازاد* `[یوزرنیم|ایدی|ریپلای]`
🔹ازاد کردن فرد از گروه
🔘🔘🔘🔘🔘
*اطلاعات یوزرنیم* `[یوزرنیم]`
🔸نمایش اطلاعات یوزرنیم
🔘🔘🔘🔘🔘
*اطلاعات ایدی* `[ایدی]`
🔹نمایش اطلاعات ایدی
🔘🔘🔘🔘🔘
*ارتقا ادمین ها*
🔸معاون کردن تمام ادمین ها
🔘🔘🔘🔘🔘
*تنظیم*`[قوانین | اسم | عکس | لینک | درباره گروه | خوشا امد]`
🔸تنظیم به ترتیب [قوانین ، نام ، عکس ، لینک ، درباره ، پیام خوش امد گویی] برای گروه
🔘🔘🔘🔘🔘
*پاک کردن* `[مسدودها | مدیران | رباتا |  | درباره گروه | لیست ساکت ها | لیست فیلتر | خوشامد گویی]`
🔹پاک کردن به ترتیب [مسدود ها ، معاون ها ، ربات ها ، قوانین ، درباره گروه ، ساکت ها ، فیلتر ها ، پیام خوش امد گویی ]
🔘🔘🔘🔘🔘
*فیلتر* [کلمه]
🔸فیلتر کلمه مورد نظر 
🔘🔘🔘🔘🔘
*حذف فیلتر* [کلمه]
🔹پاک شدن کلمه از لیست فیلتر
🔘🔘🔘🔘🔘
*سنجاق* [ریپلای]
🔸سنجاق پیام مورد نظر
🔘🔘🔘🔘🔘
*برداشتن سنجاق*
🔹غیر فعال کردن سنجاق
🔘🔘🔘🔘🔘
*خوش امد* `[روشن-خاموش]`
🔸فعال کردن و غیر فعال کردن پیام خوش امد گویی
🔘🔘🔘🔘🔘
*تنظیم خوش امد* `[متن]`
🔸تنظیم متن خوش امد هنگام ورود افراد به گروه
🔘🔘🔘🔘🔘
*تنظیمات*
🔹نمایش تنظیمات گروه
🔘🔘🔘🔘🔘
*لیست ساکتها*
🔸نمایش لیست افراد ساکت
🔘🔘🔘🔘🔘
*لیست فیلتر*
🔹نمایش لیست کلمات فیلتر
🔘🔘🔘🔘🔘
*لیست مسدود*
🔸نمایش لیست افراد مسدود شده
🔘🔘🔘🔘🔘
*لیست مدیران*
🔹نمایش لیست مدیران
🔘🔘🔘🔘🔘
*لیست معاون ها*
🔸نمایش لیست معاون ها
🔘🔘🔘🔘🔘
*قوانین*
🔹نمایش قوانین گروه
🔘🔘🔘🔘🔘
*درباره گروه*
🔸نمایش درباره گروه
🔘🔘🔘🔘🔘
*اطلاعات گروه*
🔹نمایش اطلاعات گروه
🔘🔘🔘🔘🔘
*لینک جدید*
🔸ساخت لینک جدید
🔘🔘🔘🔘🔘
*لینک*
🔹دریافت لینک گروه
🔘🔘🔘🔘🔘
*پاک کردن پیام ها* `[ایدی|ریپلای]`
🔹پاک کردن تمام پیام های فرد
🔘🔘🔘🔘🔘
*پاک کردن* `[عدد]`
🔸پاک کردن تعداد پیام اخیر سوپر گروه
🔘🔘🔘🔘🔘
*دعوت مسدود ها*
🔹اضافه کردن افرادی که در لیست مسدود های گروه هستن به گروه
🔘🔘🔘🔘🔘
*پاک کردن دلیت اکانتی ها*
🔸پاک کردن دلیت اکانتی ها از گروه
*___________________________*
🔖*Channel*: @TitanTeams
🤖*Tιтαη вσт*
]]
return text
end
if matches[1] == "funhelp" then
text = [[
*!azan* `[name city]`
🔹دریافت اطلاعات اذان شهر مورد نظر
◾️◽️◾️◽️
*!info*
🔸دریافت اطلاعات شما
◾️◽️◾️◽️
*!kickme*
🔹اخراج شما از گروه
◾️◽️◾️◽️
*!me*
🔸دریافت مقام شما در ربات
◾️◽️◾️◽️
*!mypic*
🔹دریافت عکس پروفایل خود
◾️◽️◾️◽️
*!ping*
🔸اطلاع از انلاین بودن ربات
◾️◽️◾️◽️
*!support*
🔹دریافت لینک گروه پشتیبانی
◾️◽️◾️◽️
*!time*
🔸دریافت زمان و تاریخ امروز
◾️◽️◾️◽️
*!write* `[text]`
🔹نوشتن کلمه با ۱۰۰ فونت مختلف
◾️◽️◾️◽️
*!nerkh*
🔸دریافت قیمت ربات جهت خرید
◾️◽️◾️◽️
*!weather* `[city]`
🔹دریافت اب وهوا شهر مورد نظر
◾️◽️◾️◽️
*!calc* `[number]`
🔸ماشین حساب 
◾️◽️◾️◽️
*!tr* `[lang] [word]`
🔹ترجمه متن فارسی به انگلیسی وبرعکس
_مثال:_
_!tr en سلام_
◾️◽️◾️◽️
*!short* `[link]`
🔸کوتاه کننده لینک
◾️◽️◾️◽️
*!voice* `[text]`
🔹تبدیل متن به صدا
◾️◽️◾️◽️
*!sticker* `[word]`
🔸تبدیل متن به استیکر
◾️◽️◾️◽️
*!photo* `[word]`
🔹تبدیل متن به عکس
◾️◽️◾️◽️
*!tosticker* `[reply]`
🔸تبدیل عکس به استیکر
◾️◽️◾️◽️
*!tophoto* `[reply]`
🔹تبدیل استیکر‌ به عکس
◾️◽️◾️◽️
🔸شما عزیزان میتوانید در ابتدای دستورات انگلیسی که با [!] اغاز میشود از [# , /] نیز استفاده کنید
*___________________________*
🔖*Channel*: @TitanTeams
🤖*Tιтαη вσт*
]]
return text
end
if matches[1] == "دستورات فان" then
text = [[
*اذان* [نام شهر]
🔹دریافت اطلاعات اذان شهر مورد نظر
◾️◽️◾️◽️
*اطلاعات من*
🔸دریافت اطلاعات شما
◾️◽️◾️◽️
*ترک گروه*
🔹اخراج شما از گروه
◾️◽️◾️◽️
*مقام من*
🔸دریافت مقام شما در ربات
◾️◽️◾️◽️
*عکس من*
🔹دریافت عکس پروفایل خود
◾️◽️◾️◽️
*انلاینی*
🔸اطلاع از انلاین بودن ربات
◾️◽️◾️◽️
*پشتیبانی*
🔹دریافت لینک گروه پشتیبانی
◾️◽️◾️◽️
*ساعت*
🔸دریافت زمان و تاریخ امروز
◾️◽️◾️◽️
*نوشتن* [متن]
🔹نوشتن کلمه با ۱۰۰ فونت مختلف
◾️◽️◾️◽️
*نرخ*
🔸دریافت قیمت ربات جهت خرید
◾️◽️◾️◽️
*اب و هوا* `[شهر]`
🔹دریافت اب وهوا شهر مورد نظر
◾️◽️◾️◽️
*حساب* `[عدد]`
🔸ماشین حساب 
◾️◽️◾️◽️
*ترجمه* `[زبان] [کلمه]`
🔹ترجمه متن فارسی به انگلیسی وبرعکس
_مثال:_
_ترجمه en سلام_
◾️◽️◾️◽️
*کوتاه* `[لینک]`
🔸کوتاه کننده لینک
◾️◽️◾️◽️
*ویس* `[متن]`
🔹تبدیل متن به صدا
◾️◽️◾️◽️
*برچسپ* `[کلمه]`
🔸تبدیل متن به استیکر
◾️◽️◾️◽️
*لوگو* `[کلمه]`
🔹تبدیل متن به عکس
◾️◽️◾️◽️
*به استیکر* `[ریپلای]`
🔸تبدیل عکس به استیکر
◾️◽️◾️◽️
*به عکس* `[ریپلای]`
🔹تبدیل استیکر‌ به عکس

*___________________________*
🔖*Channel*: @TitanTeams
🤖*Tιтαη вσт*
]]
return text
end
if matches[1] == "نرخ" or matches[1] == "nerkh" or matches[1] == "پشتیبانی" or matches[1] == "support" then
text = [[
🔰نرخ گروه با بات تیتان🔰
➖➖➖➖➖➖➖➖➖
💸نرخ سوپر گروه💸
💵یک ماه : 7000 تومان
💴دو ماه : 10000 تومان
💶نامحدود : 20000 تومان
➖➖➖➖➖➖➖➖➖
#ربات ضد لینک عکس چالش تبلیغ فحش و... 
👥کانال ما:
@TitanTeams
➖➖➖➖➖
🤖پشتیبانی :
https://t.me/joinchat/AAAAAD\_4s3oN88-49KdKfw
]]
return text
end
if matches[1] == "دستورات سودو" or matches[1] == "sudohelp" and is_sudo(msg) then
text = [[
*!visudo* `[username|id|reply]`
🔸اضافه کردن سودو

*!desudo* `[username|id|reply]`
🔹حذف کردن سودو

*!sudolist *
🔸لیست سودو‌های ربات

*!adminprom* `[username|id|reply]`
🔹اضافه کردن ادمین به ربات

*!admindem* `[username|id|reply]`
🔸حذف فرد از ادمینی ربات

*!adminlist *
🔹لیست ادمین ها

*!leave *
🔸خارج شدن ربات از گروه

*!autoleave* `[disable/enable/status]`
🔹خروج خودکار

*!creategroup* `[text]`
🔸ساخت گروه ریلم

*!createsuper* `[text]`
🔹ساخت سوپر گروه

*!tosuper *
🔸تبدیل به سوپر گروه

*!chats*
🔹لیست گروه های مدیریتی ربات

*join* `[ID]`
🔸جوین شدن توسط ربات

*!rem* `[GroupID]`
🔹حذف گروه ازطریق پنل مدیریتی

*!import* `[link]`
🔸جوین شدن ربات توسط لینک

*!setbotname* `[text]`
🔹تغییر اسم ربات

*!setbotusername* `[text]`🔸
🔸تغییر یوزرنیم ربات

*!delbotusername* 🔸
🔹پاک کردن یوزرنیم ربات

*!markread* `[on/off]`
🔸تیک دوم

*!broadcast* `[text]`
🔹فرستادن پیام به تمام گروه های مدیریتی ربات

*!bc* `[text]` `[GroupID]`
🔸ارسال پیام مورد نظر به گروه خاص

*!sendfile* `[cd]` `[file]`🔹
🔹ارسال فایل موردنظر از پوشه خاص

*!sendplug* `[plugname]`
🔸ارسال پلاگ مورد نظر

*!save* `[plugname] [reply]`
🔹ذخیره کردن پلاگین

*!savefile* `[address/filename] [reply]`
🔸ذخیره کردن فایل در پوشه مورد نظر

*!config*
🔹اضافه کردن سازنده و مدیران گروه به مدیریت ربات

*!clear cache*
🔸پاک کردن کش مسیر .telegram-cli/data

*!check*
🔹اعلام تاریخ انقضای گروه

*check* `[GroupID]`
🔸اعلام تاریخ انقضای گروه مورد نظر

*!charge* `[GroupID]` `[days]`
🔹تنظیم تاریخ انقضای گروه مورد نظر

*!charge* `[days]`
🔸تنظیم تاریخ انقضای گروه

*!jointo* `[GroupID]`
🔹دعوت شدن شما توسط ربات به گروه مورد نظر

*!leave* `[GroupID]`
🔸خارج شدن ربات از گروه مورد نظر
*___________________________*
🔖*Channel*: @TitanTeams
🤖*Tιтαη вσт*
]]
return text
end
--------------------- Welcome -----------------------
  if matches[1] == "welcome" or matches[1] == "خوش امد"  and is_mod(msg) then
    if matches[2] == "on" or matches[2] == "روشن" then
      welcome = data[tostring(chat)]['settings']['welcome']
      if welcome == "yes" then
       if not lang then
        return "_Group_ *welcome* _is already enabled_"
       elseif lang then
        return "_خوشآمد گویی از قبل فعال بود_"
           end
      else
    data[tostring(chat)]['settings']['welcome'] = "yes"
      save_data(_config.moderation.data, data)
       if not lang then
        return "_Group_ *welcome* _has been enabled_"
       elseif lang then
        return "_خوشآمد گویی فعال شد_"
          end
      end
    end
    
    if matches[2] == "off" or matches[2] == "خاموش" then
      welcome = data[tostring(chat)]['settings']['welcome']
      if welcome == "no" then
      if not lang then
        return "_Group_ *Welcome* _is already disabled_"
      elseif lang then
        return "_خوشآمد گویی از قبل فعال نبود_"
         end
      else
    data[tostring(chat)]['settings']['welcome'] = "no"
      save_data(_config.moderation.data, data)
      if not lang then
        return "_Group_ *welcome* _has been disabled_"
      elseif lang then
        return "_خوشآمد گویی غیرفعال شد_"
          end
      end
    end
  end
  if matches[1] == "setwelcome" or matches[1] == "تنظیم خوش امد" and matches[2] and is_mod(msg) then
    data[tostring(chat)]['setwelcome'] = matches[2]
      save_data(_config.moderation.data, data)
       if not lang then
    return "_Welcome Message Has Been Set To :_\n*"..matches[2].."*\n\n*You can use :*\n_{gpname} Group Name_\n_{rules} ➣ Show Group Rules_\n_{name} ➣ New Member First Name_\n_{username} ➣ New Member Username_\n@TitanTeams"
       else
    return "_پیام خوشآمد گویی تنظیم شد به :_\n*"..matches[2].."*\n\n*شما میتوانید از*\n_{gpname} نام گروه_\n_{rules} ➣ نمایش قوانین گروه_\n_{name} ➣ نام کاربر جدید_\n_{username} ➣ نام کاربری کاربر جدید_\n_استفاده کنید_\n@TitanTeams"
        end
     end
  end
-----------------------------------------
local function pre_process(msg)
   local chat = msg.to.id
   local user = msg.from.id
 local data = load_data(_config.moderation.data)
  local function welcome_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    administration = load_data(_config.moderation.data)
    if administration[arg.chat_id]['setwelcome'] then
     welcome = administration[arg.chat_id]['setwelcome']
      else
     if not lang then
     welcome = "*Welcome Dude*"
    elseif lang then
     welcome = "_خوش آمدید_"
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban.\n@TitanTeams"
    elseif lang then
       rules = "ℹ️ قوانین :\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود.\n@TitanTeams"
 end
end
if data.username_ then
user_name = "@"..check_markdown(data.username_)
else
user_name = ""
end
    local welcome = welcome:gsub("{rules}", rules)
    local welcome = welcome:gsub("{name}", check_markdown(data.first_name_))
    local welcome = welcome:gsub("{username}", user_name)
    local welcome = welcome:gsub("{gpname}", arg.gp_name)
    tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
  end
  if data[tostring(chat)] and data[tostring(chat)]['settings'] then
  if msg.adduser then
    welcome = data[tostring(msg.to.id)]['settings']['welcome']
    if welcome == "yes" then
      tdcli_function ({
        ID = "GetUser",
        user_id_ = msg.adduser
      }, welcome_cb, {chat_id=chat,msg_id=msg.id,gp_name=msg.to.title})
    else
      return false
    end
  end
  if msg.joinuser then
    welcome = data[tostring(msg.to.id)]['settings']['welcome']
    if welcome == "yes" then
      tdcli_function ({
        ID = "GetUser",
        user_id_ = msg.joinuser
      }, welcome_cb, {chat_id=chat,msg_id=msg.id,gp_name=msg.to.title})
    else
      return false
        end
    end
  end
 end
return {
patterns ={
"^[!/#](id)$",
"^(ایدی)$",
"^[!/#](id) (.*)$",
"^(ایدی) (.*)$",
"^[!/#](pin)$",
"^(سنجاق)$",
"^[!/#](unpin)$",
"^(برداشتن سنجاق)$",
"^[!/#](gpinfo)$",
"^(اطلاعات گروه)$",
"^[!/#](test)$",
"^[!/#](add)$",
"^(نصب)$",
"^[!/#](rem)$",
"^(حذف)$",
"^[!/#](setowner)$",
"^(تنظیم مدیر)$",
"^[!/#](setowner) (.*)$",
"^(تنظیم مدیر)$",
"^[!/#](remowner)$",
"^(حذف مدیر)$",
"^[!/#](remowner) (.*)$",
"^(حذف مدیر) (.*)$",
"^[!/#](promote)$",
"^(ترفیع)$",
"^[!/#](promote) (.*)$",
"^(ترفیع) (.*)$",
"^[!/#](demote)$",
"^(تنزل)$",
"^[!/#](demote) (.*)$",
"^(تنزل) (.*)$",
"^[!/#](modlist)$",
"^(لیست معاون ها)$",
"^[!/#](ownerlist)$",
"^(لیست مدیران)$",
"^[!/#](lock) (.*)$",
"^(قفل) (.*)$",
"^[!/#](unlock) (.*)$",
"^(بازکردن) (.*)$",
"^[!/#](settings)$",
"^(تنظیمات)$",
"^[!/#](mute) (.*)$",
"^(بیصدا) (.*)$",
"^[!/#](unmute) (.*)$",
"^(باصدا) (.*)$",
"^[!/#](link)$",
"^(لینک)$",
"^[!/#](setlink)$",
"^(تنظیم لینک)$",
"^[!/#](newlink)$",
"^(لینک جدید)$",
"^[!/#](rules)$",
"^(قوانین)$",
"^[!/#](setrules) (.*)$",
"^(تنظیم قوانین) (.*)$",
"^[!/#](about)$",
"^(درباره گروه)$",
"^[!/#](setabout) (.*)$",
"^(تنظیم درباره گروه) (.*)$",
"^[!/#](setname) (.*)$",
"^(تنظیم نام) (.*)$",
"^[!/#](clean) (.*)$",
"^(پاک کردن) (.*)$",
"^[!/#](setflood) (%d+)$",
"^(حساسیت اسپم) (%d+)$",
"^[!/#](res) (.*)$",
"^(اطلاعات یوزرنیم) (.*)$",
"^[!/#](whois) (%d+)$",
"^(اطلاعات ایدی) (%d+)$",
"^[!/#](help)$",
"^(راهنما)$",
"^[!/#](lockhelp)$",
"^[!/#](modhelp)$",
"^(دستورات قفلی)$",
"^(دستورات مدیریتی)$",
"^[!/#](config)$",
"^(ارتقا ادمین ها)$",
"^[!/#](funhelp)$",
"^[!/#](nerkh)$",
"^(نرخ)$",
"^[!/#](setlang) (.*)$",
"^(تنظیم زبان) (.*)$",
"^(دستورات فان)$",
"^[#!/](filter) (.*)$",
"^(فیلتر) (.*)$",
"^[#!/](unfilter) (.*)$",
"^(حذف فیلتر) (.*)$",
"^[#!/](support)$",
"^(پشتیبانی)$",
"^[#!/](filterlist)$",
"^(لیست فیلتر)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^[!/#](setwelcome) (.*)",
"^(تنظیم خوش امد) (.*)",
"^[!/#](welcome) (.*)$",
"^(خوش امد) (.*)$"


},
run=run,
pre_process = pre_process
}
-- @Titanteams
