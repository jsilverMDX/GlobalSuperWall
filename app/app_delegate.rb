class AppDelegate
  attr_accessor :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    #application.setStatusBarStyle(UIStatusBarStyleBlackTranslucent)
    $app = self
    $prefs = NSUserDefaults.standardUserDefaults
    # $term = AsyncSocket.ZeroData
    $queue = Dispatch::Queue.new('com.jonsoft.superwall')
    # $mutex = Mutex.new

    UIApplication.sharedApplication.setStatusBarHidden(true, animated:false)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    switch_to_vc(load_vc("WallList"))

    true
  end

  def load_vc(identifier)
    if Device.iphone?
      storyboard = UIStoryboard.storyboardWithName("SuperWall-ios", bundle: NSBundle.mainBundle)
    else
      storyboard = UIStoryboard.storyboardWithName("SuperWall-ios-ipad", bundle: NSBundle.mainBundle)
    end
    vc = storyboard.instantiateViewControllerWithIdentifier(identifier)
  end

  def switch_to_vc(vc)
    unless @window.rootViewController == vc
      @window.rootViewController = vc
      @window.rootViewController.wantsFullScreenLayout = true
      @window.makeKeyAndVisible
    end
  end

end
