{ pkgs, lib, ... }: {
  bash = import ./bash;
  fish = import ./fish { inherit pkgs; };
  git = import ./git;
  kitty = import ./kitty;
  ssh = import ./ssh { };
  starship = import ./starship { inherit lib; };
  vim = import ./vim { inherit pkgs; };
  vscode = import ./vscode { inherit pkgs; };
}
