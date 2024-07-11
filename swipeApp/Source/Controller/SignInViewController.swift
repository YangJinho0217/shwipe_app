import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        design()
        
        designs(nextBtn: loginBtn)
        designs(nextBtn: signInBtn)
        // Do any additional setup after loading the view.
    }
    
    func design() {
        loginBtn.layer.borderColor = UIColor.black.cgColor
        loginBtn.layer.borderWidth = 0.5
        loginBtn.layer.cornerRadius = 10
        signInBtn.layer.borderColor = UIColor.black.cgColor
        signInBtn.layer.borderWidth = 0.5
        signInBtn.layer.cornerRadius = 10
    }
    
    @IBAction func sginInAction(_ sender: Any) {
        let vc = self.getViewController(sbName: "Account", viewIdentifier: "PhoneNum")
        ROOT_NVC?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        let vc = self.getViewController(sbName: "Account", viewIdentifier: "Login")
        ROOT_NVC?.pushViewController(vc, animated: true)
        
    }
}
