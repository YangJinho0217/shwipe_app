import UIKit
import SwiftyJSON
import Alamofire
import Foundation

class AuthCodeViewController: UIViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var nowEditTextFieldPosition: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designs(nextBtn: nextBtn)
    }
    
    
    @IBAction func backAcntion(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
            self.view.endEditing(true)
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
                print("*-*-*-*-*-*- END -*-*-*-*-*-*")


                if data.resultCode.rawValue == 200 {
                    let vc = self.getViewController(sbName: "Account", viewIdentifier: "Email")
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
    
    @IBAction func textFieldAC(_ sender: Any) {
//            textField.becomeFirstResponder()
    }

    @objc func keyboardWillShow(_ notification:Notification) {
//        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//            return
//        }
//        if nowEditTextFieldPosition >= keyboardRect.origin.y - 10 {
//            view.frame.origin.y = (keyboardRect.origin.y - 10) - nowEditTextFieldPosition
//        }
    }

    @objc func keyboardWillHide(_ notification:Notification) {
//        view.frame.origin.y = 0
    }
}
