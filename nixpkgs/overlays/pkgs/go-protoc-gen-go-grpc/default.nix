{ stdenv, buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  name = "protoc-gen-go-grpc-${version}";
  version = "1.31.1";

  vendorSha256 = "sha256:154b3659h54imq6mc18wdjca897wy0wvakg3vff7k6bccg77sxr8";#lib.fakeSha256;
  
  doCheck = false;

  preConfigure = "cd cmd/protoc-gen-go-grpc";

  src = fetchFromGitHub {
    owner = "grpc";
    repo = "grpc-go";
    rev = "v${version}";
    sha256 = "18565vf9i2zc69znd9b8a2iz0kgv5cms0g0ppj93hnhri8rjqagk";
  };
}