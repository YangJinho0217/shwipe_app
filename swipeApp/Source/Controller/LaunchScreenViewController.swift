//
//  LaunchScreenViewController.swift
//  swipeApp
//
//  Created by 양진호 on 2023/08/01.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveLogin()
        
    }
    

    func moveLogin() {
        let sb = UIStoryboard(name: "Account", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
        self.present(vc, animated: true)
    }

}
