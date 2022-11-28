//
//  IntervalTimeCell.swift
//  Reclean
//
//  Created by Nabila on 21/11/22.
//

import UIKit

class IntervalTimeCell: UITableViewCell {

    @IBOutlet weak var labelInterval: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    var intervals = ["Daily", "Weekly", "Monthly", "Yearly"]
    
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
        
        for interval in intervals {
            let action = UIAction(title: interval) { (action) in
                self.labelInterval.text = interval
                self.labelInterval.textColor = .label
            }
            actions.append(action)
        }
        
        return actions
    }
    
}
