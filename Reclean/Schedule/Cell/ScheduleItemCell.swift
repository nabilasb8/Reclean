//
//  ScheduleItemCell.swift
//  Reclean
//
//  Created by Nabila Syafrina on 01/12/22.
//

import UIKit

class ScheduleItemCell: UITableViewCell {
    @IBOutlet weak var areaDescription: UILabel!
    @IBOutlet weak var areaType: UILabel!
    @IBOutlet weak var iconArea: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        containerView.layer.borderColor = UIColor.separator.cgColor
        containerView.layer.borderWidth = 1.0
        containerView.layer.cornerRadius = 16
    }
    
    func configure(area: Area) {
        self.areaDescription.text = area.description
        self.areaType.text = area.getPlace()?.name
        self.iconArea.image = UIImage(named: area.getPlace()?.iconName ?? "")
    }
    
}
