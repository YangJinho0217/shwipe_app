import UIKit
import SwiftyJSON

struct TinderCardModel {
  let name: String
  let age: String
  let occupation: String?
  let image: UIImage?
}

struct TinderCardModelList {
    let prdId : Int
    let prdImgUrl : String
    let prdType : String
    let prdName : String
    let prdTitle : String
    let prdSubTitle : String
    let prdContent : String
    let prdPrice : String
    let rgstDtm : String
}

struct TinderCardLikeListDataModel {
    var dataList = [TinderCardLikeModel]()
    
    init() { }
    init(data : JSON) {
        data["data"].arrayValue.forEach { (val) in
            self.dataList.append(TinderCardLikeModel(data: val))
        }
    }
}
struct TinderCardLikeModel {
    
    var prdId : Int = 0
    var prdImgUrl : String = ""
    var prdType : String = ""
    var prdName : String = ""
    var prdTitle : String = ""
    var prdSubTitle : String = ""
    var prdContent : String = ""
    var prdPrice : String = ""
    
    init() { }
    init(data : JSON) {
        prdId = data["prd_id"].intValue
        prdImgUrl = data["prd_img"].stringValue
        prdType = data["prd_type"].stringValue
        prdName = data["prd_name"].stringValue
        prdTitle = data["prd_title"].stringValue
        prdSubTitle = data["prd_sub_title"].stringValue
        prdContent = data["prd_content"].stringValue
        prdPrice = data["prd_price"].stringValue
        
    }
}

struct TinderCardBuyListDataModel {
    var dataList = [TinderCardBuyModel]()
    
    init() { }
    init(data : JSON) {
        data["data"].arrayValue.forEach { (val) in
            self.dataList.append(TinderCardBuyModel(data: val))
        }
    }
}

struct TinderCardBuyModel {
    
    var prdId : Int = 0
    var prdImgUrl : String = ""
    var prdType : String = ""
    var prdName : String = ""
    var prdTitle : String = ""
    var prdSubTitle : String = ""
    var prdContent : String = ""
    var prdPrice : String = ""
    
    init() { }
    init(data : JSON) {
        prdId = data["prd_id"].intValue
        prdImgUrl = data["prd_img"].stringValue
        prdType = data["prd_type"].stringValue
        prdName = data["prd_name"].stringValue
        prdTitle = data["prd_title"].stringValue
        prdSubTitle = data["prd_sub_title"].stringValue
        prdContent = data["prd_content"].stringValue
        prdPrice = data["prd_price"].stringValue
        
    }
}

var TinderCardList : [TinderCardModelList] = []
var TinderCardLikeList : [TinderCardModelList] = []
var TinderCardHateList : [TinderCardModelList] = []
