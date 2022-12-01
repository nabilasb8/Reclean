//
//  AddAreaVC.swift
//  Reclean
//
//  Created by Nabila Syafrina on 29/11/22.
//

import UIKit

class AddAreaVC: UIViewController {
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var selectTypeBtn: UIButton!
    @IBOutlet weak var descAreaLabel: UITextField!
    
    var areas: [MasterPlace] = MasterPlaceRepository.shared.getPlaces()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Area"
        selectTypeBtn.showsMenuAsPrimaryAction = true
        configure()
    }
    
    func configure() {
        let actions = generateMenus()
        let menu = UIMenu(title: "", options: .displayInline, children: actions)
        selectTypeBtn.menu = menu
    }
    
    func generateMenus() -> [UIAction] {
        var actions = [UIAction]()
        
        for area in areas {
            print(area.name)
            let action = UIAction(title: area.name) { (action) in
                self.areaLabel.text = area.name
                self.areaLabel.textColor = .label
            }
            actions.append(action)
        }
        return actions
    }
}
