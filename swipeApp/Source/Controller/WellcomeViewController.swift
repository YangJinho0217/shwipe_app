import UIKit

class WellcomeViewController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designs(nextBtn: nextBtn)
        
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        let vc = self.getViewController(sbName: "Account", viewIdentifier: "MyName")
        ROOT_NVC?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}
