//
//  ThropiesTableViewCell.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 13/11/22.
//

import UIKit

class ThropiesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
