{ system ? builtins.currentSystem }:
let
  sources = import ./npins;
  nixpkgs = import sources.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  nixvim = import sources.nixvim;
  nixvimModule = import ./config;
  nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
    pkgs = nixpkgs;
    module = nixvimModule;
    extraSpecialArgs = { };
  };
in {
  nvimPackage = nvim;
  shell = nixpkgs.mkShell {
    buildInputs = [ nvim ];
    shellHook = ''
      export EDITOR=nvim
      echo "Loaded nixvim shell with ${nvim.name}"
    '';
  };
}
