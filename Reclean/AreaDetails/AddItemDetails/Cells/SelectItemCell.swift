//
//  SelectItemCell.swift
//  Reclean
//
//  Created by Nabila on 21/11/22.
//

import UIKit

class SelectItemCell: UITableViewCell {
    
    @IBOutlet weak var selectButton: UIButton!
    var activities: [MasterActivity] = []
    @IBOutlet weak var labelActivity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        selectButton.showsMenuAsPrimaryAction = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(activities: [MasterActivity]) {
        self.activities = activities
        let actions = generateMenus()
        let menu = UIMenu(title: "", options: .displayInline, children: actions)
        
        selectButton.menu = menu
    }
    
    func generateMenus() -> [UIAction] {
        var actions = [UIAction]()
        
        for activity in activities {
            print(activity.name)
            let action = UIAction(title: activity.name) { (action) in
                self.labelActivity.text = activity.name
                self.labelActivity.textColor = .label
            }
            actions.append(action)
        }
        
        return actions
    }
    
}
