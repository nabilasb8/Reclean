//
//  ItemNameCell.swift
//  Reclean
//
//  Created by Nabila on 21/11/22.
//

import UIKit

class ItemNameCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    
    var didChangeText: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        textField.autocorrectionType = .no
        textField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ItemNameCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        didChangeText?(textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
