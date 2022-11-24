//
//  BranchAreaViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 13/11/22.
//

import UIKit

class BranchAreaViewController: UIViewController {

    @IBOutlet weak var btnAddItem: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnAddItem.addTarget(self, action: #selector(didClickButtonAdd), for: .touchUpInside)
    }
    
    func setTitle(text: String) {
        title = text
    }
    
    @objc func didClickButtonAdd() {
        let addItemDetailVC = AddItemDetailVC()
        
        let nav = UINavigationController(rootViewController: addItemDetailVC)
//        nav.modalPresentationStyle = .pageSheet
//
//        if let sheet = nav.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.preferredCornerRadius = 40
//        }
        present(nav, animated: true, completion: nil)
        
    }
}
