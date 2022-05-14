{}: {
  enable = true;

  matchBlocks = rec {
    home_storage-1 = {
      hostname = "storage-1.home.JulesdeCube.com";
      proxyJump = "home_gate";
    };
    home_gate = {
      hostname = "gate.home.JulesdeCube.com";
    };
    home = home_gate;
    cri = {
      hostname = "cri.JulesdeCube.com";
      port = 22238;
    };
    "*.cri.redeploy.me" = {
      proxyJump = "root@gate-bocal.redeploy.me";
      user = "root";
    };
  };
  extraConfig = ''
  PubkeyAcceptedAlgorithms +ssh-rsa
  HostkeyAlgorithms +ssh-rsa
  KexAlgorithms=+diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
  '';
}
