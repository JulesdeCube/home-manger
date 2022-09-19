{}: {
  enable = true;

  matchBlocks = rec {

    # Home
    "home.julesdecube.com" = {
      user = "jules";
      port = 2222;
    };

    "bastion-*.home.julesdecube.com" = {
      proxyJump = "home.julesdecube.com";
      user = "jules";
    };

    "storage-*.home.julesdecube.com" = {
      proxyJump = "home.julesdecube.com";
      user = "jules";
    };

    "compute-*.home.julesdecube.com" = {
      proxyJump = "home.julesdecube.com";
      user = "root";
    };

    # exploit
    "exploit-1.julesdecube.com" = {
      proxyJump = "bastion-1.home.julesdecube";
      host = "127.0.0.1";
      port = 2222;
    };

    # CRI

    "cri.julesdecube.com" = {
      port = 22238;
    };

    "*.cri.julesdecube.com" = {
      proxyJump = "cri.julesdecube.com";
      user = "root";
    };

    # Redeploy.me

    "*.cri.redeploy.me" = {
      proxyJump = "root@gate-bocal.redeploy.me";
      user = "root";
    };
  };


  # extraConfig = ''
  # PubkeyAcceptedAlgorithms +ssh-rsa
  # HostkeyAlgorithms +ssh-rsa
  # KexAlgorithms=+diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
  # '';
}
