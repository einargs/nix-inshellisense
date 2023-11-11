{
  description = "Inshellisense test";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
  };
  nixConfig = {
    bash-prompt = ''\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]dev-shell:\w]\$\[\033[0m\] '';
  };

  outputs = { self, nixpkgs }: 
  let system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      inshellisense = pkgs.callPackage ./inshellisense.nix {};
  in {

    devShells.x86_64-linux.default = pkgs.mkShell {
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
  };
}
