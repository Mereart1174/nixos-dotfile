{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "file";
        source = "/home/philo/nixos-dotfile/home/desktop/base/config/neofetch.logo";
        padding = {
          top = 2;
          right = 3;
        };
      };
      display = {
        color = "blue";
        separator = " ├ => ";
      };
      modules = [
        {
          type = "custom";
          format = "{#31}        {#32}     {#33}     {#34}     {#35}     {#36}     {#37}     {#38}    ";
        }
        {
          type = "custom";
          format = "  {#31}┌─────────────────────────────────────────────────┐";
        }
        {
          type = "os";
          key = "  ❄️ ";
          keyColor = "blue";
        }
        {
          type = "host";
          key = "  🏠";
        }
        {
          type = "kernel";
          key = "  ⚙️ ";
        }
        {
          type = "packages";
          key = "  📦";
        }
        {
          type = "shell";
          key = "  🐚";
        }
        {
          type = "de";
          key = "🪟 DE/WM";
          keyColor = "green";
        }
        {
          type = "wmtheme";
          key = "  🎨 ";
        }
        {
          type = "terminalfont";
          key = "  𝓐 ";
        }
        {
          type = "terminal";
          key = "  >_";
        }
        {
          type = "cpu";
          key = "   ";
        }
        {
          type = "gpu";
          key = "  🖥️ ";
        }
        {
          type = "memory";
          key = "  💾";
        }
        {
          type = "uptime";
          key = "  ⏳";
        }
        {
          type = "display";
          key = "  💻";
          compactType = "resolution";
        }
        {
          type = "custom";
          format = "  {#31}└─────────────────────────────────────────────────┘";
        }
        {
          type = "custom";
          format = "{#31}        {#32}     {#33}     {#34}     {#35}     {#36}     {#37}     {#38}    ";
        }
      ];
    };
  };
}
