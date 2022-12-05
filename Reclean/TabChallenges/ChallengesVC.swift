//
//  ChallengesVC.swift
//  Reclean
//
//  Created by Nabila on 15/11/22.
//

import UIKit

class ChallengesVC: UIViewController {

    @IBOutlet weak var listChallengesTableView: UITableView!
    
    lazy var btnAddTopRight = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didClickButtonAdd))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Challenges"
        navigationItem.rightBarButtonItem = btnAddTopRight
        
        listChallengesTableView.register(UINib(nibName: "ActiveTagTVC", bundle: nil), forCellReuseIdentifier: "ActiveTagTVC")
        listChallengesTableView.register(UINib(nibName: "ActiveChallengeTVC", bundle: nil), forCellReuseIdentifier: "ActiveChallengeTVC")
        listChallengesTableView.register(UINib(nibName: "PastChallengeTagTVC", bundle: nil), forCellReuseIdentifier: "PastChallengeTagTVC")
        listChallengesTableView.register(UINib(nibName: "PastChallengeTVC", bundle: nil), forCellReuseIdentifier: "PastChallengeTVC")
        listChallengesTableView.delegate = self
        listChallengesTableView.dataSource = self
        self.listChallengesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
    @objc func didClickButtonAdd() {
            let destination = CreateChallengeVC()
            let nav = UINavigationController(rootViewController: destination)
            present(nav, animated: true, completion: nil)
        }
}

extension ChallengesVC: UITableViewDataSource {
    
    func numberOfSections(in listChallengesTableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveTagTVC", for: indexPath) as! ActiveTagTVC
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveChallengeTVC", for: indexPath) as! ActiveChallengeTVC
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PastChallengeTagTVC", for: indexPath) as! PastChallengeTagTVC
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PastChallengeTVC", for: indexPath) as! PastChallengeTVC
            
            return cell
            
        default:
            let cell = UITableViewCell()
            
            return cell
            
        }

    }
    
}


extension ChallengesVC: UITableViewDelegate {
    
}

