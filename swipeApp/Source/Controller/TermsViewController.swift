import UIKit
import Foundation
import Alamofire
import SwiftyJSON

@available(iOS 13.0, *)
class TermsViewController: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var allAccessBtn: UIButton!
    @IBOutlet weak var step1Btn: UIButton!
    @IBOutlet weak var step2Btn: UIButton!
    @IBOutlet weak var step3Btn: UIButton!
    @IBOutlet weak var step4Btn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var allAccessBtnAgree : Bool = false
    var step1Data : Bool = false
    var step2Data : Bool = false
    var step3Data : Bool = false
    var step4Data : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designs(nextBtn: confirmBtn)

    }
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func allAccessAc(_ sender: Any) {
        
        if allAccessBtnAgree == false {
            
            print("all checked")
            allAccessBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            allAccessBtn.tintColor = UIColor.black
            allAccessBtnAgree = true
            
            step1Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            step1Btn.tintColor = UIColor.black
            step1Data = true
            
            step2Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            step2Btn.tintColor = UIColor.black
            step2Data = true
            
            step3Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            step3Btn.tintColor = UIColor.black
            step3Data = true
        
            step4Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            step4Btn.tintColor = UIColor.black
            step4Data = true
            
            
        } else {
            
            print("Not all checked")
            allAccessBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            allAccessBtn.tintColor = UIColor.black
            allAccessBtnAgree = false
            
            step1Btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            step1Btn.tintColor = UIColor.black
            step1Data = false
            
            step2Btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            step2Btn.tintColor = UIColor.black
            step2Data = false
            
            step3Btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            step3Btn.tintColor = UIColor.black
            step3Data = false
            
            step4Btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            step4Btn.tintColor = UIColor.black
            step4Data = false
            
        }
        
    }
    
    @IBAction func step1Action(_ sender: Any) {
        
        if step1Data == false {
            step1Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            step1Btn.tintColor = UIColor.black
            if step1Data == false && step2Data == true && step3Data == true && step4Data == true {
                step1Data = true
                allAccessBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                allAccessBtn.tintColor = UIColor.black
                allAccessBtnAgree = true
            } else {
                step1Data = true
            }
            
        } else {
            step1Btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            step1Btn.tintColor = UIColor.black
            if step1Data == true && step2Data == true && step3Data == true && step4Data == true {
                step1Data = false
                allAccessBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                allAccessBtn.tintColor = UIColor.black
                allAccessBtnAgree = false
            } else {
                step1Data = false
            }
            
        }
        
        
    }
    
    @IBAction func step2Action(_ sender: Any) {
        
        if step2Data == false {
            step2Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            step2Btn.tintColor = UIColor.black
            if step1Data == true && step2Data == false && step3Data == true && step4Data == true {
                step2Data = true
                allAccessBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                allAccessBtn.tintColor = UIColor.black
                allAccessBtnAgree = true
            } else {
                step2Data = true
            }
            
        } else {
            step2Btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            step2Btn.tintColor = UIColor.black
            if step1Data == true && step2Data == true && step3Data == true && step4Data == true {
                step2Data = false
                allAccessBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                allAccessBtn.tintColor = UIColor.black
                allAccessBtnAgree = false
            } else {
                step2Data = false
            }
            
        }
        
    }
    
    @IBAction func step3Action(_ sender: Any) {
        
        if step3Data == false {
            step3Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            step3Btn.tintColor = UIColor.black
            if step1Data == true && step2Data == true && step3Data == false && step4Data == true {
                step3Data = true
                allAccessBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                allAccessBtn.tintColor = UIColor.black
                allAccessBtnAgree = true
            } else {
                step3Data = true
            }
            
        } else {
            step3Btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            step3Btn.tintColor = UIColor.black
            if step1Data == true && step2Data == true && step3Data == true && step4Data == true {
                step3Data = false
                allAccessBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                allAccessBtn.tintColor = UIColor.black
                allAccessBtnAgree = false
            } else {
                step3Data = false
            }
            
        }
    }
    
    @IBAction func step4Action(_ sender: Any) {
        
        if step4Data == false {
            step4Btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            step4Btn.tintColor = UIColor.black
            if step1Data == true && step2Data == true && step3Data == true && step4Data == false {
                step4Data = true
                allAccessBtn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                allAccessBtn.tintColor = UIColor.black
                allAccessBtnAgree = true
            } else {
                step4Data = true
            }
            
        } else {
            step4Btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            step4Btn.tintColor = UIColor.black
            if step1Data == true && step2Data == true && step3Data == true && step4Data == true {
                step4Data = false
                allAccessBtn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                allAccessBtn.tintColor = UIColor.black
                allAccessBtnAgree = false
            } else {
                step4Data = false
            }
            
        }
        
    }
    
    @IBAction func confrimAc(_ sender: Any) {
        
        if step1Data == false || step2Data == false || step3Data == false || step4Data == false{
            self.present(alert(title: "ERROR", message: "필수 항목을 모두 체크해 주세요"), animated: true)
            return
        }
        
        let userTerms = "T"
        saveUserData(value: userTerms, key: "userTerms")
        
        var param = Parameters()
        param["phNum"] = UserDefaults.standard.object(forKey: "userPhoneNum")!
        param["userEmail"] = UserDefaults.standard.object(forKey: "userEmail")!
        param["userNotice"] = UserDefaults.standard.object(forKey: "userNotice")!
        param["userName"] = UserDefaults.standard.object(forKey: "userName")!
        param["userBirthDay"] = UserDefaults.standard.object(forKey: "userBirthDay")!
        param["userGender"] = UserDefaults.standard.object(forKey: "userGender")!
        param["userTerms"] = UserDefaults.standard.object(forKey: "userTerms")!
        
        AF.request(TARGET_URL + "user/signUp", method : .post, parameters : param, encoding : URLEncoding.default, headers: nil).response { responseData in

            switch responseData.result {
            case .success(let value):
                let data = ResponseData(data: JSON(value))
                print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                print(data.resultCode.rawValue)
                print(data.resultMsg)
                print("*-*-*-*-*-*- END -*-*-*-*-*-*")

                if data.resultCode.rawValue == 200 {
                    let alert = UIAlertController(title : "안녕하세요 Shwipe 입니다", message: data.resultMsg, preferredStyle: .alert)
                    let confirm = UIAlertAction(title: "확인", style: .cancel) {_ in
                        UserDefaults.standard.set(true, forKey: "Login")
                        let vc = self.getViewController(sbName: "ImageSB", viewIdentifier: "Standard")
                        ROOT_NVC?.pushViewController(vc, animated: true)
                    }
                    alert.addAction(confirm)
                    self.present(alert, animated: true)
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
