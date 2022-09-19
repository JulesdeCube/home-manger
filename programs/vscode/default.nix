{ pkgs, ... }: {
  enable = true;
  extensions = with pkgs.vscode-extensions;
    [
      # ms-vsliveshare.vsliveshare
      dbaeumer.vscode-eslint
      # ms-vscode.cpptools
      matklad.rust-analyzer
      # redhat.java
    ];
}
