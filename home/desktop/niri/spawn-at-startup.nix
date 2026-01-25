niri: {
  programs.niri.config =
    let
      inherit (niri.lib.kdl)
        node
        plain
        leaf
        flag
        ;
    in
    [
      # Add lines like this to spawn processes at startup.
      # Note that running niri as a session supports xdg-desktop-autostart,
      # which may be more convenient to use.
      # --------------- Terminal ---------------
      (leaf "spawn-at-startup" [ "alacritty" ])
    ];
}
