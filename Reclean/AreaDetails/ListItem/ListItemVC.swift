//
//  ListItemVC.swift
//  Reclean
//
//  Created by Nabila on 23/11/22.
//

import UIKit

class ListItemVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let activities = ["Vacuum carpet", "Laundry", "Washing dishes"]
    let areas = ["Bedroom", "Living room", "Bathroom"]
    let dates = ["22 Nov 2022", "24 Nov 2022", "25 Nov 2022"]
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Living Room"
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CardItemCell", bundle: nil), forCellReuseIdentifier: "CardItemCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(didClickBtnAdd))
    }
    
    @objc func didClickBtnAdd() {
        let addItemDetailVC = AddItemDetailVC()
        
        let nav = UINavigationController(rootViewController: addItemDetailVC)
        present(nav, animated: true, completion: nil)
    }
    
    func setCardItem() {
        
    }
}

extension ListItemVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardItemCell", for: indexPath) as! CardItemCell
        let activity = activities[indexPath.row]
        let areaName = areas[indexPath.row]
        let dateActivity = dates[indexPath.row]
        cell.configure(activity: activity, area: areaName, date: dateActivity)
        
        return cell
    }
}

extension ListItemVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let destination = BranchAreaViewController()
//        destination.setTitle(text: activities[indexPath.row])
//        navigationController?.pushViewController(destination, animated: true)
//    }
}
