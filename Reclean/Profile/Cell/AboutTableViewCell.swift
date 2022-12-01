//
//  AboutTableViewCell.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 13/11/22.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView3: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        containerView.backgroundColor = .blueLinear.withAlphaComponent(0.2)
        containerView2.backgroundColor = .blueLinear.withAlphaComponent(0.2)
        containerView3.backgroundColor = .blueLinear.withAlphaComponent(0.2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
