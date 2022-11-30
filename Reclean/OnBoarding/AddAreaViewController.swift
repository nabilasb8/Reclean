//
//  AddAreaViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 10/11/22.
//

import UIKit

protocol ScheduleDelegate {
    func didTapSave()
}

class AddAreaViewController: UIViewController {
    
    var scheduleDelegate: ScheduleDelegate!
    
    @IBOutlet weak var selectArea: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    let areas = ["Living Room", "Bedroom", "Bathroom" ]
    var isianText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setPopupButton()

    }
    
    func setPopupButton() {
        
        let actions = generateAreas()
        let menu = UIMenu(title: "", options: .displayInline, children: actions)
        
        selectArea.menu = menu
        selectArea.showsMenuAsPrimaryAction = true
        selectArea.changesSelectionAsPrimaryAction = true
    }

    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        isianText = textField.text ?? ""
        print(isianText)
        dismiss(animated: true, completion: nil)
        scheduleDelegate.didTapSave()
        
    }
    
    
    func generateAreas() -> [UIAction] {
        var actions = [UIAction]()
        
        for area in areas {
            let action = UIAction(title: area) { (action) in
                
            }
            actions.append(action)
        }
        
        return actions
    }
}
