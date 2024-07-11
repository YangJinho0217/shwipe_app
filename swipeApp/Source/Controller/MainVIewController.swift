import UIKit
import Koloda

class MainVIewController: UIViewController {

    @IBOutlet var kolodaImageView : KolodaView!
    let array = [
        UIImage(named: "image1"),
        UIImage(named: "image2"),
        UIImage(named: "image3"),
        UIImage(named: "image4"),
        UIImage(named: "image5")
    ]
    var containers = [ContainerViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---------- Main Page Call Success ----------")
        // Do any additional setup after loading the view.
        kolodaImageView.dataSource = self
        kolodaImageView.delegate = self
//        loadContainerViews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadContainerViews()
        kolodaImageView.reloadData()
    }
    
    func loadContainerViews() {
        for index in 0...array.count - 1 {
            let  vc = self.storyboard?.instantiateViewController(withIdentifier: "Container") as! ContainerViewController
            self.addChild(vc)
            containers.append(vc)
        }
    }
    
}

extension MainVIewController : KolodaViewDelegate, KolodaViewDataSource {
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        let container = containers[index]
        print("-----container 갯수")
        print(index)
        container.image = self.array[index]
        container.resetContent()
        return containers[index].view
    }
    
    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
        return containers.count
    }
    
    
}
 
