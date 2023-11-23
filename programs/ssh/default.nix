{}: rec {
  enable = true;

  matchBlocks = {
    # julesdecube.com
    "*home.julesdecube.com *oci.julesdecube.com" = {
      port = 2222;
    };

    "*.home.julesdecube.com" = {
      proxyJump = "home.julesdecube.com";
    };

    # tcom.epita.fr

    "*.tcom.openstack.epita.fr" = {
      proxyJump = "tcom.epita.fr";
      user = "root";
    };

    "tcom.epita.fr" = {
      user = "root";
    };


    # srs.epita.fr

    "*.srs.epita.fr srs.epita.fr" = {
      user = "root";
    };

    "198.18.*" = {
      user = "root";
      proxyJump = "172.19.112.107";
    };

    "172.19.112.107" = {
      user = "root";
    };

    # cri.epita.fr
    "bastion.cri-playground.iaas.epita.fr" = {
      user = "root";
    };

    "*.cri_playground.openstack.epita.fr" = {
      proxyJump = "bastion.cri-playground.iaas.epita.fr";
      user = "root";
    };

    "bastion.iaas.cri.epita.fr" = {
      user = "root";
      port = 2222;
    };
    "srvc-maas-worker-standalone.cri-playground.openstack.epita.fr" = {
      user = "root";
      hostname = "192.168.99.243";
      proxyJump = "root@bastion.cri-playground.iaas.epita.fr";
    };

    "*.cri.openstack.epita.fr" = {
      user = "root";
      proxyJump = "bastion.iaas.cri.epita.fr";
    };

    "*.cri.epita.fr !gitlab.iaas.cri.epita.fr !bastion.iaas.cri.epita.fr" = {
      user = "root";
      port = 22;
    };

    "*.cri.epita.fr !gitlab.cri.epita.fr !gate.cri.epita.fr !bastion.iaas.cri.epita.fr" = {
      proxyJump = "root@gate.cri.epita.fr";
    };

    # KB in the order: Cisco, Midlab, Lab SR, SM 14, SM 15
    "10.202.7.* 10.224.33.* 10.224.34.* 10.224.35.* 10.224.36.*" = {
      user = "root";
      port = 22;
      proxyJump = "root@gate.cri.epita.fr";
      extraOptions.StrictHostKeyChecking = "no";
    };

    # VJ in the order 302, 303, 304, 305, 306, 311
    "10.224.52.* 10.224.53.* 10.224.54.* 10.224.55.* 10.224.56.* 10.224.57.*" = {
      user = "root";
      port = 22;
      proxyJump = "root@gate.cri.epita.fr";
      extraOptions.StrictHostKeyChecking = "no";
    };

    # SBG, TLS, RNS, LYN
    "10.57.117.* 10.57.30.* 10.57.19.* 10.57.12.*" = {
      user = "root";
      port = 22;
      proxyJump = "root@gate.cri.epita.fr";
      extraOptions.StrictHostKeyChecking = "no";
    };
  };


}
