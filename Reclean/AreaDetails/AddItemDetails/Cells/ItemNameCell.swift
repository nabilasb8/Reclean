//
//  ItemNameCell.swift
//  Reclean
//
//  Created by Nabila on 21/11/22.
//

import UIKit

class ItemNameCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
