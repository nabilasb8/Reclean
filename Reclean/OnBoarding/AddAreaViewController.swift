//
//  AddAreaViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 10/11/22.
//

import UIKit

class AddAreaViewController: UIViewController {
    
    @IBOutlet weak var addArea: UITextField!
    
    let area = ["Living Room", "Bedroom", "Bathroom" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectedArea(_ sender: Any) {

    }
    

    @IBAction func cancelButton(_ sender: Any) {
        if let navigationController1 = navigationController {
            let viewController = AfterSignInViewController()
            navigationController1.pushViewController(viewController,animated:true)
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let navigationController2 = navigationController {
            let viewController = ScheduleViewController()
            navigationController2.pushViewController(viewController,animated:true)
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
