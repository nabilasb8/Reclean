//
//  CreateChallengeVC.swift
//  ReClean
//
//  Created by Nabila Syafrina on 02/12/22.
//

import UIKit

class CreateChallengeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var startDate: Date = Date()
    private var endDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create Challenge"
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "InputChallengeNameCell", bundle: nil), forCellReuseIdentifier: "InputChallengeNameCell")
        tableView.register(UINib(nibName: "InputChallengeDescriptionCell", bundle: nil), forCellReuseIdentifier: "InputChallengeDescriptionCell")
        tableView.register(UINib(nibName: "InitialDateCell", bundle: nil), forCellReuseIdentifier: "InitialDateCellStart")
        tableView.register(UINib(nibName: "InitialDateCell", bundle: nil), forCellReuseIdentifier: "InitialDateCellEnd")
        tableView.register(UINib(nibName: "SetRewardCell", bundle: nil), forCellReuseIdentifier: "SetRewardCell")
        tableView.dataSource = self
     //   tableView.delegate = self
    }
}

extension CreateChallengeVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputChallengeNameCell", for: indexPath) as! InputChallengeNameCell
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputChallengeDescriptionCell", for: indexPath) as! InputChallengeDescriptionCell
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InitialDateCellStart", for: indexPath) as! InitialDateCell
            
            cell.needUpdateTableView = {
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
            
            cell.didDateChanged = { date in
                self.startDate = date
            }
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InitialDateCellEnd", for: indexPath) as! InitialDateCell
            
            cell.needUpdateTableView = {
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
            
            cell.didDateChanged = { date in
                self.endDate = date
            }
            
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SetRewardCell", for: indexPath) as! SetRewardCell
            
            return cell
            
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
}
