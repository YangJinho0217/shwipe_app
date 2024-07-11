import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class LikeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var data = TinderCardLikeListDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func loadView() {
        super.loadView()
        self.likeListLoad()
    }
    
    func likeListLoad() {
        var param = Parameters()
        param = [
            "ph_num" : UserDefaults.standard.object(forKey: "userPhoneNum")!,
        ] as [String : Any]
        
        AF.request(TARGET_URL + "board/likeList", method : .post, parameters: param, encoding: URLEncoding.default, headers: nil).response { responseData in
            
            switch responseData.result {
            case .success(let value) :
                let data = ResponseData(data: JSON(value))
                print("*-*-*-*-*- SUCCESS -*-*-*-*-*")
                print(data.resultCode)
                print(data.resultMsg)
                print("*-*-*-*-*-*- END -*-*-*-*-*-*")
                if data.resultCode.rawValue == 200 {
                    self.data = TinderCardLikeListDataModel(data: JSON(value))
                    self.tableView.reloadData()
                } else {
                    return
                }
            case .failure(_) :
                print("error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCell", for: indexPath) as? LikeTableViewCell else {
            return UITableViewCell()
        }
        cell.set(data: self.data.dataList[indexPath.row])
        return cell
    }

}
