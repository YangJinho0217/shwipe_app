import UIKit

class ClosetTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    var data = TinderCardBuyModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(data: TinderCardBuyModel) {
        self.data = data
        let url = URL(string: data.prdImgUrl)
          var image : UIImage?
          DispatchQueue.global().async {
              let data = try? Data(contentsOf: url!)
              DispatchQueue.main.async {
                  image = UIImage(data: data!)
                  self.imgView.image = image
              }
        }
        titleLabel.text = data.prdName
        subTitleLabel.text = data.prdTitle
        priceLabel.text = data.prdPrice
    }
    
    

}
