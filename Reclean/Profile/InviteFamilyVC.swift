//
//  InviteFamilyVC.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 29/11/22.
//

import UIKit

class InviteFamilyVC: UIViewController {
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var textFieldAppleID: UITextField!
    @IBOutlet weak var buttonInvite: UIButton!
    @IBOutlet weak var warningText: UILabel!
    
    var isianText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Invite Member"
        warningText.isHidden = true
        textFieldView.backgroundColor = .border
        textFieldView.layer.cornerRadius = 16
    }
    
    
    @IBAction func inviteButton(_ sender: Any) {
        
        if textFieldAppleID.text == "" {
           warningText.isHidden = false
        } else {
            isianText = textFieldAppleID.text ?? ""
            print(isianText)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }

}
