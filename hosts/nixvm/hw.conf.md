Add the following to /etc/hardware-configuration.nix:

```
  system.fsPackages = [ pkgs.open-vm-tools ];

  fileSystems."/mnt" = {
    device = ".host:/";
    fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
    options = ["umask=22" "uid=1000" "gid=100" "allow_other" "defaults" "auto_unmount" "nofail"];
  };
```