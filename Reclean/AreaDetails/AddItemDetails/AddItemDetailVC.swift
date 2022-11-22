//
//  AddItemDetailVC.swift
//  Reclean
//
//  Created by Nabila on 21/11/22.
//

import UIKit

class AddItemDetailVC: UIViewController {

    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Item"
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "InitialDateCell", bundle: nil), forCellReuseIdentifier: "InitialDateCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension AddItemDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InitialDateCell", for: indexPath) as! InitialDateCell
        
        cell.needUpdateTableView = {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
        
        return cell
        
    }
}

//buat nambahin function untuk action ketika tap salah satu cell
extension AddItemDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
