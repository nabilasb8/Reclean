//
//  ScheduleViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 08/11/22.
//

import UIKit

class ScheduleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)

        title = "Schedule"
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TitleAllAreaTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleAllAreaTableViewCell")
        
        tableView.register(UINib(nibName: "TagAllAreaTableViewCell", bundle: nil), forCellReuseIdentifier: "TagAllAreaTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func goToBranchAreaViewController() {
        let destination = BranchAreaViewController()
        navigationController?.pushViewController(destination, animated: true)
    }


}

extension ScheduleViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAllAreaTableViewCell", for: indexPath) as! TitleAllAreaTableViewCell
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TagAllAreaTableViewCell", for: indexPath) as! TagAllAreaTableViewCell
            
            return cell
            
        default:
            let cell = UITableViewCell()
            
            return cell
            
        }

    }
}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToBranchAreaViewController()
    }

}
