{
  config,
  lib,
  username,
  ...
}:
let
  program = "firefox";
  cfg = config.modules.browsers.${program};
in
{
  options.modules.browsers.${program} = {
    enable = lib.mkEnableOption {
      description = "Enable ${program}";
    };
    hyprlandBind = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    setDefault = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      users = {
        ${username} = {
          programs = {
            ${program} = {
              enable = true;
              profiles = {
                ${username} = {
                  extensions.force = true;
                  id = 0;
                  isDefault = true;
                  search = {
                    default = "ddg";
                    force = true;
                  };
                  settings = {
                    "browser.aboutwelcome.didSeeFinalScreen" = true;
                    "browser.contentblocking.category" = "strict";
                    "browser.aboutConfig.showWarning" = false;
                    "browser.crashReports.unsubmittedCheck.autoSubmit" = false;
                    "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
                    "browser.crashReports.unsubmittedCheck.enabled" = false;
                    "browser.disableResetPrompt" = true;
                    "browser.fixup.alternate.enabled" = false;
                    "browser.newtab.preload" = true;
                    "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
                    "browser.newtabpage.enabled" = false;
                    "browser.newtabpage.enhanced" = false;
                    "browser.newtabpage.introShown" = true;
                    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
                    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
                    "browser.newtabpage.activity-stream.feeds.topsites" = false;
                    "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
                    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                    "browser.safebrowsing.appRepURL" = "";
                    "browser.safebrowsing.blockedURIs.enabled" = false;
                    "browser.safebrowsing.downloads.enabled" = false;
                    "browser.safebrowsing.downloads.remote.enabled" = false;
                    "browser.safebrowsing.downloads.remote.url" = "";
                    "browser.safebrowsing.enabled" = false;
                    "browser.safebrowsing.malware.enabled" = false;
                    "browser.safebrowsing.phishing.enabled" = false;
                    "browser.search.suggest.enabled" = false;
                    "browser.selfsupport.url" = "";
                    "browser.sessionstore.privacy_level" = 0;
                    "browser.startup.homepage_override.mstone" = ''ignore'';
                    "browser.tabs.groups.smart.userEnabled" = false;
                    "browser.tabs.crashReporting.sendReport" = false;
                    "browser.urlbar.groupLabels.enabled" = false;
                    "browser.urlbar.quicksuggest.enabled" = false;
                    "browser.urlbar.speculativeConnect.enabled" = false;
                    "browser.urlbar.trimURLs" = false;
                    "datareporting.healthreport.service.enabled" = false;
                    "datareporting.healthreport.uploadEnabled" = false;
                    "datareporting.policy.dataSubmissionEnabled" = false;
                    "device.sensors.ambientLight.enabled" = false;
                    "device.sensors.enabled" = false;
                    "device.sensors.motion.enabled" = false;
                    "device.sensors.orientation.enabled" = false;
                    "device.sensors.proximity.enabled" = false;
                    "signon.autofillForms" = false;
                    "dom.security.https_only_mode" = true;
                    "dom.security.https_only_mode_ever_enabled" = true;
                    "experiments.activeExperiment" = false;
                    "experiments.enabled" = false;
                    "experiments.manifest.uri" = "";
                    "experiments.supported" = false;
                    "extensions.formautofill.creditCards.enabled" = false;
                    "extensions.getAddons.cache.enabled" = false;
                    "extensions.pocket.enabled" = false;
                    "extensions.shield-recipe-client.api_url" = "";
                    "extensions.shield-recipe-client.enabled" = false;
                    "media.autoplay.default" = 0;
                    "media.autoplay.enabled" = true;
                    "network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation" = true;
                    "network.allow-experiments" = false;
                    "network.captive-portal-service.enabled" = false;
                    "network.cookie.cookieBehavior" = 1;
                    "network.dns.disablePrefetch" = true;
                    "network.dns.disablePrefetchFromHTTPS" = true;
                    "network.http.referer.spoofSource" = true;
                    "network.http.speculative-parallel-limit" = 0;
                    "network.predictor.enable-prefetch" = false;
                    "network.predictor.enabled" = false;
                    "network.prefetch-next" = false;
                    "network.trr.mode" = 5;
                    "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
                    "toolkit.telemetry.archive.enabled" = false;
                    "toolkit.telemetry.bhrPing.enabled" = false;
                    "toolkit.telemetry.cachedClientID" = "";
                    "toolkit.telemetry.enabled" = false;
                    "toolkit.telemetry.firstShutdownPing.enabled" = false;
                    "toolkit.telemetry.hybridContent.enabled" = false;
                    "toolkit.telemetry.newProfilePing.enabled" = false;
                    "toolkit.telemetry.prompted" = 2;
                    "toolkit.telemetry.rejected" = true;
                    "toolkit.telemetry.reportingpolicy.firstRun" = false;
                    "toolkit.telemetry.server" = "";
                    "toolkit.telemetry.shutdownPingSender.enabled" = false;
                    "toolkit.telemetry.unified" = false;
                    "toolkit.telemetry.unifiedIsOptIn" = false;
                    "toolkit.telemetry.updatePing.enabled" = false;
                    "privacy.donottrackheader.enabled" = true;
                    "privacy.donottrackheader.value" = 1;
                    "privacy.query_stripping" = true;
                    "privacy.trackingprotection.cryptomining.enabled" = true;
                    "privacy.trackingprotection.enabled" = true;
                    "privacy.trackingprotection.fingerprinting.enabled" = true;
                    "privacy.trackingprotection.pbmode.enabled" = true;
                    "privacy.usercontext.about_newtab_segregation.enabled" = true;
                    "privacy.fingerprintingProtection" = true;
                    "security.ssl.disable_session_identifiers" = true;
                  };
                };
              };
              policies = {
                ExtensionSettings = {
                  # ublock-origin:
                  "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                  };
                  # stylus:
                  "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
                    installation_mode = "force_installed";
                  };
                  # proton-pass:
                  "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
                    installation_mode = "force_installed";
                  };
                  # catppuccin github file explorer:
                  "{bbb880ce-43c9-47ae-b746-c3e0096c5b76}" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-gh-file-explorer/latest.xpi";
                    installation_mode = "force_installed";
                  };
                  # clearURLs:
                  "{74145f27-f039-47ce-a470-a662b129930a}" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
                    installation_mode = "force_installed";
                  };
                };
              };
            };
          };
          wayland = lib.mkIf cfg.hyprlandBind {
            windowManager = {
              hyprland = {
                settings = {
                  bind = [ "SUPER, S, exec, ${program}" ];
                };
              };
            };
          };
          xdg = lib.mkIf cfg.setDefault {
            mimeApps = {
              enable = true;
              defaultApplications = {
                "text/html" = "firefox.desktop";
                "x-scheme-handler/http" = "firefox.desktop";
                "x-scheme-handler/https" = "firefox.desktop";
                "x-scheme-handler/about" = "firefox.desktop";
                "x-scheme-handler/unknown" = "firefox.desktop";
              };
            };
          };
        };
      };
    };
  };
}
