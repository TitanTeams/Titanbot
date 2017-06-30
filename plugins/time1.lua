--Start By @mohammadrezajiji

function run(msg, matches)
local url , res = http.request('http://irapi.ir/time')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local text = '*📆Ir Data:* _'..jdat.FAdate..'_\n➖➖➖➖➖➖➖➖\n*📆En Data:* _'..jdat.ENdate.. '_\n➖➖➖➖➖➖➖➖\n@titamteams'
  tdcli.sendMessage(msg.chat_id_, 0, 1, text, 1, 'md')
end
return {
  patterns = {"^[!/#](time)$","^(ساعت)$"}, 
run = run 
}
-- @Titanteams

