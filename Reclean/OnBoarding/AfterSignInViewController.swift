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
//
//        let vc = AddAreaViewController()
//        let navVc = UINavigationController(rootViewController: vc)
//        if let sheet = navVc.sheetPresentationController {
//            sheet.detents = [.large()]
//            sheet.preferredCornerRadius = 40
//        }
//        navigationController?.present(navVc, animated: true)
    }
    
    @IBAction func joinButtonFamily(_ sender: Any) {
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
