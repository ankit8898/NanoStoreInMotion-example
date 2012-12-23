class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    NanoStore.shared_store = NanoStore.store(:file, App.documents_path + "/nano.db") # persist the data
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    user_controller = UsersViewController.new
    @window.rootViewController = user_controller 
    @window.makeKeyAndVisible
    true
  end
end
