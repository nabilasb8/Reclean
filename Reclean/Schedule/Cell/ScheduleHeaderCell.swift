//
//  ScheduleHeaderCell.swift
//  Reclean
//
//  Created by Nabila Syafrina on 01/12/22.
//

import UIKit

class ScheduleHeaderCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var btnDetails: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    
    var didClickedButtonDetail: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        bgView.backgroundColor = .blueLinear.withAlphaComponent(0.2)
        
        btnDetails.addTarget(self, action: #selector(clickButtonDetail), for: .touchUpInside)
    }
    
    @objc func clickButtonDetail() {
        didClickedButtonDetail?()
    }
    
    func configure(title: String?) {
        self.headerLabel.text = title
    }
    
}
