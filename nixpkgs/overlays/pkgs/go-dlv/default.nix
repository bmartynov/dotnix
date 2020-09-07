{ stdenv, buildGoModule, fetchgit, fetchhg, fetchbzr, fetchsvn, lib }:

buildGoModule rec {
  name = "golang-dlv-${version}";
  version = "1.5.0";
  rev = "46731820df05e1a2f39f27b7bfb073445b460df6";

  vendorSha256 = null;

  doCheck = false;

  GO111MODULE="on";

  subPackages = [ "cmd/dlv" ];

  src = fetchgit {
    inherit rev;
    url = "https://github.com/go-delve/delve";
    sha256 = "0m7fryclrj0qzqzcjn0xc9vl43srijyfahfkqdbm59xgpws67anp";
  };
}