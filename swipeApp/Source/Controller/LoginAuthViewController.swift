import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class LoginAuthViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designs(nextBtn: nextBtn)

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
            self.view.endEditing(true)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        var authCode = textField.text
        
        if authCode == "" {
            self.present(alert(title: "텅텅비었습니다", message: "인증코드를 입력해 주세요"), animated: true)
            return
        } else {
            saveUserData(value: authCode, key: "authCode")
        }
        
        var param = Parameters()
        param["phNum"] = UserDefaults.standard.object(forKey: "userPhoneNum")!
        param["authCode"] = authCode!
        
        AF.request(TARGET_URL + "user/authCode", method : .post, parameters : param, encoding : URLEncoding.default, headers: nil).response { responseData in

            switch responseData.result {
            case .success(let value):
                let data = ResponseData(data: JSON(value))
                print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                print(data.resultCode)
                print(data.resultMsg)
                print(data.data)
                print("*-*-*-*-*-*- END -*-*-*-*-*-*")

                if data.resultCode.rawValue == 200 {
                    UserDefaults.standard.set(true, forKey: "Login")
                    let vc = self.getViewController(sbName: "ImageSB", viewIdentifier: "Standard") as! StandardViewController
                    ROOT_NVC?.pushViewController(vc, animated: true)
//                    vc.present(vc, animated: true)
                } else {
                    let alert = UIAlertController(title : "ERROR", message: data.resultMsg, preferredStyle: .alert)
                    let confirm = UIAlertAction(title: "확인", style: .cancel)
                    alert.addAction(confirm)
                    self.present(alert, animated: true)
                }
            case .failure(_):
                print("error")
            }
        }
    }

}
