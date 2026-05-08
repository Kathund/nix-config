{
  config,
  lib,
  username,
  ...
}:
let
  program = "java";
  cfg = config.modules.dev.languages.${program};
in
{
  options.modules.dev.languages.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
    nvf = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs = lib.mkIf cfg.nvf {
      nvf = {
        settings = {
          vim = {
            languages = {
              java = {
                enable = true;
                lsp = {
                  enable = true;
                };
                treesitter = {
                  enable = true;
                };
              };
            };
          };
        };
      };
    };
    home-manager = {
      users = {
        ${username} =
          { pkgs, ... }:
          {
            home = {
              file =
                let
                  javas = {
                    inherit (pkgs) jdk25;
                    inherit (pkgs) jdk21;
                    inherit (pkgs) jdk17;
                    inherit (pkgs) jdk11;
                    inherit (pkgs) jdk8;
                  };
                in
                (lib.attrsets.mapAttrs' (
                  label: package: lib.attrsets.nameValuePair (".jdks/" + label) { source = package; }
                ) javas)
                // {
                  ".gradle/gradle.properties".source =
                    (pkgs.formats.javaProperties { }).generate "gradle.properties"
                      {
                        "org.gradle.java.installations.paths" = builtins.concatStringsSep "," (
                          builtins.map (name: "/home/" + username + "/.jdks/" + name + "/lib/openjdk") (
                            builtins.attrNames javas
                          )
                        );
                      };
                };
            };
          };
      };
    };
  };
}
