# hypercore-nixos


# Basic Idea

Distribute the nixos binary cache as a spare hyperdrive. Users who want to help other mirror popular signed nars from cache.nixos.org can help each other distribute binaries.

The Nar binary archives are not unpacked or rebuilt, presevening hash integrity, and can be checked for authenticity via narinfo information supplied by cache.nixos.org.

Tooling.

The nix package builder, need to either understand hyper://1234../nar/zzzbs5nj3wr59phi0ck9w5f2mnfhzdcj-a-nixos-package-2.18.4 
or

The nix package builder can by redirected to http://localhost:8080/nar/zzzbs5nj3wr59phi0ck9w5f2mnfhzdcj-a-nixos-package-2.18.4

This might be achivable redirecting the default cache to localhost.

Infrastructure.

to mirror a complete nixos nar set is quite a task, however, a mininal set of nars can be used for testing.

A machine with enough resources to provide 100% mirror to a hypercore/hyperdrive.




