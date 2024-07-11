import UIKit

class GenderViewController: UIViewController {

    @IBOutlet weak var noselectBtn: UIButton!
    @IBOutlet weak var mansBtn: UIButton!
    @IBOutlet weak var girlsBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var userGender : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designs(nextBtn: noselectBtn)
        designs(nextBtn: mansBtn)
        designs(nextBtn: girlsBtn)
        designs(nextBtn: nextBtn)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        if userGender == "" {
            self.present(alert(title: "텅텅비었습니다", message: "성별을 선택해 주세요"), animated: true)
            return
        }
        
        saveUserData(value: userGender, key: "userGender")
        print(UserDefaults.standard.object(forKey: "userGender"))
        
        
        let vc = self.getViewController(sbName: "Account", viewIdentifier: "Terms")
        ROOT_NVC?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func girlsAction(_ sender: Any) {
        girlsBtn.backgroundColor = UIColor.black
        girlsBtn.tintColor = UIColor.systemGray2
        mansBtn.backgroundColor = UIColor.white
        mansBtn.tintColor = UIColor.black
        noselectBtn.backgroundColor = UIColor.white
        noselectBtn.tintColor = UIColor.black
        userGender = "F"
    }
    
    @IBAction func mansAction(_ sender: Any) {
        girlsBtn.backgroundColor = UIColor.white
        girlsBtn.tintColor = UIColor.black
        mansBtn.backgroundColor = UIColor.black
        mansBtn.tintColor = UIColor.systemGray2
        noselectBtn.backgroundColor = UIColor.white
        noselectBtn.tintColor = UIColor.black
        userGender = "M"
    }
    
    @IBAction func noSelectAction(_ sender: Any) {
        girlsBtn.backgroundColor = UIColor.white
        girlsBtn.tintColor = UIColor.black
        mansBtn.backgroundColor = UIColor.white
        mansBtn.tintColor = UIColor.black
        noselectBtn.backgroundColor = UIColor.black
        noselectBtn.tintColor = UIColor.systemGray2
        userGender = "N"
    }
}
