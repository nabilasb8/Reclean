//
//  FamilyMemberTVC.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 28/11/22.
//

import UIKit

class FamilyMemberTVC: UITableViewCell {
    @IBOutlet weak var imageFamily: UIImageView!
    @IBOutlet weak var nameFamily: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
