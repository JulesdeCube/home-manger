{ pkgs }: {
  enable = true;
  functions = { fish_greeting = ""; };
  shellAliases = {
    ls = "ls --color=auto";
    la = "ls --color=auto -A";
    ll = "ls --color=auto -Alh";
    ".." = "cd ..";
    icat = "kitty +kitten icat";
    ssh = "kitty +kitten ssh";
    term = "kitty --detach";
    remote_gdb = ''gdb -q -ex "target remote localhost:1234" -ex tab'';
    g = "git";
    ga = "git add";
    gc = "git commit";
    gs = "git status";
    gps = "git push";
    gpl = "git pull";
    gcd = "git checkout";
  };
  interactiveShellInit = ''
    set EDITOR vim
    set TERMINAL kitty
  '';
}
