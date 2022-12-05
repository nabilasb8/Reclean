//
//  SetRewardCell.swift
//  ReClean
//
//  Created by Nabila Syafrina on 02/12/22.
//

import UIKit

class SetRewardCell: UITableViewCell {

    @IBOutlet weak var textFieldReward: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
