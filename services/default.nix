{ pkgs, lib, ... }: {
  polybar = import ./polybar { inherit pkgs lib; };
  picom = import ./picom { };
  # sxhkd = import ./sxhkd { }; 
}
