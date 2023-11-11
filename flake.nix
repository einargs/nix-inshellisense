{
  description = "Inshellisense test";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  nixConfig = {
    bash-prompt = ''\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]dev-shell:\w]\$\[\033[0m\] '';
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem
      (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          inshellisense = pkgs.callPackage ./inshellisense.nix {};
      in {
        packages.default = inshellisense;

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            inshellisense
          ];
          src = [
            ./flake.nix
            ./flake.lock
            ./inshellisense.nix
          ];
          shellHook = ''
            inshellisense --shell bash
          '';
        };
      });
}
