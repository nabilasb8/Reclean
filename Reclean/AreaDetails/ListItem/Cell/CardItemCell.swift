//
//  CardItemCell.swift
//  Reclean
//
//  Created by Nabila on 23/11/22.
//

import UIKit

class CardItemCell: UITableViewCell {
    
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelArea: UILabel!
    @IBOutlet weak var labelActivity: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var iconItem: UIImageView!
    
    var didClickedButtonFinish: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        bgView.layer.borderColor = UIColor.separator.cgColor
        bgView.layer.borderWidth = 1.0
        bgView.layer.cornerRadius = 16
        
        btnFinish.addTarget(self, action: #selector(clickButtonFinish), for: .touchUpInside)
    }
    
    @objc func clickButtonFinish() {
        didClickedButtonFinish?()
    }
    
    func configure(activity: String?, area: String?, date: String?) {
        labelActivity.text = activity
        labelArea.text = area
        labelDate.text = date
    }
    
    func configure(itemActivity: ItemActivity) {
        labelActivity.text = itemActivity.getActivity()?.name
        labelArea.text = itemActivity.getArea()?.description
        
        if let finishDate = itemActivity.finishDate {
            labelDate.text = finishDate.getFormattedDate(format: "MMM d, yyyy")
            btnFinish.isHidden = true
        } else {
            labelDate.text = itemActivity.date.getFormattedDate(format: "MMM d, yyyy")
            btnFinish.isHidden = false
        }
    }
}
