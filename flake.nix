{
  description = "Bun Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
      bunVersion = "1.4.2";
      sources = {
        "aarch64-linux" = pkgs.fetchurl {
          url = "https://github.com/oven-sh/bun/releases/download/bun-v${bunVersion}/bun-linux-aarch64.zip";
          hash = "sha256-VDKLvC2cjgyfiSxUTWbFeoO4QTnjSQnl7oF1jxrI/ac=";
        };
      };
      bun = pkgs.stdenvNoCC.mkDerivation {
        pname = "bun";
        version = bunVersion;

        src = sources."aarch64-linux";

        strictDeps = true;
        nativeBuildInputs = [
          pkgs.unzip
          pkgs.installShellFiles
          pkgs.makeWrapper
          pkgs.autoPatchelfHook
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
