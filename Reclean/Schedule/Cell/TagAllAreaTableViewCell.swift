//
//  TagAllAreaTableViewCell.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 09/11/22.
//

import UIKit

class TagAllAreaTableViewCell: UITableViewCell {
    @IBOutlet weak var buttonTap: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
