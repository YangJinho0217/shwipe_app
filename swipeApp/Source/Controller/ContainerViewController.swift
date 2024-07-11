import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet var ivu : UIImageView!
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    func resetContent() {
        DispatchQueue.main.async {
            self.ivu.image = self.image
        }
        
    }

}
