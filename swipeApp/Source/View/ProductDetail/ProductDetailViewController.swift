import UIKit
import Alamofire
import SwiftyJSON

class ProductDetailViewController: UIViewController {

    @IBOutlet var productLabel: UILabel!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var productContent: UITextView!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var likeCount: UILabel!
    @IBOutlet var likeImg: UIImageView!
    
    
    var phNum = UserDefaults.standard.object(forKey: "userPhoneNum")
    var prdId : Int = 0
    var imgUrl : String = ""
    var prdType : String = ""
    var prdName : String = ""
    var prdTitle : String = ""
    var prdSubTitle : String = ""
    var prdContent : String = ""
    var prdPrice : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageSet()
    }
    
    
    func imageSet() {
        let url = URL(string: imgUrl)
          var image : UIImage?
          DispatchQueue.global().async {
              let data = try? Data(contentsOf: url!)
              DispatchQueue.main.async {
                  image = UIImage(data: data!)
                  self.imgView.image = image
              }
        }
    }

    
}
