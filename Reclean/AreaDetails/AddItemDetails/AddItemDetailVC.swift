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
    var activities: [MasterActivity] = []
    var intervals: [MasterInterval] = []
    var viewModel = AddItemDetailViewModel()
    var area: Area?
    
    private var activityId = ""
    private var itemDescription = ""
    private var dateActivity: Date = Date()
    private var intervalId = ""
    
    var didAddItem: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Item"
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SelectItemCell", bundle: nil), forCellReuseIdentifier: "SelectItemCell")
        tableView.register(UINib(nibName: "ItemNameCell", bundle: nil), forCellReuseIdentifier: "ItemNameCell")
        tableView.register(UINib(nibName: "InitialDateCell", bundle: nil), forCellReuseIdentifier: "InitialDateCell")
        tableView.register(UINib(nibName: "IntervalTimeCell", bundle: nil), forCellReuseIdentifier: "IntervalTimeCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        btnSave.addTarget(self, action: #selector(didClickButtonSave), for: .touchUpInside)
        
        viewModel.getActivities(placeId: area?.placeId ?? "") { result in
            self.activities = result
            self.tableView.reloadData()
        }
        viewModel.getIntervals { result in
            self.intervals = result
            self.tableView.reloadData()
        }
    }
    
    func setArea(area: Area?) {
        self.area = area
    }
    
    @objc func didClickButtonSave() {
        viewModel.addItemActivity(
            id: UUID().uuidString,
            areaId: self.area?.id ?? "",
            activityId: activityId,
            description: itemDescription,
            date: dateActivity,
            intervalId: intervalId
        )
        didAddItem?()
        dismiss(animated: true)
    }
}

extension AddItemDetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectItemCell", for: indexPath) as! SelectItemCell
            cell.configure(activities: activities)
            cell.didSelectActivity = { id in
                self.activityId = id
            }
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemNameCell", for: indexPath) as! ItemNameCell
            cell.didChangeText = { text in
                self.itemDescription = text
            }
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InitialDateCell", for: indexPath) as! InitialDateCell
            
            cell.needUpdateTableView = {
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
            
            cell.didDateChanged = { date in
                self.dateActivity = date
            }
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IntervalTimeCell", for: indexPath) as! IntervalTimeCell
            cell.configure(intervals: intervals)
            cell.didSelectInterval = { id in
                self.intervalId = id
            }
            return cell
            
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
}

//buat nambahin function untuk action ketika tap salah satu cell
extension AddItemDetailVC: UITableViewDelegate {
    
}
