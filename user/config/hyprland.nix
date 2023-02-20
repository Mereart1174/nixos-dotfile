{ config, lib, ... }:

{
    wayland.windowManager.hyprland.extraConfig = ''
        monitor = DP-1, 1920x1080@60, 0x0, 1
        # monitor=,preferred,auto,1
        
        # exec-once = $HOME/.config/hypr/scripts/autostart
        
        exec-once = dunst &
        exec-once = wlsunset -l 90.0:0.0 -t 4000 &
        exec-once = waybar &
        exec-once = fcitx5 -dr &
        # exec-once = swww init; swww img ~/.config/nixos/user/pics/wallpaper/11.jpg &
        exec-once = mpvpaper -o "no-audio loop" eDP-1 ~/.config/nixos/user/pics/wallpaper/flammable.mp4 &
        
        $mod = SUPER
        $terminal = alacritty
        $terminal_up = Alacritty
        $launcher = rofi
        $launcher_up = Rofi
        $browser = firefox
        $lock = swaylock
        
        # Mouse，Touchpad，Natural Rolling Default
        input {
            follow_mouse = 0
        }
        
        master {
            new_on_top = true
        }
        
        # Interval，Border，Layout
        general {
            sensitivity = 0.7
        
            # gaps_in = 6
            gaps_in = 0
            # gaps_out = 12
            gaps_out = 0
            border_size = 4
            # col.active_border = 0x7E94C2de
            col.active_border = 0xCEB4A5de
            col.inactive_border = 0x4d4f6666
        
            # damage_tracking = full
            # layout = dwindle
        }
        
        # No idea
        # dwindle {
        #     pseudotile = 0 # enable pseudotiling on dwindle
        # }
        
        # misc {
        #     disable_hyprland_logo = true
        #     disable_splash_rendering = true
        #     enable_swallow = true
        #     swallow_regex = ^(kitty)$
        # }
        
        # Rounded Corners, Blur, Opacity
        decoration {
            rounding = 5
            blur_new_optimizations = true
            blur = false
            blur_size = 1
            blur_passes = 1
        
            # multisample_edges = 0
            active_opacity = 1
            inactive_opacity = 1
            fullscreen_opacity = 1
        
            drop_shadow = true
            shadow_range = 100
            shadow_render_power = 5
            shadow_ignore_window = 1
            # shadow_offset= 2 4
            col.shadow= 0x33000000
            col.shadow_inactive=0x22000000
            rounding = 15
        }
        
        animations {
            enabled = 1
            bezier=overshot,0.13,0.99,0.29,1.1
            animation=windows,1,4,overshot,slide
            animation = border, 1, 10, default
            animation = fade, 1, 10, default
            animation = workspaces, 1, 6, overshot, slidevert
        }
        
        # 手势
        # gestures {
        #     workspace_swipe = yes
        # }
        
        windowrule = tile, title:Spotify
        windowrule = float, *.exe
        # windowrule = fullscreen, wlogout
        # windowrule = float, title:wlogout
        # windowrule = fullscreen, title:wlogout
        
        windowrulev2 = workspace 4, xwayland:1
        windowrule = float, QQ
        windowrule = float, thunar
        windowrule = fullscreen, $browser
        windowrule = workspace 2, $browser
        windowrule = opacity 0.8 override 0.8 override, $terminal_up
        windowrule = animation slidedown, $launcher_up
        windowrule = float, $launcher_up
        windowrule = workspace unset, $launcher_up
        windowrule = workspace unset, clion
        
        windowrule = float, title:^(Media viewer)$
        windowrule = float, title:^(Transmission)$
        windowrule = float, title:^(Volume Control)$
        windowrule = float, title:^(Picture-in-Picture)$
        windowrule = size 800 600, title:^(Volume Control)$
        windowrule = move 75 44%, title:^(Volume Control)$
        
        ## 快捷键，
        # $mod : globle function
        # CTRL : cross workspace opration
        # ALT : workspace inner
        
        bind = ALT SHIFT, Return, exec, $terminal
        bind = $mod, C, killactive,
        # bind = $mod, G, changegroupactive,
        # bind = $mod, T, togglegroup,
        bind = $mod SHIFT, Q, exit,
        bind = $mod, L, exec, $lock
        # bind = ALT SHIFT, Q, exec, wlogout
        bind = $mod, V, togglefloating,
        bind = $mod, X, centerwindow,
        bindm = $mod, mouse:273, resizewindow
        bind = $mod, O, exec, killall $launcher || $launcher -show drun
        bind = $mod, 0, fullscreen,
        bind = $mod, P, exec, grim -g "$(slurp)" - | wl-copy; notify-send "Over! Over!"
        bind = $mod SHIFT, P, exec, grim - | wl-copy; notify-send "已截图到 Clipboard!"
        bind = $mod, H, exec, hyprpicker -a
        
        # Firefox take up the Alt
        bind = $mod, left, movefocus, l
        bind = $mod, right, movefocus, r
        bind = $mod, up, movefocus, u
        bind = $mod, down, movefocus, d
        
        bind = $mod, 1, workspace, 1
        bind = $mod, 2, workspace, 2
        bind = $mod, 3, workspace, 3
        bind = $mod, 4, workspace, 4
        bind = $mod, 5, workspace, 5
        bind = $mod, 6, workspace, 6
        bind = $mod, 7, workspace, 7
        bind = $mod, 8, workspace, 8
        bind = $mod, 9, workspace, 9
        
        binde = ALT SHIFT, left, resizeactive, -20 0
        binde = ALT SHIFT, right, resizeactive, 20 0
        binde = ALT SHIFT, up, resizeactive, 0 20
        binde = ALT SHIFT, down, resizeactive, 0 -20
        
        bind = ALT $mod, left, movewindow, l
        bind = ALT $mod, right, movewindow, r
        bind = ALT $mod, up, movewindow, u
        bind = ALT $mod, down, movewindow, d
        # bind = , escape, submap, reset
        # submap = reset
        
        bind = CTRL, left, workspace, e-1
        bind = CTRL, right, workspace, e+1
        
        bind = CTRL ALT, 1, movetoworkspace, 1
        bind = CTRL ALT, 2, movetoworkspace, 2
        bind = CTRL ALT, 3, movetoworkspace, 3
        bind = CTRL ALT, 4, movetoworkspace, 4
        bind = CTRL ALT, 5, movetoworkspace, 5
        bind = CTRL ALT, 6, movetoworkspace, 6
        bind = CTRL ALT, 7, movetoworkspace, 7
        bind = CTRL ALT, 8, movetoworkspace, 8
        bind = CTRL ALT, 9, movetoworkspace, 9
        bind = CTRL ALT, right, movetoworkspace, +1
        bind = CTRL ALT, left, movetoworkspace, -1
        
        bindle = , XF86MonBrightnessUp, exec, brightnessctl set +10%
        bindle = , XF86MonBrightnessDown, exec, brightnessctl set 10%-
        bindle = , XF86AudioRaiseVolume, exec, pamixer -i 5
        bindle = , XF86AudioLowerVolume, exec, pamixer -d 5
        bind = , XF86AudioMute, exec, pamixer -t
        
        bind = $mod, T, exec, notify-send -u low `date +"%H:%M:%S"`
        bind = $mod, M, exec, [float; size 50%; center] $terminal -e cava
        bind = $mod SHIFT, Return, exec, [float; size 80%; center; opacity 0.7] $terminal
    '';
}
