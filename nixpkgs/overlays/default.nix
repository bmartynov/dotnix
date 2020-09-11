self: super: {
  go-grpc-gateway = super.callPackage ./pkgs/go-grpc-gateway {};
  go-protobuf-v2 = super.callPackage ./pkgs/go-protobuf-v2 {};
  go-protoc-gen-go-grpc = super.callPackage ./pkgs/go-protoc-gen-go-grpc {};
  go-dlv = super.callPackage ./pkgs/go-dlv {};
  go-gopls = super.callPackage ./pkgs/go-gopls {};
}