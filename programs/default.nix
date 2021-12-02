{pkgs, lib, ...}:
{
    fish = import ./fish {inherit pkgs; };
    vim = import ./vim { inherit pkgs; };
    git = import ./git;
    bash = import ./bash;
    kitty = import ./kitty;
    starship = import ./starship { inherit lib; };
    vscode = import ./vscode { inherit pkgs; };
}
