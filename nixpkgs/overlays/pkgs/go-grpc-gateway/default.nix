{ stdenv, buildGoModule, fetchgit, fetchhg, fetchbzr, fetchsvn, lib, }:

buildGoModule rec {
  name = "grpc-gateway-${version}";
  version = "master";
  rev = "3655adbf98e78a01541695150b4b232fc6bf8bff";

  vendorSha256 = "1rsnnzjpzjg4iacf2w2sh955dj6jdqhcvi7pijd4kc89dyv9k5r7";

  doCheck = false;

  GO111MODULE="on";

  subPackages = [ "protoc-gen-grpc-gateway" "protoc-gen-swagger" ];

  src = fetchgit {
    inherit rev;
    url = "https://github.com/grpc-ecosystem/grpc-gateway";
    sha256 = "0q6vwnjqf70qznp7phwi76f6nqz9rq255a4gs1nysk7fs9vf5dbd";
    # sha256 = lib.fakeSha256;
  };
}