import Foundation
import Alamofire
import SwiftyJSON
import Network
import UIKit


final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
}

struct ResponseData {
    var resultCode: ResultCode = ResultCode.failure
    var resultMsg: String = ""
    var data: JSON = JSON()
    
    init(data: JSON) {
        self.resultCode = ResultCode(rawValue: data["resultCode"].intValue) ?? ResultCode.failure
        self.resultMsg = data["resultMsg"].stringValue
        self.data = data
    }
}

enum ResultCode: Int {
    case success = 200
    case warning = 300
    case failure = 400
    case expiredToken = 403
    case nonexistentProductInfo = 405
    case duplicatedID = 409
    case discordLoginInfo = 412
    case nonexistentSequence = 415
    case incorrectPW = 417
    case nonexistentSNSAccount = 420
    case nonAuthority = 422
    case imageUploadFailure = 430
    case appExit = 443
    case serverInsideError = 500
    case dbError = 501
}
