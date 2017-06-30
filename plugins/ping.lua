--start by @mohammadrezajiji
local datebase = {
   "من انلاینم وتمام پیام های گروه رو برسی میکنم :)🤖❤️",
  }
local function run(msg, matches) 
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

