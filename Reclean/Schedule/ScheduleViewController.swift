//
//  AfterSignInViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 08/11/22.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    var akuKenapa = [""]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelReClean: UIView!
    
    @IBOutlet weak var buttonAddArea: UIButton!
    @IBOutlet weak var buttonJoinFamily: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)

        //TableViewSchedule
        title = "Schedule"
        
        tableView.isHidden = true
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TitleAllAreaTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleAllAreaTableViewCell")
        
        tableView.register(UINib(nibName: "TagAllAreaTableViewCell", bundle: nil), forCellReuseIdentifier: "TagAllAreaTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    @IBAction func addAreaa(_ sender: Any) {

            let viewController = AddAreaViewController()
           viewController.modalPresentationStyle = .popover
            viewController.scheduleDelegate = self
            present(viewController, animated: true, completion: nil)

    }
    
    @IBAction func joinButtonFamily(_ sender: Any) {
        
    }
    
    func screenEmpty() {
        buttonAddArea.isHidden = true
        buttonJoinFamily.isHidden = true
        labelReClean.isHidden = true
    }
    
    func goToBranchViewController() {
        if let navigationController = navigationController {
            let viewController = BranchAreaViewController()
            navigationController.pushViewController(viewController,animated:true)
        }
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
        
            switch indexPath.section {
            case 1 :
                goToBranchViewController()
            default:
                break
            }

    }

}

extension ScheduleViewController: ScheduleDelegate {
    func didTapSave() {
        screenEmpty()
        tableView.isHidden = false
    }

}

