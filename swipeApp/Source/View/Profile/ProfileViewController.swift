import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var idLabel: UILabel!
    
    var loginId : String? = UserDefaults.standard.object(forKey: "userPhoneNum") as? String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idLabel.text = loginId
//        if loginId != nil {
//            idLabel.text = loginId
//        } else {
//            idLabel.text = "로그인이 필요합니다."
//        }
        
    }
    

    @IBAction func signOutAC(_ sender: Any) {
        print("로그아웃!")
        UserDefaults.standard.removeObject(forKey: "userPhoneNum")
        let vc = self.getViewController(sbName: "Account", viewIdentifier: "SignIn") as! SignInViewController
        let nvc = UINavigationController(rootViewController: vc)
        nvc.setNavigationBarHidden(true, animated: false)
        ROOT_NVC = nvc
        UIApplication.shared.keyWindow?.rootViewController = nvc
        
    }
    
}
