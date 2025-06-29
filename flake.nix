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

        krr-image = "us-central1-docker.pkg.dev/genuine-flight-317411/devel/krr:v1.23.0";
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            kubectl
            fluxcd
            age
            sops

            (pkgs.writeShellScriptBin "krr" ''
              # COLUMNS is needed as html formatter doesn't read width properly
              # https://github.com/robusta-dev/krr/issues/428
              WIDTH=180

              docker run \
                -v ./kubeconfig.yaml:/kubeconfig.yaml:ro \
                -v ./krr.html:/krr.html \
                -e COLUMNS=$WIDTH \
                ${krr-image} \
                python krr.py simple \
                  --kubeconfig /kubeconfig.yaml \
                  --prometheus-url http://prom.home:30001 \
                  --width $WIDTH \
                  --formatter html \
                  --fileoutput /krr.html \
                  --namespace '^(?!flux-system$)(?!kube-system$).+$'

              xdg-open krr.html
            '')

            (pkgs.writeShellScriptBin "krr-help" ''
              docker run \
                -v ./kubeconfig.yaml:/kubeconfig.yaml:ro \
                ${krr-image} \
                python krr.py simple \
                  --help
            '')
          ];
          
          # Relative instead of in the store for security
          KUBECONFIG = "./kubeconfig.yaml";
        };
      }
    );
}
