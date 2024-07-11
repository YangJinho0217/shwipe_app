import UIKit
import UserNotifications

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert], completionHandler: { (granted,error) in })
        application.registerForRemoteNotifications()
        setupWindow()
        
//        UserDefaults.standard.removeObject(forKey: "userPhoneNum")
//        UserDefaults.standard.removeObject(forKey: "userEmail")
//        UserDefaults.standard.removeObject(forKey: "userNotice")
//        UserDefaults.standard.removeObject(forKey: "userName")
//        UserDefaults.standard.removeObject(forKey: "userBirthDay")
//        UserDefaults.standard.removeObject(forKey: "userGender")
//        UserDefaults.standard.removeObject(forKey: "userTerms")
        return true
    }

}

@available(iOS 13.0, *)
extension AppDelegate {
    
    fileprivate func setupWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let sb = UIStoryboard(name: "Splash", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AppLoading")
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
    
}
