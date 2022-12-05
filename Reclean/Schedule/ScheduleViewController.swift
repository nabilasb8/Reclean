//
//  AfterSignInViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 08/11/22.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelReClean: UIView!
    
    @IBOutlet weak var buttonAddArea: UIButton!
    @IBOutlet weak var buttonJoinFamily: UIButton!
    
    var dataSource: [ScheduleCellType] = []
    var viewModel = ScheduleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableViewSchedule
        title = "Schedule"
        
        tableView.isHidden = true
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ScheduleHeaderCell", bundle: nil), forCellReuseIdentifier: "ScheduleHeaderCell")
        tableView.register(UINib(nibName: "ScheduleItemCell", bundle: nil), forCellReuseIdentifier: "ScheduleItemCell")
        tableView.register(UINib(nibName: "CardItemCell", bundle: nil), forCellReuseIdentifier: "CardItemCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getDataSource()
    }
    
    func getDataSource() {
        viewModel.getDataSource { result in
            self.tableView.isHidden = result.isEmpty
            self.dataSource = result
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addAreaa(_ sender: Any) {
        let destination = AddAreaVC()
        destination.didAddArea = {
            self.getDataSource()
        }
        
        let nav = UINavigationController(rootViewController: destination)
        present(nav, animated: true, completion: nil)
    }
    
    @IBAction func joinButtonFamily(_ sender: Any) {
        let destination = InvitationCodeViewController()
//        destination.didAddArea = {
//            self.getDataSource()
//        }
        
        let nav = UINavigationController(rootViewController: destination)
        present(nav, animated: true, completion: nil)
    }
    
    func screenEmpty() {
        buttonAddArea.isHidden = true
        buttonJoinFamily.isHidden = true
        labelReClean.isHidden = true
    }
    
    func didClickButtonAtHeader(action: ScheduleHeaderActionType) {
        switch action {
        case .allArea:
            goToAllAreasVC()
        case .allSchedule:
            goToAllSchedule()
        }
    }
    
    func goToListItemVC(area: Area) {
        let destination = ListItemVC()
        destination.setArea(area: area)
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func goToAllAreasVC() {
        let destination = AllAreasVC()
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func goToAllSchedule() {
        let destination = AllScheduleVC()
        navigationController?.pushViewController(destination, animated: true)
    }
}

extension ScheduleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = dataSource[indexPath.row]
        switch cellType {
        case let .header(title, action, isBtnDetailsHidden):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleHeaderCell", for: indexPath) as! ScheduleHeaderCell
            cell.configure(title: title, isBtnDetailsHidden: isBtnDetailsHidden)
            cell.didClickedButtonDetail = {
                self.didClickButtonAtHeader(action: action)
            }
            
            return cell
            
        case let .areaItem(area):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleItemCell", for: indexPath) as! ScheduleItemCell
            cell.configure(area: area)
            
            return cell
            
        case let .activityItem(itemActivity):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardItemCell", for: indexPath) as! CardItemCell
            cell.configure(itemActivity: itemActivity)
            cell.didClickedButtonFinish = {
                self.viewModel.markItemAsDone(id: itemActivity.id)
                self.getDataSource()
            }
            
            return cell
        }
    }
}

extension ScheduleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = dataSource[indexPath.row]
        
        switch cellType {
        case let .areaItem(area):
            goToListItemVC(area: area)
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

