//
//  PastChallengeTagTVC.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 01/12/22.
//

import UIKit

class PastChallengeTagTVC: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.backgroundColor = .blueLinear.withAlphaComponent(0.2)
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
