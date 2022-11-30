//
//  InitialDateCell.swift
//  Reclean
//
//  Created by Nabila on 21/11/22.
//

import UIKit

class InitialDateCell: UITableViewCell {
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var viewDatePicker: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var needUpdateTableView: (() -> Void)?
    var didDateChanged: ((Date) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        datePicker.isHidden = true
        datePicker.addTarget(self, action: #selector(didDatePickerValueChanged), for: .valueChanged)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didClickView))
        viewDatePicker.addGestureRecognizer(tap)
    }
    
    @objc func didClickView() {
        datePicker.isHidden = !datePicker.isHidden
        needUpdateTableView?()
        
        datePicker.date = Date()
        needUpdateTableView?()
    }
    
    @objc func didDatePickerValueChanged() {
        labelDate.text = "\(datePicker.date.getFormattedDate(format: "MMM d, h:mm a"))"
        labelDate.textColor = .label
        didDateChanged?(datePicker.date)
        needUpdateTableView?()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
