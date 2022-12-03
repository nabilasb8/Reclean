//
//  ListItemVC.swift
//  Reclean
//
//  Created by Nabila on 23/11/22.
//

import UIKit

class ListItemVC: UIViewController {

    @IBOutlet weak var btnAddEmptyState: UIButton!
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var tableView: UITableView!
    lazy var btnAddTopRight = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didClickBtnAdd))
    
    var activities: [ItemActivity] = []
    var area: Area?
    let viewModel = ListItemViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        emptyStateView.isHidden = false
        btnAddEmptyState.addTarget(self, action: #selector(didClickBtnAdd), for: .touchUpInside)
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CardItemCell", bundle: nil), forCellReuseIdentifier: "CardItemCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        getItems()
    }
    
    func getItems() {
        guard let areaId = area?.id else { return }
        
        viewModel.getItems(areaId: areaId) { result in
            self.activities = result
            self.tableView.reloadData()
            
            if self.activities.isEmpty {
                self.navigationItem.rightBarButtonItem = nil
                self.emptyStateView.isHidden = false
            } else {
                self.emptyStateView.isHidden = true
                self.navigationItem.rightBarButtonItem = self.btnAddTopRight
            }
        }
    }
    
    func setArea(area: Area) {
        title = area.getPlace()?.name
        self.area = area
    }
    
    @objc func didClickBtnAdd() {
        let destination = AddItemDetailVC()
        destination.setArea(area: self.area)
        destination.didAddItem = {
            self.getItems()
        }
        
        let nav = UINavigationController(rootViewController: destination)
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
        cell.configure(
            activity: activity.getActivity()?.name,
            area: activity.getArea()?.description,
            date: activity.date.getFormattedDate(format: "MMM d, yyyy")
        )
        
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
