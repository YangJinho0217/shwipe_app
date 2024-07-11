import UIKit
import SwiftyJSON
import Alamofire
import Foundation

class EmailViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var newNotceBtn: UIButton!
    
    var nowEditTextFieldPosition: CGFloat = 0
    var notice : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designs(nextBtn: nextBtn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
            self.view.endEditing(true)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        var userEmail = textField.text
        
        if userEmail == "" {
            self.present(alert(title: "텅텅비었습니다", message: "이메일을 입력해 주세요!"), animated: true)
            return
        }
        
        var emailCheck = isEmail(email: userEmail!)
        
        if emailCheck == false {
            self.present(alert(title: "에잇", message: "이메일 형식이 올바르지 않습니다."), animated: true)
            return
        } else {
            saveUserData(value: userEmail, key: "userEmail")
        }
        
        
        if notice == true {
            saveUserData(value: "T", key: "userNotice")
        } else {
            saveUserData(value: "F", key: "userNotice")
        }
        
        let vc = self.getViewController(sbName: "Account", viewIdentifier: "AppleLogin")
        ROOT_NVC?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func noticeCheck(_ sender: Any) {
        
        if notice == false {
            newNotceBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            newNotceBtn.tintColor = UIColor.black
            notice = true
        } else {
            newNotceBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            newNotceBtn.tintColor = UIColor.black
            notice = false
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


extension EmailViewController {
    
    
}
