import UIKit
import Foundation
import Alamofire
import Network
import SwiftyJSON

class PhoneNumViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    
    var nowEditTextFieldPosition: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designs(nextBtn: nextBtn)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
            self.view.endEditing(true)
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
        
        AF.request(TARGET_URL + "user/phAuth", method : .post, parameters : param, encoding : URLEncoding.default, headers: nil).response { responseData in
            
            switch responseData.result {
            case .success(let value):
                let data = ResponseData(data: JSON(value))
                print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                print(data.resultCode)
                print(data.resultMsg)
                print("*-*-*-*-*-*- END -*-*-*-*-*-*")
                
                
//                let vc = self.getViewController(sbName: "Account", viewIdentifier: "Auth")
//                ROOT_NVC?.pushViewController(vc, animated: true)
                
                if data.resultCode.rawValue == 200 {
                    let vc = self.getViewController(sbName: "Account", viewIdentifier: "Auth")
                    ROOT_NVC?.pushViewController(vc, animated: true)
                } else {
                    let alert = UIAlertController(title : "ERROR", message: data.resultMsg, preferredStyle: .alert)
                    let confirm = UIAlertAction(title: "확인", style: .cancel) { _ in
                        ROOT_NVC?.popViewController(animated: true)
                    }
                    alert.addAction(confirm)
                    self.present(alert, animated: true)
                    
                    
                }
            case .failure(_):
                print("error")
            }
        }
        
    }
    
    @IBAction func textFieldAC(_ sender: Any) {
//        textField.becomeFirstResponder()
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
//        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//            return
//        }
//        if nowEditTextFieldPosition >= keyboardRect.origin.y - 10 {
//            view.frame.origin.y = (keyboardRect.origin.y - 10) - nowEditTextFieldPosition
//        }
    }
    
//    @objc func keyboardWillHide(_ notification:Notification) {
//        view.frame.origin.y = 0
//    }
//
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}


extension PhoneNumViewController {
    
    
}
