{
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    flake = "git+https://github.com/nixos/infra.git?ref=main";
    allowReboot = true;
  };
}