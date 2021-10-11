{
    enable = true;
    historyIgnore = [ "fg" "ls" "ll" "la" ".." "cd" "exit" ];
    shellAliases = {
        ls = "ls --color=auto";
        la = "ls --color=auto -A";
        ll = "ls --color=auto -Alh";
        ".." = "cd ..";
        icat = "kitty +kitten icat";
        ssh = "kitty +kitten ssh";
        term = "kitty --detach";
        remote_gdb = "gdb -q -ex \"target remote localhost:1234\" -ex tab";
    };
    # initExtra = (builtins.readFile ./jules/.bashrc);
}