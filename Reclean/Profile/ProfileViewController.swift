//
//  ProfileViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 13/11/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let akuSiapa = [""]
    let akuDimana = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        tableView.register(UINib(nibName: "ActivitiesTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivitiesTableViewCell")
        tableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutTableViewCell")
        tableView.register(UINib(nibName: "ThrophyTableViewCell", bundle: nil), forCellReuseIdentifier: "ThrophyTableViewCell")
        tableView.register(UINib(nibName: "ThropiesTableViewCell", bundle: nil), forCellReuseIdentifier: "ThropiesTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
    
    @IBAction func controlSegment(_ sender: Any) {
        tableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return 1
        case 1:
            return 3
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return akuSiapa.count
        case 1:
            return akuDimana.count
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitiesTableViewCell", for: indexPath) as! ActivitiesTableViewCell
            return cell
            
        case 1:
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AboutTableViewCell", for: indexPath) as! AboutTableViewCell
                return cell
            case 1:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "ThrophyTableViewCell", for: indexPath) as! ThrophyTableViewCell
                return cell1
            case 2:
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "ThropiesTableViewCell", for: indexPath) as! ThropiesTableViewCell
                return cell2
                
            default:
                let cell = UITableViewCell()
                return cell
            }
        default:
            break
        }
        let cell = UITableViewCell()
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
