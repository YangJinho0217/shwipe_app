import UIKit

class LikeTableViewCell: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var data = TinderCardLikeModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(data: TinderCardLikeModel) {
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
