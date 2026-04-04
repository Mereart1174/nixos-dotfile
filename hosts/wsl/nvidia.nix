{ config, lib, pkgs, ... }:
{
  # ===============================================================================================
  # for Nvidia GPU
  # https://wiki.nixos.org/wiki/NVIDIA
  # https://wiki.hyprland.org/Nvidia/
  # ===============================================================================================

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

  environment.systemPackages = with pkgs; [
    # 并不安装驱动内核，只安装工具包
    pciutils
    cudatoolkit
  ];
}
