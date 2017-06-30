--start by @mohammadrezajiji
local datebase = {
  "",

  }
local function run(msg, matches) 
tdcli.sendDocument(msg.chat_id_, msg.id_,0, 1, nil, '/root/parsol/shoplz.mp4', '@TitanTeams', dl_cb, nil)
return datebase[math.random(#datebase)]
end
return {
  patterns = {
    "^[/#+×!$]([Pp][Ii][Nn][Gg])",
    "^(انلاینی)$",
  },
  run = run
}

-- @Titanteams