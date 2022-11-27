//
//  EndYearViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 14/11/22.
//

import UIKit

class EndYearViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let akuSiapa = [""]
    let akuDimana = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "End Year Cleaning"
        
        tableView.register(UINib(nibName: "LearderBoardInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "LearderBoardInfoTableViewCell")
        tableView.register(UINib(nibName: "RankNamePointTableViewCell", bundle: nil), forCellReuseIdentifier: "RankNamePointTableViewCell")
        tableView.register(UINib(nibName: "RankTableViewCell", bundle: nil), forCellReuseIdentifier: "RankTableViewCell")
        tableView.register(UINib(nibName: "DetailTaskTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTaskTableViewCell")
        tableView.register(UINib(nibName: "DetailTaskTagTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTaskTagTableViewCell")
        tableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
        tableView.register(UINib(nibName: "RewardTableViewCell", bundle: nil), forCellReuseIdentifier: "RewardTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }


    @IBAction func controlSegmented(_ sender: Any) {
        tableView.reloadData()
    }
}


extension EndYearViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return 3
        case 1:
            return 5
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
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "LearderBoardInfoTableViewCell", for: indexPath) as! LearderBoardInfoTableViewCell
                return cell
            case 1:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "RankNamePointTableViewCell", for: indexPath) as! RankNamePointTableViewCell
                return cell1
            case 2:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "RankTableViewCell", for: indexPath) as! RankTableViewCell
                return cell1
            default:
                let cell = UITableViewCell()
                return cell
            }
            
        case 1:
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTaskTableViewCell", for: indexPath) as! DetailTaskTableViewCell
                return cell
            case 1:
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "DetailTaskTagTableViewCell", for: indexPath) as! DetailTaskTagTableViewCell
                return cell1
            case 2:
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
                return cell2
            case 3:
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "RewardTableViewCell", for: indexPath) as! RewardTableViewCell
                return cell3
                
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

extension EndYearViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
