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
    var intervals: [MasterInterval] = []
    
    var didSelectInterval: ((String) -> Void)?
    
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
    
    func configure(intervals: [MasterInterval]) {
        self.intervals = intervals
        let actions = generateMenus()
        let menu = UIMenu(title: "", options: .displayInline, children: actions)
        selectButton.menu = menu
    }
    
    func generateMenus() -> [UIAction] {
        var actions = [UIAction]()
        
        for interval in intervals {
            let action = UIAction(title: interval.name) { (action) in
                self.labelInterval.text = interval.name
                self.labelInterval.textColor = .label
                self.didSelectInterval?(interval.id)
            }
            actions.append(action)
        }
        
        return actions
    }
    
}
