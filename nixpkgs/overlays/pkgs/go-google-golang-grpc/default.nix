{ stdenv, buildGoModule, fetchFromGitHub, fetchhg, fetchbzr, fetchsvn }:

buildGoModule rec {
  name = "grpc-unstable-${version}";
  version = "1.31.1";

  vendorSha256 = null;

  doCheck = false;

  GO111MODULE="on";

  subPackages = [ "cmd/protoc-gen-go-grpc" ];

  src = fetchFromGitHub {
    owner = "grpc";
    repo = "grpc-go";
    rev = "v${version}";
    sha256 = "18565vf9i2zc69znd9b8a2iz0kgv5cms0g0ppj93hnhri8rjqagk";
  };
}