{
  description = "Simple devshell to use the kubectl and the Flux CLI";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            kubectl
            fluxcd
            age
            sops
          ];
          
          # Relative instead of in the store for security
          KUBECONFIG = "./kubeconfig.yaml";
        };
      }
    );
}
