import UIKit

class AppleLoginViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        
        let vc = self.getViewController(sbName: "Account", viewIdentifier: "WellCome")
        ROOT_NVC?.pushViewController(vc, animated: true)
    }
}
