# README
This is just a quick repo to show a friend how to package the intellisense
package for use with nix. You can either use this as a flake, or just copy
`intellisense.nix` into whatever project or dotfiles configuration you're
using. If you're copying the file, just use the below expression to call
the package. `flake.nix` does the exact same thing.
```nix
pkgs.callPackage ./path/to/intellisense.nix {}
```

If you want to use this as a flake, which I don't recommend, it is exported
as the default package.

## Updating
To update to a new version of intellisense, I've left a detailed comment in
`intellisense.nix`.
