{
  pkgs ? import <nixpkgs> { },
  lib ? import <nixpkgs/lib> { },
  ...
}:

pkgs.mkShell {
  packages = with pkgs; [
    nixfmt-rfc-style
  ];

  nativeBuildInputs = with pkgs; [
    python312Packages.mypy-protobuf
    python312Packages.grpclib
    python312Packages.grpcio-tools
    python312Packages.protobuf
  ];
}
