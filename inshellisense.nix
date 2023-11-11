{ lib, buildNpmPackage, fetchFromGitHub }:

buildNpmPackage rec {
  pname = "inshellisense";
  version = "0.0.1-rc.4";

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = pname;
    rev = version; 
    hash = "sha256-PYSonVyclGSH3ArbqJuKrBNGbJaQEp6XemwnHboVwPk=";
  };

  npmDepsHash = "sha256-sjr4Hy1/zWPAlVGsMkyQIQcBT86KLaN2/UAaAd7Mn6Q=";

  # The prepack script runs the build script, which we'd rather do in the build phase.
  npmPackFlags = [ "--ignore-scripts" ];

  NODE_OPTIONS = "--openssl-legacy-provider";

  meta = with lib; {
    description = "IDE style autocomplete for shells";
    homepage = "https://github.com/microsoft/inshellisense";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
