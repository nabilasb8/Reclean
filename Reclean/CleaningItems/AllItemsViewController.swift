//
//  AllItemsViewController.swift
//  Reclean
//
//  Created by Nabila on 08/11/22.
//

import UIKit

class AllItemsViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Items"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
    }
    
    @objc func addTapped() {
        print("addTapped")
    }
}
