# github:nix-ontouchstart/bun

[flake.nix](flake.nix) based on https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/bu/bun/package.nix

```
bash-5.3# nix shell "github:nix-ontouchstart/bun"
bash-5.3# bun --version
1.4.2
bash-5.3# exit
exit
bash-5.3# bun
bash: bun: command not found
```

```
bash-5.3# nix shell "github:nix-ontouchstart/bun"
bash-5.3# which bun
/nix/store/cl24lkqp14p1b9rh0gpaq4rmjack3f2j-bun-1.4.2/bin/bun
bash-5.3# bun --version
1.4.2
bash-5.3# bun -e 'console.log("It works!")'
It works!
bash-5.3# exit
exit
bash-5.3# which bun
which: no bun in (/root/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin)
bash-5.3# 
```

```
bash-5.3# nix profile add github:nix-ontouchstart/bun
bash-5.3# bun --version
1.4.2
```

```
bash-5.3# nix flake check github:nix-ontouchstart/bun
bash-5.3# nix flake show github:nix-ontouchstart/bun
github:nix-ontouchstart/bun/fad2de1f394002e2d9eae528fa048214c40b3383?narHash=sha256-a/w/Chby5URkQoiugELRYo7otewI1DXNhzBZ9HyzTDc%3D
└───packages
    └───aarch64-linux
        ├───bun: package 'bun-1.4.2'
        └───default: package 'bun-1.4.2'
bash-5.3# nix run github:nix-ontouchstart/bun -- --version
1.4.2
bash-5.3# nix run github:nix-ontouchstart/bun -- -e 'console.log("It works!")'
It works!
bash-5.3# nix run github:nix-ontouchstart/bun
Bun is a fast JavaScript runtime, package manager, bundler, and test runner. (1.4.2+744846f84)

Usage: bun <command> [...flags] [...args]

Commands:
  run       ./my-script.ts       Execute a file with Bun
            lint                 Run a package.json script
  test                           Run unit tests with Bun
  x         prettier             Execute a package binary (CLI), installing if needed (bunx)
  repl                           Start a REPL session with Bun
  exec                           Run a shell script directly with Bun

  install                        Install dependencies for a package.json (bun i)
  add       elysia               Add a dependency to package.json (bun a)
  remove    is-array             Remove a dependency from package.json (bun rm)
  update    @shumai/shumai       Update outdated dependencies
  audit                          Check installed packages for vulnerabilities
  dedupe                         Remove duplicate versions from the lockfile
  prune                          Remove packages that are not in the lockfile from node_modules
  outdated                       Display latest versions of outdated dependencies
  link      [<package>]          Register or link a local npm package
  unlink                         Unregister a local npm package
  publish                        Publish a package to the npm registry
  patch <pkg>                    Prepare a package for patching
  pm <subcommand>                Additional package management utilities
  info      hono                 Display package metadata from the registry
  why       react                Explain why a package is installed

  build     ./a.ts ./b.jsx       Bundle TypeScript & JavaScript into a single file

  init                           Start an empty Bun project from a built-in template
  create    next-app             Create a new project from a template (bun c)
  upgrade                        Upgrade to latest version of Bun.

  <command> --help               Print help text for command.

Learn more about Bun:            https://bun.com/docs
Join our Discord community:      https://bun.com/discord
Try 'nix --help' for more information.
bash-5.3# nix run github:nix-ontouchstart/bun -- -e 'console.log(Date.now())'
1791483535608
```
