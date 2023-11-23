{ pkgs, ... }: {
  enable = true;
  extensions = with pkgs.vscode-extensions;
    [
      matklad.rust-analyzer
    ];
}
