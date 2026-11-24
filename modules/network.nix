{ ... }:

let
  myDnsList = [ "80.67.169.12" ];
in

{
  networking = {
    nameservers = myDnsList;
    useNetworkd = true;
    hostName = "nixos";
    wireless = {
      iwd = {
        enable = true;
        settings = {
          Network = {
            EnableIPv6 = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
  };
}
