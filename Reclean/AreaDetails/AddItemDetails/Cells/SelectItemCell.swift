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
    @IBOutlet weak var labelActivity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
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
                self.labelActivity.text = activity
                self.labelActivity.textColor = .label
            }
            actions.append(action)
        }
        
        return actions
    }
    
}
