{
  pkgs ? import <nixpkgs> { },
  lib ? import <nixpkgs> { },
  stdenv ? pkgs.stdenv,
  ...
}:

let
  shell = import ./shell.nix {
    inherit pkgs lib;
  };
in
stdenv.mkDerivation {
  pname = "seekers-api";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = shell.nativeBuildInputs;

  buildPhase = ''
    mkdir -p build/
    python \
    -m grpc_tools.protoc \
    --python_out=build \
    --grpc_python_out=build \
    --proto_path=./ \
    --plugin=protoc-gen-mypy="${pkgs.python312Packages.mypy-protobuf}/bin/protoc-gen-mypy" \
    --mypy_out=build \
    --experimental_allow_proto3_optional \
    seekers/api/*.proto
  '';

  installPhase = ''
    mv build/ $out/
  '';
}
