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
    lazy var btnLogout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didClickButtonLogout))
    
    var viewModel = ProfileViewModel()
    var pastItemActivities: [ItemActivity] = []
    var activitiesPoint: Int = 0
    
    let akuSiapa = [""]
    let akuDimana = [""]
    let akuKenapa = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        btnLogout.tintColor = .red
        navigationItem.rightBarButtonItem = btnLogout
        
        tableView.register(UINib(nibName: "ActivitiesTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivitiesTableViewCell")
        tableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutTableViewCell")
        tableView.register(UINib(nibName: "ThrophyTableViewCell", bundle: nil), forCellReuseIdentifier: "ThrophyTableViewCell")
        tableView.register(UINib(nibName: "ThropiesTableViewCell", bundle: nil), forCellReuseIdentifier: "ThropiesTableViewCell")
        //        tableView.register(UINib(nibName: "AddNewFamilyTFC", bundle: nil), forCellReuseIdentifier: "AddNewFamilyTFC")
        //        tableView.register(UINib(nibName: "FamilyMemberTVC", bundle: nil), forCellReuseIdentifier: "FamilyMemberTVC")
        tableView.register(UINib(nibName: "ComingSoonTVC", bundle: nil), forCellReuseIdentifier: "ComingSoonTVC")
        tableView.register(UINib(nibName: "CardItemCell", bundle: nil), forCellReuseIdentifier: "CardItemCell")
        tableView.register(UINib(nibName: "ActivityPointCell", bundle: nil), forCellReuseIdentifier: "ActivityPointCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getUserInformation()
        viewModel.getPastActivities { result in
            self.pastItemActivities = result
            var totalPoint = 0
            result.forEach { item in
                let point = item.getActivity()?.point ?? 0
                totalPoint += point
            }
            self.activitiesPoint = totalPoint
            
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func controlSegment(_ sender: Any) {
        tableView.reloadData()
    }
    
    @objc func didClickButtonLogout() {
        viewModel.markUserUnauthorized()
        goToSignInViewController()
    }
    
    func getUserInformation() {
        viewModel.getUserInformation { model in
            DispatchQueue.main.async {
                self.labelName.text = model?.fullName
            }
        }
    }
    
    func goToSignInViewController() {
        let destination = SignInUiViewController()
        navigationController?
            .tabBarController?
            .navigationController?
            .setViewControllers([destination], animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return pastItemActivities.count
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardItemCell", for: indexPath) as! CardItemCell
            let activity = pastItemActivities[indexPath.row]
            cell.configure(itemActivity: activity)
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityPointCell", for: indexPath) as! ActivityPointCell
            cell.configure(point: activitiesPoint)
            
            return cell
            
        case 2:
            switch indexPath.row {
            case 0 :
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "ComingSoonTVC", for: indexPath) as! ComingSoonTVC
                return cell2
                //            case 0:
                //                let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewFamilyTFC", for: indexPath) as! AddNewFamilyTFC
                //                return cell
                //            case 1:
                //                let cell1 = tableView.dequeueReusableCell(withIdentifier: "FamilyMemberTVC", for: indexPath) as! FamilyMemberTVC
                //                return cell1
                //            case 2 :
                //                let cell2 = tableView.dequeueReusableCell(withIdentifier: "ComingSoonTVC", for: indexPath) as! ComingSoonTVC
                //                return cell2
                
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
    
    func goToSourceViewController(category: String) {
        let destination = InviteFamilyVC()
        destination.modalPresentationStyle = .popover
        present(destination, animated: true, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Invitation Pending", message: "The user has not accept the invitation. Please remind him/her to accept.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { action in
            print("sudah")
        }))
        alert.addAction(UIAlertAction(title: "Cancel Invitation", style: .destructive, handler: { action in
            print("sudah")
        }))
        
        present(alert, animated: true)
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex {
        case 2:
            switch indexPath.row {
            case 0:
                let category = akuKenapa[indexPath.row]
                goToSourceViewController(category: category)
            case 1:
                showAlert()
            default:
                break
            }
        default:
            break
        }
        
    }
}
