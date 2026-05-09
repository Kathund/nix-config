{
  config,
  lib,
  username,
  inputs,
  pkgs,
  ...
}:
let
  program = "spicetify";
  cfg = config.modules.applications.${program};
  spicetifyPkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  options.modules.applications.${program} = {
    enable = lib.mkEnableOption { description = "Enable ${program}"; };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = {
      imports = [ inputs.spicetify-nix.homeManagerModules.default ];
      programs.${program} = {
        enable = true;
        enabledExtensions = with spicetifyPkgs.extensions; [
          autoSkipVideo
          keyboardShortcut
          loopyLoop
          shuffle
          trashbin

          powerBar
          fullAlbumDate
          listPlaylistsWithSong
          skipStats
          songStats
          showQueueDuration
          copyToClipboard
          history
          betterGenres
          lastfm
          hidePodcasts
          playNext
          copyLyrics
          playingSource
          beautifulLyrics
          queueTime
          allOfArtist
          aiBandBlocker
          sortPlay
          extendedCopy
          sessionStats
          adblockify
        ];
        enabledCustomApps = with spicetifyPkgs.apps; [
          newReleases
          ncsVisualizer
          betterLibrary
        ];
        enabledSnippets = with spicetifyPkgs.snippets; [
          rotatingCoverart
          pointer
        ];
        theme = spicetifyPkgs.themes.catppuccin;
        colorScheme = "mocha";
      };
    };
  };
}
