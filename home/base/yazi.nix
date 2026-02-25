{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    # Changing working directory when exiting Yazi
    enableBashIntegration = true;
    settings = {
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        { on = [ "g" "h" ]; run = "cd ~"; desc = "跳转到家目录"; }
        { on = [ "g" "n" ]; run = "cd ~/nixos-dotfile"; desc = "跳转到NixOS配置目录"; }
        { on = [ "g" "c" ]; run = "cd ~/.config"; desc = "跳转到config目录"; }
        { on = [ "g" "f" ]; run = "follow"; desc = "跟随符号链接"; }
      ];
    };
  };
}
