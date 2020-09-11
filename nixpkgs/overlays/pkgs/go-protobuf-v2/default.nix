{ stdenv, buildGoModule, fetchgit, lib }:

buildGoModule rec {
  name = "protobuf-v2-${version}";
  version = "1.25.0";
  rev = "0fd4f3a506894c05a9cad2d52c521a8ce953b49d";

  vendorSha256 = "0fcp09zyaxlzd7i6wj4z3pdiiydbiz0lma0vzdaw1f84br6sp4ms"; #lib.fakeSha256;

  doCheck = false;
  
  subPackages = [ "cmd/protoc-gen-go" ];

  src = fetchgit {
    inherit rev;
    url = "https://go.googlesource.com/protobuf";
    sha256 = "0hq3rcn28pzzcynfi71qkf2bqgd5j4ng0cxqr8pjjnjz5l7ih3y3";
  };
}