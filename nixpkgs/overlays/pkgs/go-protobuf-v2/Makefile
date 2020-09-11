build:
	nix-shell \ 
		-p go git vgo2nix go2nix \ 
		--command  'cd $(mktemp -d); \ 
			export GOPATH=`pwd`; \ 
			go get google.golang.org/protobuf/...; \ 
			cd src/google.golang.org/protobuf/cmd/protoc-gen-go/; \ 
			go2nix save; \ 
			vgo2nix; \
			mv *.nix ~/.config/nixpkgs/overlays/pkgs/protobuf-v2'