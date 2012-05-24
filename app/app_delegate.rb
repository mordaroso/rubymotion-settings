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

      appPrerfs = {}

      preferencesArray.each do |item|
        # Get the key of the item.
        keyValue = item.objectForKey "Key"

        # Get the default value specified in the plist file.
        defaultValue = item.objectForKey "DefaultValue"

        appPrerfs[keyValue] = defaultValue unless keyValue.nil? || defaultValue.nil?
      end

      NSUserDefaults.standardUserDefaults.registerDefaults appPrerfs
      NSUserDefaults.standardUserDefaults.synchronize

    end
  end
end
