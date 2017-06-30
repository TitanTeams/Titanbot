--Start By @mohammadrezajiij
function run(msg,matches)

 if msg.content_.text_ == '/mypic' or '!mypic' or '#mypic' or 'عکس من' and msg.reply_to_message_id_ == 0  then
local function getpro(extra, result, success)

   if result.photos_[0] then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_)
   else
      tdcli.sendMassage(msg.chat_id_, msg.id_, 1, "You Have'nt Profile Photo!!")
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

return {
patterns = {
"^[/!#](mypic)$",
"^(عکس من)$"

},
run = run
}
-- @Titanteams
