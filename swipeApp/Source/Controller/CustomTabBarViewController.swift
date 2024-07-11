import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.selectedIndex = 1
    }
    
}

extension CustomTabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        // tag는 스토리보드 탭바의 속성에서 지정
        if viewController.tabBarItem.tag == 2{
            
            print("버튼클릭 2번")
//            guard let tabbarBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "Return") as? UINavigationController else {
//                return false
//            }
            
//            let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: tabbarBottomSheetVC)
//            bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 500
//            present(bottomSheet, animated: true)
            
            return false
        }
        
        if viewController.tabBarItem.tag == 3 {
        }
        
        return true
    }
}
