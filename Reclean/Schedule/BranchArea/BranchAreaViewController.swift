//
//  BranchAreaViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 13/11/22.
//

import UIKit

class BranchAreaViewController: UIViewController {

    @IBOutlet weak var btnAddItem: UIButton!
    var area: Area?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddItem.addTarget(self, action: #selector(didClickButtonAdd), for: .touchUpInside)
    }
    
    func setArea(area: Area) {
        title = area.getPlace()?.name
        self.area = area
    }
    
    @objc func didClickButtonAdd() {
        let addItemDetailVC = AddItemDetailVC()
        addItemDetailVC.setArea(area: area)
        
        let nav = UINavigationController(rootViewController: addItemDetailVC)
        present(nav, animated: true, completion: nil)
    }
}
