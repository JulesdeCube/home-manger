{ pkgs, lib, config, ... }: {
  bash = import ./bash;
  fish = import ./fish { inherit pkgs; };
  nushell = import ./nushell;
  git = import ./git;
  kitty = import ./kitty;
  rofi = import ./rofi { inherit pkgs config lib; };
  ssh = import ./ssh { };
  starship = import ./starship { inherit lib; };
  neovim = import ./neovim;
  vim = import ./vim { inherit pkgs; };
  vscode = import ./vscode { inherit pkgs; };
}
