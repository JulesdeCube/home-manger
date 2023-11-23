{ pkgs, lib, ... }: {
    polybar = import ./polybar { inherit pkgs lib; };
    picom = import ./picom { };
    nextcloud-client = import ./nextcloud { };
}
