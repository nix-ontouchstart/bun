{
  description = "Bun Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
      cctools = pkgs.cctools;
      darwin = pkgs.darwin;
      lib = pkgs.lib;
      rcodesign = pkgs.rcodesign;
      stdenvNoCC = pkgs.stdenvNoCC;
      bunVersion = "1.4.3";
      sources = {
        "aarch64-darwin" = pkgs.fetchurl {
          url = "https://github.com/oven-sh/bun/releases/download/bun-v${bunVersion}/bun-darwin-aarch64.zip";
          hash = "sha256-gK/UwGm0am+o8+xSC+vHUKeEPkqNW5WD0prUNsAKNAM=";
        };
      };
      bun = pkgs.stdenvNoCC.mkDerivation {
        pname = "bun";
        version = bunVersion;

        src = sources.${system};

        strictDeps = true;
        nativeBuildInputs = [
          pkgs.unzip
          pkgs.installShellFiles
          pkgs.makeWrapper
        ];
        buildInputs = [ pkgs.openssl ];

        dontConfigure = true;
        dontBuild = true;

        installPhase = ''
          runHook preInstall

          install -Dm 755 ./bun $out/bin/bun
          ln -s $out/bin/bun $out/bin/bunx

          runHook postInstall
        '';

        passthru = {
          sources = sources;
        };

        meta = {
          homepage = "https://bun.sh";
          changelog = "https://bun.sh/blog/bun-v${bunVersion}";
          description = "Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one";
          sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
          license = with lib.licenses; [
            mit # bun core
            lgpl21Only # javascriptcore and webkit
          ];
          mainProgram = "bun";
          platforms = builtins.attrNames sources;
          broken = pkgs.stdenvNoCC.hostPlatform.isMusl;
        };
      };
    in {
      packages.${system} = {
        bun = bun;
        default = bun;
      };
    };
}
