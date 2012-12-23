class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    NanoStore.shared_store = NanoStore.store(:file, App.documents_path + "/nano.db") # persist the data
    tab_controller = UITabBarController.new

    user_controller = UsersViewController.new
    all_users_controller = AllUsersViewController.new
    tab_controller.viewControllers = [user_controller,all_users_controller]
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = tab_controller 
    @window.makeKeyAndVisible
    true
  end
end
