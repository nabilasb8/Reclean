//
//  CardItemCell.swift
//  Reclean
//
//  Created by Nabila on 23/11/22.
//

import UIKit

class CardItemCell: UITableViewCell {

    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelArea: UILabel!
    @IBOutlet weak var labelActivity: UILabel!
    @IBOutlet weak var iconItem: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(activity: String, area: String, date: String) {
        labelActivity.text = activity
        labelArea.text = area
        labelDate.text = date
    }
}
