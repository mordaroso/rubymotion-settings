class SettingView < UIView
  attr_accessor :lblText, :lblReadOnly, :lblSlider, :lblColor, :lblToogle, :btnReload

  def initWithFrame(rect)
    if super
      self.backgroundColor = UIColor.whiteColor

      @lblComment  = UILabel.alloc.initWithFrame CGRectMake(40,  20, 240, 60)
      @lblComment.numberOfLines = 0
      @lblComment.font = UIFont.fontWithName("ArialRoundedMTBold", size: 18)
      @lblComment.text = "Go to your iPhone Settings to edit these attributes"


      @lblText     = UILabel.alloc.initWithFrame CGRectMake(40, 100, 240, 30)
      @lblReadOnly = UILabel.alloc.initWithFrame CGRectMake(40, 130, 240, 30)
      @lblSlider   = UILabel.alloc.initWithFrame CGRectMake(40, 160, 240, 30)
      @lblColor    = UILabel.alloc.initWithFrame CGRectMake(40, 190, 240, 30)
      @lblToogle   = UILabel.alloc.initWithFrame CGRectMake(40, 220, 240, 30)

      @btnReload = UIButton.buttonWithType UIButtonTypeRoundedRect
      @btnReload.setFrame CGRectMake(80, 280, 160, 40)
      @btnReload.setTitle "Reload", forState: UIControlStateNormal

      addSubview @lblText
      addSubview @lblReadOnly
      addSubview @lblSlider
      addSubview @lblColor
      addSubview @lblToogle
      addSubview @lblComment

      addSubview @btnReload
    end
    self
  end
end
