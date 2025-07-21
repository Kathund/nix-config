{
  config,
  lib,
  username,
  ...
}:
let
  program = "hyfetch";
  cfg = config.programs.terminal.${program};
in
{
  options.programs.terminal.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    mode = lib.mkOption {
      type = lib.types.str;
      default = "rgb";
      description = "Change ${program}'s mode";
    };
    theme = lib.mkOption {
      type = lib.types.enum [
        "light"
        "dark"
      ];
      default = "dark";
      description = "Change ${program}'s theme";
    };
    preset = lib.mkOption {
      type = lib.types.enum [
        "rainbow"
        "transgender"
        "nonbinary"
        "xenogender"
        "agender"
        "queer"
        "genderfluid"
        "bisexual"
        "pansexual"
        "polysexual"
        "omnisexual"
        "omniromantic"
        "gaymen"
        "lesbian"
        "abrosexual"
        "asexual"
        "aromantic"
        "aroace1"
        "aroace2"
        "aroace3"
        "greysexual"
        "autosexual"
        "intergender"
        "greygender"
        "akiosexual"
        "bigender"
        "demigender"
        "demiboy"
        "demigirl"
        "transmasculine"
        "transfeminine"
        "genderfaun"
        "demifaun"
        "genderfae"
        "demifae"
        "neutrois"
        "biromantic1"
        "autoromantic"
        "boyflux2"
        "girlflux"
        "genderflux"
        "finsexual"
        "unlabeled1"
        "unlabeled2"
        "pangender"
        "pangendercontrast"
        "gendernonconforming1"
        "gendernonconforming2"
        "femboy"
        "tomboy"
        "gynesexual"
        "androsexual"
        "gendervoid"
        "voidgirl"
        "voidboy"
        "nonhumanunity"
        "caninekin"
        "plural"
        "fraysexual"
        "bear"
        "butch"
        "leather"
        "otter"
        "twink"
        "kenochoric"
        "veldian"
        "solian"
        "lunian"
        "polyam"
        "sapphic"
        "androgyne"
        "interprogress"
        "progress"
        "intersex"
        "oldpolyam"
        "equalrights"
        "drag"
        "pronounfluid"
        "pronounflux"
        "exipronoun"
        "neopronoun"
        "neofluid"
        "genderqueer"
        "cisgender"
        "baker"
        "beiyang"
        "burger"
        "throatlozenges"
        "band"
      ];
      default = "rainbow";
      description = "Change ${program}'s preset";
    };
    brightness = lib.mkOption {
      type = lib.types.float;
      default = 0.65;
      description = "Change ${program}'s brightness";
    };
    colorAlign = lib.mkOption {
      type = lib.types.enum [
        "horizontal"
        "vertical"
      ];
      default = "horizontal";
      description = "Change ${program}'s color alignment";
    };
    backend = lib.mkOption {
      type = lib.types.enum [
        "neofetch"
        "fastfetch"
        "qwqfetch"
      ];
      default = "neofetch";
      description = "Change what fetch backend ${program} uses";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          programs = {
            ${program} = {
              enable = true;
              settings = {
                mode = cfg.mode;
                light_dark = cfg.theme;
                preset = cfg.preset;
                lightness = cfg.brightness;
                color_align = {
                  mode = cfg.colorAlign;
                };
                backend = cfg.backend;
              };
            };
          };
        };
      };
    };
  };
}
