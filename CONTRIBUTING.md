# Contributing

Hey there! Want to help make Seekers API even more amazing? That's cool! Here's some information you should know before getting started:

## Creating an issue

If you want to open an issue, please use the _bug report_ template if something is not working or the _feature request_ if you have a cool idea you think we should.

## Creating a pull request

For creating a pull request, please fork and then clone this project. Make and test your changes, then create a pull request using the pull request template.

## Build the project yourself

After that, install all requirements. Seekers API requires [Python 3](https://www.python.org/downloads/) and the following python packages for the build:

- `mypy-protobuf`
- `grpclib`
- `grpcio-tools`
- `protobuf`

For installing the requirements, we recommend setting up a virtual environment (e.g. `venv`).
You can install the requirements with:

```sh
pip install mypy-protobuf grpclib grpcio-tools protobuf
```

To build the [gRPC](https://grpc.io/) files, run the following command:

```sh
mkdir -p build/
python \
-m grpc_tools.protoc \
--python_out=build \
--grpc_python_out=build \
--proto_path=./ \
--plugin=protoc-gen-mypy="$(which protoc-gen-mypy)" \
--mypy_out=build \
--experimental_allow_proto3_optional \
seekers/api/*.proto
```

Alternatively, you can use [Nix](https://nixos.org/) to both get the dependencies and build the project.
If you are using stable Nix:

```sh
nix-build
```

If you are using Nix flakes:

```sh
nix build
```

And that's it!

## Commit messages

Write your commit messages **in English only**! Please use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).
Your commit messages should follow this structure:

- feat: add your cool new feature
- fix: fix a bug
- docs: add or improve documentation
- style: reformat code (no logic changes)
