
import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class AppLoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        moveHome()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveHome()
    }
    
    
    func moveHome() {
        if UserDefaults.standard.object(forKey: "userPhoneNum") == nil {
            let vc = self.getViewController(sbName: "Account", viewIdentifier: "SignIn") as! SignInViewController
            let nvc = UINavigationController(rootViewController: vc)
            nvc.setNavigationBarHidden(true, animated: false)
            ROOT_NVC = nvc
            UIApplication.shared.keyWindow?.rootViewController = nvc
        } else {
            var param = Parameters()
            param["phNum"] = UserDefaults.standard.object(forKey: "userPhoneNum")!
            
            AF.request(TARGET_URL + "user/session", method : .post, parameters : param, encoding : URLEncoding.default, headers: nil).response { responseData in
                
                switch responseData.result {
                case .success(let value) :
                    let data = ResponseData(data: JSON(value))
                    print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                    print(data.resultCode.rawValue)
                    print(data.resultMsg)
                    print("*-*-*-*-*-*- END -*-*-*-*-*-*")
                    
                    if (data.resultCode.rawValue == 200) {
                        let vc = self.getViewController(sbName: "ImageSB", viewIdentifier: "Standard") as! StandardViewController
                        let nvc = UINavigationController(rootViewController: vc)
                        nvc.setNavigationBarHidden(true, animated: false)
                        ROOT_NVC = nvc
                        UIApplication.shared.keyWindow?.rootViewController = nvc
                    } else {
                        
                        let alert = UIAlertController(title : "타임아웃", message: data.resultMsg, preferredStyle: .alert)
                        let confirm = UIAlertAction(title: "확인", style: .cancel) {_ in
                            UserDefaults.standard.removeObject(forKey: "userPhoneNum")
                            let vc = self.getViewController(sbName: "Account", viewIdentifier: "SignIn") as! SignInViewController
                            let nvc = UINavigationController(rootViewController: vc)
                            nvc.setNavigationBarHidden(true, animated: false)
                            ROOT_NVC = nvc
                            UIApplication.shared.keyWindow?.rootViewController = nvc
                        }
                        alert.addAction(confirm)
                        self.present(alert, animated: true)
                    }
                case .failure(_):
                    print("error")
                }
            }
        
            
        }
    }

//        if UserDefaults.standard.object(forKey: "Login") != nil {
//            let vc = self.getViewController(sbName: "ImageSB", viewIdentifier: "Standard") as! StandardViewController
//            let nvc = UINavigationController(rootViewController: vc)
//            nvc.setNavigationBarHidden(true, animated: false)
//            ROOT_NVC = nvc
//            UIApplication.shared.keyWindow?.rootViewController = nvc
//            
//        } else {
//            let vc = self.getViewController(sbName: "Account", viewIdentifier: "SignIn") as! SignInViewController
//            let nvc = UINavigationController(rootViewController: vc)
//            nvc.setNavigationBarHidden(true, animated: false)
//            ROOT_NVC = nvc
//            UIApplication.shared.keyWindow?.rootViewController = nvc
//        }
    
}

