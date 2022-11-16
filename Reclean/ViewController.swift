//
//  ViewController.swift
//  Reclean
//
//  Created by Nabila on 31/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonStart: UIButton!
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonStarted(_ sender: Any) {
        if let navigationController = navigationController {
            let viewController = SignInUiViewController()
            navigationController.pushViewController(viewController,animated:true)}
    }
    
}

