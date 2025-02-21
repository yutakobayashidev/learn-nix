{ pkgs, ... }:
{

  nix.enable = false; # determinate

  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      hackgen-nf-font
    ];
  };

  system = {
    stateVersion = 6;

    defaults = {
      controlcenter.BatteryShowPercentage = true;
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        NSAutomaticCapitalizationEnabled = false;
      };
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
      };
      LaunchServices = {
        LSQuarantine = false;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        show-recents = false;
        orientation = "bottom";
      };
      screencapture = {
        disable-shadow = true;
        location = "~/Pictures/screenshots";
        type = "jpg";
      };
      CustomSystemPreferences = {
        "com.apple.appleseed" = {
          "FeedbackAssistant.Autogather" = false;
        };
        "com.apple.CrashReporter" = {
          DialogType = "none";
        };
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.AppleMultitouchTrackpad" = {
          Clicking = true;
        };
        "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
          Clicking = true;
        };
        "com.apple.trackpad" = {
          scaling = 1.5;
        };
        "com.apple.swipescrolldirection" = {
          value = false;
        };
      };
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # cleanup = "uninstall";
    };
  };

}
