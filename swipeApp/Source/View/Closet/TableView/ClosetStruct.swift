import Foundation
import UIKit

struct Closet {
    var closetImg : UIImage?
    var title : String = ""
    var subTitle : String?
    var price : String = ""
}

class ClosetModel {
    
    var closetData = Closet()
    var closetList = [Closet]()
    
    func addCloset(img : UIImage, title : String, subtitle : String?, price : String) {
        closetData.closetImg = img
        closetData.title = title
        closetData.title = subtitle ?? ""
        closetData.price = price
        closetList.append(closetData)
        print(closetList)
    }
    
    func printCloset() {
        print(closetList)
    }
}
