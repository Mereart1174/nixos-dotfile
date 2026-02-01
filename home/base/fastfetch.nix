{ pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "source": "/home/philo/nixos-dotfile/home/desktop/base/config/neofetch.logo",
        "padding": {
          "top": 2,
          "right": 4
        },
        "color": {
          "1": "blue"
        }
      },
      "display": {
        "separator": " ├ ",
        "color": {
          "keys": "blue"
        }
      },
      "modules": [
        {
          "type": "custom",
          "format": "{#31}   {#32}    {#33}    {#34}    {#35}    {#36}    {#37}    {#38}    "
        },
        {
          "type": "custom",
          "format": "{#31}┌─────────────────────────────────────────────────┐"
        },
        {
          "type": "os",
          "key": "❄️ OS",
          "keyColor": "blue"
        },
        {
          "type": "host",
          "key": " ❄️ "
        },
        {
          "type": "kernel",
          "key": "   "
        },
        {
          "type": "packages",
          "key": "  📦 "
        },
        {
          "type": "shell",
          "key": "  🐚 "
        },
        {
          "type": "custom",
          "format": "│"
        },
        {
          "type": "de",
          "key": "🪟 DE/WM",
          "keyColor": "green"
        },
        {
          "type": "wmtheme",
          "key": "  🎨 "
        },
        {
          "type": "terminalfont",
          "key": "𝓐  font"
        },
        {
          "type": "terminal",
          "key": "  >_ "
        },
        {
          "type": "custom",
          "format": "│"
        },
        {
          "type": "cpu",
          "key": "💻 PC",
          "keyColor": "yellow"
        },
        {
          "type": "gpu",
          "key": "  🖥️ "
        },
        {
          "type": "memory",
          "key": "   "
        },
        {
          "type": "uptime",
          "key": "  ⏳ "
        },
        {
          "type": "display",
          "key": "  💻 ",
          "compactType": "resolution"
        },
        {
          "type": "custom",
          "format": "{#31}└─────────────────────────────────────────────────┘"
        },
        {
          "type": "colors",
          "symbol": "",
          "paddingLeft": 2
        }
      ]
    };
  };
}
