//
//  ViewController.swift
//  Reclean
//
//  Created by Nabila on 31/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func getStarted(_ sender: Any) {
        if let navigationController = navigationController {
            let viewController = SignInUiViewController()
            navigationController.pushViewController(viewController,animated:true)
        }
    }
    
    
}

