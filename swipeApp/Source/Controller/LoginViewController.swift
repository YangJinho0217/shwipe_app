import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class LoginViewController: UIViewController {

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
        var userPhoneNum = textField.text
        
        if userPhoneNum == "" {
            self.present(alert(title: "텅텅비었습니다", message: "핸드폰번호를 입력해 주세요"), animated: true)
            return
        }
        
        var phoneCheck = isPhone(candidate: userPhoneNum!)
        
        if phoneCheck == false {
            self.present(alert(title: "에잇", message: "올바른 핸드폰 번호를 입력해 주세요"), animated: true)
            return
        } else {
            saveUserData(value: userPhoneNum, key: "userPhoneNum")
        }
        
        var param = Parameters()
        param["phNum"] = userPhoneNum!
        
        AF.request(TARGET_URL + "user/login", method : .post, parameters : param, encoding : URLEncoding.default, headers: nil).response { responseData in
            
            switch responseData.result {
            case .success(let value):
                let data = ResponseData(data: JSON(value))
                print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                print(data.resultCode)
                print(data.resultMsg)
                print("*-*-*-*-*-*- END -*-*-*-*-*-*")
                
                
                if data.resultCode.rawValue == 200 {
                    let vc = self.getViewController(sbName: "Account", viewIdentifier: "LoginAuth")
                    ROOT_NVC?.pushViewController(vc, animated: true)
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
