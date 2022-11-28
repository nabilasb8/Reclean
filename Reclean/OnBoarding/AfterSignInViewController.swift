//
//  AfterSignInViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 08/11/22.
//

import UIKit

class AfterSignInViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }

    @IBAction func addAreaa(_ sender: Any) {
        if let navigationController = navigationController {
            let viewController = AddAreaViewController()
            navigationController.pushViewController(viewController,animated:true)
        }

    }
    
    @IBAction func joinButtonFamily(_ sender: Any) {
    }
    
}
