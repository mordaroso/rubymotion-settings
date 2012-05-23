class SettingViewController < UIViewController
  def loadView
    self.view = SettingView.alloc.init
    loadConfiguration

    self.view.btnReload.addTarget self, action:'loadConfiguration', forControlEvents: UIControlEventTouchUpInside
  end

  def loadConfiguration
    textValue     = NSUserDefaults.standardUserDefaults.stringForKey "textEntry_key"
    readOnlyValue = NSUserDefaults.standardUserDefaults.stringForKey "readOnly_key"
    sliderValue   = NSUserDefaults.standardUserDefaults.stringForKey "slider_key"
    colorValue    = NSUserDefaults.standardUserDefaults.stringForKey "colors_key"
    toogleValue   = NSUserDefaults.standardUserDefaults.stringForKey "toogle_key"

    self.view.lblText.text     = "Text Value: #{textValue}"
    self.view.lblReadOnly.text = "Read Only Value: #{readOnlyValue}"
    self.view.lblSlider.text   = "Slider Value: #{sliderValue}"
    self.view.lblColor.text    = "Selected color value: #{colorValue}"
    self.view.lblToogle.text   = "Toggle Control Value: #{toogleValue}"
  end
end
