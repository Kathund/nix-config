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
  cfg = config.modules.music.spotify.${program};
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  options.modules.music.spotify.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable spotify ${program}";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          imports = [ inputs.spicetify-nix.homeManagerModules.default ];
          programs = {
            spicetify = {
              enable = true;
              enabledExtensions = with spicePkgs.extensions; [
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
              enabledCustomApps = with spicePkgs.apps; [
                newReleases
                ncsVisualizer
                betterLibrary
              ];
              enabledSnippets = with spicePkgs.snippets; [
                rotatingCoverart
                pointer
              ];
              theme = spicePkgs.themes.catppuccin;
              colorScheme = "mocha";
            };
          };
        };
      };
    };
  };
}
