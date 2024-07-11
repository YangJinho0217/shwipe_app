import Foundation
import UIKit

let SCREEN_FRAME = UIScreen.main.bounds
let SCREEN_SIZE = UIScreen.main.bounds.size
let SCREEN_CENTER_X = UIScreen.main.bounds.width * 0.5
let SCREEN_CENTER_Y = UIScreen.main.bounds.height * 0.5
let SCREEN_CENTER = CGPoint(x: SCREEN_CENTER_X, y: SCREEN_CENTER_Y)
var ROOT_VC = UIApplication.shared.keyWindow?.rootViewController
var ROOT_NVC: UINavigationController?

let REGEX_EMAIL = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let REGEX_ID = "^[a-z]{1}[a-z0-9]{5,17}$"
let REGEX_PW = "^(?=.*[a-zA-Z0-9]).{6,20}$"
let REGEX_PHONE = "^01(?:[0-1]|[6-9])(?:\\d{3}|\\d{4})\\d{4}$"
