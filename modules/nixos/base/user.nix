{
  myvars,
  config,
  pkgs,
  ...
}:
{
  # Don't allow mutation of users outside the config.
  users.mutableUsers = false;

  users.groups = {
    "${myvars.username}" = { };
    podman = { };
    wireshark = { };
    # for android platform tools's udev rules
    adbusers = { };
    dialout = { };
    # for openocd (embedded system development)
    plugdev = { };
    # misc
    uinput = { };
  };

  users.users."${myvars.username}" = {
    home = "/home/${myvars.username}";
    isNormalUser = true;
    shell = pkgs.zsh;
    initialPassword = "1234";
    extraGroups = [
      myvars.username
      "users"
      "wheel"
      "networkmanager" # for nmtui / nm-connection-editor
      "podman"
      "wireshark"
      "adbusers" # android debugging
      "libvirtd" # virt-viewer / qemu
    ];
  };

  users.users.root = {
    shell = pkgs.zsh;
    initialPassword = "1234";
  };

  programs.zsh.enable = true;
}
