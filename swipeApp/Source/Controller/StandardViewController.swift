import UIKit
import Shuffle_iOS
import Alamofire
import SwiftyJSON
import Network

class StandardViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLoad()
//        testAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        dataLoad()
    }
    
    func testAPI() {
        AF.request(TARGET_URL + "web/", method: .post, parameters: nil,encoding: URLEncoding.default, headers: ["Content-Type":"application/json", "Accept":"application/json"]).response {
            responseData in
            switch responseData.result {
            case .success(let value) :
                let data = ResponseData(data: JSON(value))
                print(data.resultMsg)
                print(data.resultCode.rawValue)
                print(data.data)
                
            case .failure(_) :
                print("error")
            }
        }
    }
    
    func dataLoad() {
        var param = Parameters()
        param = [
            "prd_type" : "close"
        ] as [String : Any]
    
        AF.request(TARGET_URL + "board/prdList", method : .post, parameters: param, encoding: URLEncoding.default, headers: nil).response { responseData in
            switch responseData.result {
            case .success(let value) :
                let data = ResponseData(data: JSON(value))
                print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                print(data.resultCode)
                print(data.resultMsg)
                print("*-*-*-*-*-*- END -*-*-*-*-*-*")
                
                if data.resultCode.rawValue == 200 {
                    for i in 0...data.data["data"].count - 1{
                        TinderCardList.append(TinderCardModelList(prdId: data.data["data"][i]["prd_id"].rawValue as! Int,
                                            prdImgUrl: data.data["data"][i]["prd_img"].rawValue as! String,
                                            prdType: data.data["data"][i]["prd_type"].rawValue as! String,
                                            prdName: data.data["data"][i]["prd_name"].rawValue as! String,
                                            prdTitle: data.data["data"][i]["prd_title"].rawValue as! String,
                                            prdSubTitle: data.data["data"][i]["prd_sub_title"].rawValue as! String,
                                            prdContent: data.data["data"][i]["prd_content"].rawValue as! String,
                                            prdPrice: data.data["data"][i]["prd_price"].rawValue as! String,
                                            rgstDtm: data.data["data"][i]["rgst_dtm"].rawValue as! String
                         ))
                    }
                } else {
                    print(data.resultMsg)
                }
                
                guard let nextVC = self.storyboard?.instantiateViewController(identifier: "navigation")else { return }
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: false, completion: nil)
                
            case .failure(_) :
                print("error")
            }
        }
    }

}
