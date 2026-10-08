# github:nix-ontouchstart/bun

```
nix run github:nix-ontouchstart/bun -- --version
```
```
1.4.2
```

```
nix flake show github:nix-ontouchstart/bun 
```
````
github:nix-ontouchstart/bun/4823f32a13ef8e3331da0913eeb3127ac9b02702?narHash=sha256-G9gallgvIqj2WlescvPv4hSMY2gMFep0CYvWvQ5SDTM%3D
└───packages
    ├───aarch64-darwin
    │   └───default omitted (use '--all-systems' to show)
    ├───aarch64-linux
    │   └───default: package 'bun-1.4.2'
    ├───x86_64-darwin
    │   └───default omitted (use '--all-systems' to show)
    └───x86_64-linux
        └───default omitted (use '--all-systems' to show)
````

````
nix run github:nix-ontouchstart/bun -- -e 'console.log("It works!")'
````
````
It works!
````

