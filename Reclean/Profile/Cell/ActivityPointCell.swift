//
//  ActivityPointCell.swift
//  ReClean
//
//  Created by Nabila Syafrina on 03/12/22.
//

import UIKit

class ActivityPointCell: UITableViewCell {

    @IBOutlet weak var scorePoint: UILabel!
    @IBOutlet weak var titlePoint: UILabel!
    @IBOutlet weak var contentBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentBgView.backgroundColor = .blueLinear.withAlphaComponent(0.2)
        contentBgView.layer.cornerRadius = 10
        selectionStyle = .none
    }
    
    func configure(point: Int) {
        scorePoint.text = "\(point)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
