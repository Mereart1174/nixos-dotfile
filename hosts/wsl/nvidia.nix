{ config, lib, pkgs, ... }:
{
  # ===============================================================================================
  # for Nvidia GPU
  # https://wiki.nixos.org/wiki/NVIDIA
  # https://wiki.hyprland.org/Nvidia/
  # ===============================================================================================

  boot.kernelParams = [
    # Since NVIDIA does not load kernel mode setting by default,
    # enabling it is required to make Wayland compositors function properly.
    "nvidia-drm.fbdev=1"
  ];
  services.xserver.videoDrivers = [ "nvidia" ]; # will install nvidia-vaapi-driver by default
  hardware.nvidia = {
    # Open-source kernel modules are preferred over and planned to steadily replace proprietary modules
    open = false;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/os-specific/linux/nvidia-x11/default.nix
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # required by most wayland compositors!
    modesetting.enable = true;
    powerManagement.enable = true;
  };

  # hardware.nvidia-container-toolkit.enable = true;
  hardware.graphics = {
    enable = true;
    # needed by nvidia-docker
    enable32Bit = true;
  };

  # 解决 "Could not start dynamically linked executable" 的核心配置
  # nix-ld 会创建一个兼容层，让那些硬编码了动态链接路径的程序能找到库
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
    # 如果你要运行预编译的 CUDA 程序，可能还需要这些：
    linuxPackages.nvidia_x11
    # libglow
    glib
  ];
}
