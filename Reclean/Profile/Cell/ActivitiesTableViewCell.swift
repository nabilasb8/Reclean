//
//  ActivitiesTableViewCell.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 24/11/22.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
