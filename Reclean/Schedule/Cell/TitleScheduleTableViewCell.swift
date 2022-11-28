//
//  TitleScheduleTableViewCell.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 08/11/22.
//

import UIKit

class TitleScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var seeAll: UIButton!
    @IBOutlet weak var titleSchedule: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func seeAll(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
