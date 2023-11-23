{
  enable = true;
  delta.enable = true;

  userName = "Jules Lefebvre";
  userEmail = "jules@cri.epita.fr";

  signing = {
    key = "AF0414400CB1566E";
    signByDefault = true;
  };

  aliases = {
    tree =
      "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    stat =
      "log --stat --decorate --format=format:'%C(bold blue)%h %C(bold red)<%an> %C(bold green)(%ad)%C(reset)%n%C(bold yellow)%D%C(reset)%n%C(bold white)%s%n%n%C(reset)%C(white)%b%C(reset)'";
    lg =
      "log --abbrev-commit --decorate --format=format:'%C(bold blue)%h %C(bold red)<%an> %C(bold green)(%ar)%C(reset) %C(white)%s%C(bold yellow)%d%C(reset)'";
    cd = "checkout";
    b = "branch";
    c = "commit";
    s = "status";
    a = "add";
  };

  ignores = [ "*~" "*.swp" "*.d" "*.o" ];

  lfs.enable = true;

  extraConfig = {
    push.followTags = true;
    init.defaultBranch = "main";
    grep.extendedRegexp = true;
  };
}
