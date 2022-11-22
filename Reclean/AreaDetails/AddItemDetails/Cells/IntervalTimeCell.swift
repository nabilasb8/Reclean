//
//  IntervalTimeCell.swift
//  Reclean
//
//  Created by Nabila on 21/11/22.
//

import UIKit

class IntervalTimeCell: UITableViewCell {

    @IBOutlet weak var selectButton: UIButton!
    var intervals = ["Daily", "Weekly", "Monthly", "Yearly", "Custom"]
    
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
        
        for interval in intervals {
            let action = UIAction(title: interval) { (action) in
                
            }
            actions.append(action)
        }
        
        return actions
    }
    
}
