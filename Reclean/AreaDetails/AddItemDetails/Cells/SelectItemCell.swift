//
//  SelectItemCell.swift
//  Reclean
//
//  Created by Nabila on 21/11/22.
//

import UIKit

class SelectItemCell: UITableViewCell {
    
    @IBOutlet weak var selectButton: UIButton!
    var activities = ["Sweeping floor", "Vacuum carpet", "Vacuum sofa"]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let actions = generateMenus()
        let menu = UIMenu(title: "", options: .displayInline, children: actions)
        
        selectButton.menu = menu
        selectButton.showsMenuAsPrimaryAction = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func generateMenus() -> [UIAction] {
        var actions = [UIAction]()
        
        for activity in activities {
            let action = UIAction(title: activity) { (action) in
                
            }
            actions.append(action)
        }
        
        return actions
    }
    
}
