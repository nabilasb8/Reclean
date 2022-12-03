//
//  InputChallengeNameCell.swift
//  ReClean
//
//  Created by Nabila Syafrina on 02/12/22.
//

import UIKit

class InputChallengeNameCell: UITableViewCell {

    @IBOutlet weak var textFieldChallenge: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
