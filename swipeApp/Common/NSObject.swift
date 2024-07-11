import UIKit
import Foundation
import AVFoundation

extension NSObject {
    func getViewController(sbName: String, viewIdentifier: String) -> UIViewController {
        let sb = UIStoryboard(name: sbName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewIdentifier)
        return vc
    }
    
    
    func alert(title : String, message : String) -> UIAlertController {
        let alert = UIAlertController(title : title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(confirm)
        return alert
    }
    
    func isPhone(candidate: String) -> Bool {
        let regex = "^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: candidate)
    }
    
    func isEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
}
