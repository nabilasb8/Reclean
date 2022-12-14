//
//  TabBarController.swift
//  Reclean
//
//  Created by Nabila Syafrina on 30/11/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appearence = UITabBarAppearance()
        appearence.backgroundColor = .systemBackground
        tabBar.standardAppearance = appearence
        tabBar.scrollEdgeAppearance = appearence
        
        viewControllers = [
            createScheduleViewController(),
            createChallengesViewController(),
            createProfileViewController()
        ]
    }
    
    func createScheduleViewController() -> UIViewController {
        let viewController = ScheduleViewController()
        let nav = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .systemBackground
        nav.title = "Schedule"
        nav.tabBarItem.image = UIImage(systemName: "calendar")
        
        return nav
    }
    
    func createChallengesViewController() -> UIViewController {
        let viewController = ChallengesVC()
        let nav = UINavigationController(rootViewController: viewController)
        nav.view.backgroundColor = .systemBackground
        nav.title = "Challenges"
        nav.tabBarItem.image = UIImage(systemName: "target")
        
        return nav
    }
    
    func createProfileViewController() -> UIViewController {
        let viewController = ProfileViewController()
        let nav = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .systemBackground
        nav.title = "Profile"
        nav.tabBarItem.image = UIImage(systemName: "person.circle")
        
        return nav
    }
}
