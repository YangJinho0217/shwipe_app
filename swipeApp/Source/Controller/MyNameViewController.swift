import UIKit

class MyNameViewController: UIViewController {

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
        
        var userName = textField.text
        saveUserData(value: userName, key: "userName")
        
        if userName == "" {
            self.present(alert(title: "텅텅비었습니다", message: "이름을 입력해 주세요"), animated: true)
            return
        }
        
        let vc = self.getViewController(sbName: "Account", viewIdentifier: "MyBirth")
        ROOT_NVC?.pushViewController(vc, animated: true)
        
        
    }
}
