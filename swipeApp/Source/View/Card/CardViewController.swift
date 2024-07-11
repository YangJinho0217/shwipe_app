//
// cardViewController
//

import UIKit
import PopBounceButton
import Shuffle_iOS
import Alamofire
import SwiftyJSON

class CardViewController: UIViewController {

    @IBOutlet weak var bottomBiew: UIView!
    @IBOutlet weak var topStackView: UIStackView!
    
    @IBOutlet weak var footBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var bagBtn: UIButton!
    
    let cardStack = SwipeCardStack()
//    private let buttonStackView = ButtonStackView()
    
    var imgList : [TinderCardModelList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardStack.delegate = self
        cardStack.dataSource = self
        
        configureNavigationBar()
        layoutCardStackView()
        configureBackgroundGradient()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    private func configureNavigationBar() {
        let backButton = UIBarButtonItem(title: "Back",
                                     style: .plain,
                                     target: self,
                                     action: #selector(handleShift))
    backButton.tag = 1
    backButton.tintColor = .lightGray
    navigationItem.leftBarButtonItem = backButton

    let forwardButton = UIBarButtonItem(title: "Forward",
                                        style: .plain,
                                        target: self,
                                        action: #selector(handleShift))
    forwardButton.tag = 2
    forwardButton.tintColor = .lightGray
    navigationItem.rightBarButtonItem = forwardButton

    navigationController?.navigationBar.layer.zPosition = -1
  }

  private func configureBackgroundGradient() {
    let backgroundGray = UIColor(red: 244 / 255, green: 247 / 255, blue: 250 / 255, alpha: 1)
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [UIColor.white.cgColor, backgroundGray.cgColor]
    gradientLayer.frame = view.bounds
    view.layer.insertSublayer(gradientLayer, at: 0)
  }
    
  private func layoutCardStackView() {
   view.addSubview(cardStack)
   cardStack.anchor(top: topStackView.bottomAnchor,
                    left: view.safeAreaLayoutGuide.leftAnchor,
                    bottom: bottomBiew.topAnchor,
                    right: view.safeAreaLayoutGuide.rightAnchor)
 }

  @objc private func handleShift(_ sender: UIButton) {
    cardStack.shift(withDistance: sender.tag == 1 ? -1 : 1, animated: true)
  }
    

}

extension CardViewController :  SwipeCardStackDataSource, SwipeCardStackDelegate {

    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
        card.footerHeight = 80
        card.swipeDirections = [.left, .up, .right]
        for direction in card.swipeDirections {
            card.setOverlay(TinderCardOverlay(direction: direction), forDirection: direction)
        }
        
        card.content = TinderCardContentView(withImage:URL(string:"\(TinderCardList[index].prdImgUrl)")!)
        card.footer = TinderCardFooterView(withTitle: "\(TinderCardList[index].prdTitle)", subtitle: TinderCardList[index].prdSubTitle)
        return card
  }

    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return TinderCardList.count
    }

    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
        print("Swiped all cards!")
    }

    func cardStack(_ cardStack: SwipeCardStack, didUndoCardAt index: Int, from direction: SwipeDirection) {
        print("Undo \(direction) swipe on \(TinderCardList[index].prdTitle)")
    }

    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        
        var param = Parameters()
        param = [
            "ph_num" : UserDefaults.standard.object(forKey: "userPhoneNum")!,
            "prd_id" : TinderCardList[index].prdId,
            "prd_img" : TinderCardList[index].prdImgUrl,
            "prd_type" : TinderCardList[index].prdType,
            "prd_name" : TinderCardList[index].prdName,
            "prd_title" : TinderCardList[index].prdTitle,
            "prd_sub_title" : TinderCardList[index].prdSubTitle,
            "prd_content" : TinderCardList[index].prdContent,
            "prd_price" : TinderCardList[index].prdPrice
        ] as [String : Any]
      
        if direction == .up {
           // 있어요 옷장탭으로
            AF.request(TARGET_URL + "board/prdBuy", method : .post, parameters: param, encoding: URLEncoding.default, headers: nil).response { responseData in
                
                switch responseData.result {
                case .success(let value) :
                    let data = ResponseData(data: JSON(value))
                    if data.resultCode.rawValue == 200 {
                        print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                        print(data.resultCode)
                        print(data.resultMsg)
                        print("*-*-*-*-*-*- END -*-*-*-*-*-*")
                    } else {
                        print(data.resultCode)
                        print(data.resultMsg)
                    }
                    
                case .failure(_) :
                    print("error")
                }
            }
            
        } else if direction == .right {
            // 좋아요 관심탭으로
            AF.request(TARGET_URL + "board/prdLike", method : .post, parameters: param, encoding: URLEncoding.default, headers: nil).response { responseData in
                
                switch responseData.result {
                case .success(let value) :
                    let data = ResponseData(data: JSON(value))
                    if data.resultCode.rawValue == 200 {
                        print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                        print(data.resultCode)
                        print(data.resultMsg)
                        print("*-*-*-*-*-*- END -*-*-*-*-*-*")
                    } else {
                        print(data.resultCode)
                        print(data.resultMsg)
                    }
                    
                case .failure(_) :
                    print("error")
                }
            }
            
        } else if direction == .left {
            
        }
        print("Swiped \(direction) on \(TinderCardList[index].prdTitle)")
    }

    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        let vc = self.getViewController(sbName: "ImageSB", viewIdentifier: "ProductDetail") as! ProductDetailViewController
//        vc.productLabel.text = TinderCardList[index].prdTitle
//        vc.brandLabel.text = TinderCardList[index].prdName
//        vc.imgUrl = TinderCardList[index].prdImgUrl
//        vc.productContent.text = TinderCardList[index].prdContent
//        vc.productPrice.text = TinderCardList[index].prdPrice
        
        vc.prdId = TinderCardList[index].prdId
        vc.imgUrl = TinderCardList[index].prdImgUrl
        vc.prdType = TinderCardList[index].prdType
        vc.prdName = TinderCardList[index].prdName
        vc.prdTitle = TinderCardList[index].prdTitle
        vc.prdSubTitle = TinderCardList[index].prdSubTitle
        vc.prdContent = TinderCardList[index].prdContent
        vc.prdPrice = TinderCardList[index].prdPrice
        
        self.present(vc, animated: true)
        print("Card tapped")
    }
    
    
    func pushLike() {
       
    }


}
