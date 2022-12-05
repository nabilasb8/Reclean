//
//  AllScheduleVC.swift
//  ReClean
//
//  Created by Nabila Syafrina on 03/12/22.
//

import UIKit

class AllScheduleVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = AllScheduleViewModel()
    var activities: [ItemActivity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Schedules"
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "CardItemCell", bundle: nil), forCellReuseIdentifier: "CardItemCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllSchedules()
    }
    
    func getAllSchedules() {
        viewModel.getAllSchedules { result in
            self.activities = result
            self.tableView.reloadData()
        }
    }
    
    func goToActivityDetailsVC(activity: ItemActivity) {
        let destination = ActivityDetails()
        destination.setActivity(activity: activity)
        destination.didDeleteActivity = {
            self.getAllSchedules()
        }
        let nav = UINavigationController(rootViewController: destination)
        present(nav, animated: true)
    }
}

extension AllScheduleVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardItemCell", for: indexPath) as! CardItemCell
        let activity = activities[indexPath.row]
        cell.configure(
            activity: activity.getActivity()?.name,
            area: activity.getArea()?.description,
            date: activity.date.getFormattedDate(format: "MMM d, yyyy")
        )
        cell.didClickedButtonFinish = {
            self.viewModel.markItemAsDone(id: activity.id)
            self.getAllSchedules()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
}

extension AllScheduleVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activity = activities[indexPath.row]
        goToActivityDetailsVC(activity: activity)
    }
}
