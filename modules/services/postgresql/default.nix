{pkgs, config, ...}:

{
  services = {
    postgresql = {
      enable = true;
      package = pkgs.postgresql;
      enableTCPIP = true;
      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host all all ::1/128 trust
      '';
    };
  };
}
