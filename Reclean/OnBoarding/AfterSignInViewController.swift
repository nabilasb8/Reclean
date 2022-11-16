//
//  AfterSignInViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 08/11/22.
//

import UIKit

class AfterSignInViewController: UIViewController {

    @IBOutlet weak var addArea: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addAreaa(_ sender: Any) {
        let vc = AddAreaViewController()
        let navVc = UINavigationController(rootViewController: vc)
        
        if let sheet = navVc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 40
        }
        navigationController?.present(navVc, animated: true)
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
