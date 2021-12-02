{ pkgs, ... }:
{
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      # matklad.rust-analyzer
    ];
}
