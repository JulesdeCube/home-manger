{ pkgs }: {
  enable = true;
  functions = {
    fish_greeting = "";
    iclip = ''
      echo $1 
      xclip -selection clipboard -t (file -b --mime-type $argv[1]) -i $argv[1]
    '';
  };
  shellAliases = {
    ls = "ls --color=auto --hyperlink=auto";
    la = "ls --color=auto --hyperlink=auto -A";
    ll = "ls --color=auto --hyperlink=auto -Alh";
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
    gl = "git lg";
    gd = "git diff";
    gt = "git tag";
    rm = "rm -d";
  };
  interactiveShellInit = ''
    set EDITOR vim
    set TERMINAL kitty
    fish_vi_key_bindings
  '';
}
