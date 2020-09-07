self: super: {
  go-grpc-gateway = super.callPackage ./pkgs/go-grpc-gateway {};
  go-protobuf-v2 = super.callPackage ./pkgs/go-protobuf-v2 {};
  go-google-golang-grpc = super.callPackage ./pkgs/go-google-golang-grpc {};
  go-dlv = super.callPackage ./pkgs/go-dlv {};
  go-gopls = super.callPackage ./pkgs/go-gopls {};
}