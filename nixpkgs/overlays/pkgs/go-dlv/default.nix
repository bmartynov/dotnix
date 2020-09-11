{ stdenv, buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  name = "golang-dlv-${version}";
  version = "1.5.0";
  vendorSha256 = null;

  doCheck = false;

  subPackages = [ "cmd/dlv" ];

  src = fetchFromGitHub {
    owner = "go-delve";
    repo = "delve";
    rev = "v${version}";
    sha256 = "0m7fryclrj0qzqzcjn0xc9vl43srijyfahfkqdbm59xgpws67anp";
  };
}