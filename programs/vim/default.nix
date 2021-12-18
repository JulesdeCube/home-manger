{ pkgs, ... }: {
  enable = true;
  plugins = with pkgs.vimPlugins; [
    vim-airline
    vim-airline-themes
    # plugins.onedark-vim
  ];
  settings = {
    number = true;
    relativenumber = true;
    copyindent = true;
    expandtab = true;
    tabstop = 4;
    shiftwidth = 4;
  };
  extraConfig = (builtins.readFile ./src/vimrc.vim);
}
