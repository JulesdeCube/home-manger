{ pkgs, lib, ... }:
{
  polybar = import ./polybar {
    inherit pkgs;
    inherit lib;
  };
  picom = import ./picom { };
}
