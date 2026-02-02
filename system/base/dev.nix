{
  pkgs,
  ...
}:
{
  services.udev = {
    packages = with pkgs; [
      probe-rs-tools
    ];
  };

}
