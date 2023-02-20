{ config, lib, pkgs, ... }:

{
    nix = {
        settings = {
            auto-optimise-store = true;
            allowed-users = [ "root" "phil" ];
            substituters = lib.mkForce [
                "https://mirrors.ustc.edu.cn/nix-channels/store"
                "https://cache.nixos.org"
            ];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
        extraOptions = ''
            experimental-features = nix-command flakes
            keep-outputs = true
            keep-derivations = true
        '';
    };

    hardware = {
        nvidia = {
            open = true;
            powerManagement.enable = true;
	    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
        };
	cpu.intel.updateMicrocode = true;
        opengl = {
            enable = true;
            extraPackages = with pkgs; [
                intel-media-driver
            ];
        };
    };

    boot = {
        initrd = {
            # kernelModules = [
            #     "intel_agp" "i915"
            #     "nvidia" "nvidia_modeset"
            #     "nvidia_uvm" "nvidia_drm"
            # ];
            availableKernelModules = [ "xhci_pci" "nvme" "usbhid" ];
            systemd.enable = true;
            verbose = false;
        };
        kernelParams = [
            "intel_iommu=on"
            "nowatchdog"
            "nvidia-drm.modeset=1"
        ];
        supportedFilesystems = [ "ntfs" ];
        cleanTmpDir = true;
        kernelPackages = pkgs.linuxKernel.packages.linux_zen;
        # kernelPackages = pkgs.linuxPackages_latest;
        loader = {
            efi = {
	    	efiSysMountPoint = "/boot/efi";
		canTouchEfiVariables = true;
	    };
            timeout = 0;
            grub = {
                enable = true;
	        default = 0;
                efiSupport = true;
                device = "nodev";
                theme = ../user/extraConfig/CyberEXS;
                ## useOSProber = true;
                # extraEntries = ''
                #     menuentry "Windows 11" {
                #         search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
                #         chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
                #     }
                # '';
            };
        };
    };

    networking = {
        networkmanager.enable = true;
	hostName = "Philomatics";
    };

    services = {
    	xserver = {
	    # enable = true; ++ lightdm
	    # videoDrivers = [ "nvidiaLegacy470" ];
	};
        openssh = {
            enable = true;
        };
        dbus = {
            enable = true;
        };
        pipewire = {
            enable = true;
            alsa = {
                enable = true;
                support32Bit = true;
            };
            pulse.enable = true;
        };
        greetd = {
            enable = true;
            settings = {
                default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${pkgs.writeShellScript "Hyprland-greetd" ''
		    export $(/run/current-system/systemd/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)
		    exec Hyprland
		''}";
            };
        };
    };

    xdg = {
        portal = {
            enable = true;
            wlr.enable = true;
            extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
        };
    };

    security = {
        sudo.enable = false;
        rtkit.enable = true;
        doas = {
            enable = true;
            extraRules = [{
                users = [ "phil" ];
                keepEnv = true;
                persist = true;
            }];
        };
    };

    nixpkgs.config.allowUnfree = true;
    programs.dconf.enable = true;

    environment = {
        variables = {
            GTK_IM_MODULE = "fcitx";
            QT_IM_MODULE = "fcitx";
            XMODIFIERS = "@im=fcitx";
            INPUT_METHOD = "fcitx";
            SDL_IM_MODULE = "fcitx";
            MOZ_ENABLE_WAYLAND = "1";
            GBM_BACKEND = "nvidia-drm";
            __GLX_VENDOR_LIBRARY_NAME = "nvidia";
            WLR_BACKEND = "vulkan";
            XDG_SESSION_TYPE = "wayland";
            CLUTTER_BACKEND = "wayland";
            SDL_VIDEODRIVER = "wayland";

            XDG_CACHE_HOME = "\${HOME}/.cache";
            XDG_CONFIG_HOME = "\${HOME}/.config";
            XDG_BIN_HOME = "\${HOME}/.local/bin";
            XDG_DATA_HOME = "\${HOME}/.local/share";
        };
        systemPackages = with pkgs; [
	    # linux_zen.nvidia_x11_legacy470;
            wireplumber
            wayland
            wayland-utils
            egl-wayland
            wayland-protocols
            xwayland
            alsa-lib
            alsa-utils
            linux-firmware
            ntfs3g
            acpi
        ];
    };

    system.stateVersion = "22.11";
}
