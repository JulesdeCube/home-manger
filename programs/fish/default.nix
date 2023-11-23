{ pkgs }: {
  enable = true;
  functions = {
    fish_greeting = "";
    envsource = ''
      for line in (cat $argv | grep -v '^#')
          set item (string split -m 1 '=' $line)
          set -gx $item[1] $item[2]
          echo "Exported key $item[1]"
      end
    '';
    iclip = ''
      echo $1
      xclip -selection clipboard -t (file -b --mime-type $argv[1]) -i $argv[1]
    '';
  };
  shellAliases = {
    ns = "nix-shell --run fish -p";
    nd = "nix develop -c fish";
    ls = "ls --color=auto --hyperlink=auto";
    la = "ls --color=auto --hyperlink=auto -A";
    ll = "ls --color=auto --hyperlink=auto -Alh";
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
    k = "kubecolor";
  };
  interactiveShellInit = ''
    set EDITOR vim
    set TERMINAL kitty
    fish_vi_key_bindings
    set -U fish_cursor_default line
  '';
}
