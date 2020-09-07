{ stdenv, buildGoModule, fetchgit, fetchhg, fetchbzr, fetchsvn, lib }:

buildGoModule rec {
  name = "golang-gopls-${version}";
  version = "0.4.4";

  vendorSha256 = "175051d858lsdir2hj5qcimp6hakbi9grpws1ssvk3r2jna27x1z";

  doCheck = false;

  modRoot = "gopls";

  src = fetchgit {
    rev = "gopls/v${version}";
    url = "https://go.googlesource.com/tools";
    sha256 = "1h4ica6rwrdp5wg4ybpzvyvszj4m5l6w9hpvd9r2qcd9qdnqlykf";
  };
}