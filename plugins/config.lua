do local _ = {
  admins = {},
  disabled_channels = {},
  enabled_plugins = {
    "banhammer",
    "groupmanager",
    "msg-checks",
    "plugins",
    "tools",
    "fun",
    "info",
	"addkick",
	"chat",
	"CleanDeleted",
	"CleanMember",
	"del",
	"kickme",
	"me",
	"mutetime",
	"pic",
	"pv",
	"remapi",
	"time1",
	"write",
	"ping"

  },
  info_text = "》parsol v.2\n\n\n》https://github.com/mohammadrezatitan/parsol\n\n》Admins :\n》@mohammadrezajiji 《\n\9\9\n》Special thanks to :\n》@BeyondTeam《\n》@luaerror\n",
  moderation = {
    data = "./data/moderation.json"
  },
  sudo_users = {
    267785153
  }
}
return _
end