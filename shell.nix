{ pkgs ? import <nixpkgs> { overlays = [ (import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz)) ]; },}:
with pkgs;

mkShell {
  nativeBuildInputs = with xorg; [
    libxcb
    libXcursor
    libXrandr
    libXi
    pkg-config
  ] ++ [
    rustup
    cargo
    rustc
    atk
    gdk-pixbuf
    webkitgtk
    glib
    libGL
    libGLU
    libxkbcommon
    gtk3-x11
    gnome.zenity
  ];

  buildInputs = [
    latest.rustChannels.stable.rust
    xorg.libX11
    wayland
    libxkbcommon
    zlib
    glibc
  ];

  shellHook = ''
    export LD_LIBRARY_PATH=/run/opengl-driver/lib/:${lib.makeLibraryPath ([libGL libGLU libxkbcommon glibc])}:/nix/store/dbcw19dshdwnxdv5q2g6wldj6syyvq7l-glibc-2.39-52/lib
    rustup toolchain install stable
    rustup default stable
    rustup target add x86_64-unknown-linux-gnu
    rustup target add x86_64-unknown-linux-musl
  '';
}
