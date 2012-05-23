class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    setDefaultSettings

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = SettingViewController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end

  def setDefaultSettings
    textValue = NSUserDefaults.standardUserDefaults.stringForKey "textEntry_Key"

    # If the first value is nil, then we know that the defaults are not set.
    if(textValue == nil)
      bPath = NSBundle.mainBundle.bundlePath
      settingsPath = bPath.stringByAppendingPathComponent "Settings.bundle"
      plistFile    = settingsPath.stringByAppendingPathComponent "Root.plist"

      settingsDictionary = NSDictionary.dictionaryWithContentsOfFile plistFile
      preferencesArray   = settingsDictionary.objectForKey "PreferenceSpecifiers"

      textEntry_Key = nil
      readOnly_Key = nil
      toogle_Key = nil
      slider_Key = nil
      colors_Key = nil

      preferencesArray.each do |item|
        # Get the key of the item.
        keyValue = item.objectForKey "Key"

        # Get the default value specified in the plist file.
        defaultValue = item.objectForKey "DefaultValue"
        p keyValue
        case keyValue
        when "textEntry_key"
          textEntry_Key = defaultValue
        when "readOnly_key"
          readOnly_Key = defaultValue
        when "toogle_key"
          toogle_Key = defaultValue
        when "slider_key"
          slider_Key = defaultValue
        when "colors_key"
          colors_Key = defaultValue
        end
      end

      # Now that we have all the default values.
      # We will create it here.
      appPrerfs = NSDictionary.dictionaryWithObjects [textEntry_Key, readOnly_Key, toogle_Key, slider_Key, colors_Key], forKeys: ["textEntry_key", "readOnly_key", "toogle_key", "slider_key", "colors_key"]


      NSUserDefaults.standardUserDefaults.registerDefaults appPrerfs
      NSUserDefaults.standardUserDefaults.synchronize

    end
  end
end
