//
//  MainViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 23/11/22.
//

import UIKit

class MainViewController: UIViewController {

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
