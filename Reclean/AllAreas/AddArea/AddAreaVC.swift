//
//  AddAreaVC.swift
//  Reclean
//
//  Created by Nabila Syafrina on 29/11/22.
//

import UIKit

class AddAreaVC: UIViewController {
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var selectTypeBtn: UIButton!
    @IBOutlet weak var descAreaLabel: UITextField!
    
    var didAddArea: (() -> Void)?
    var viewModel = AddAreaViewModel()
    var areas: [MasterPlace] = []
    var placeId = ""
    var descriptionArea = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Area"
        selectTypeBtn.showsMenuAsPrimaryAction = true
        descAreaLabel.delegate = self
        descAreaLabel.autocorrectionType = .no
        
        viewModel.getMasterPlaces { result in
            self.areas = result
            self.configure()
        }
        
        btnSave.addTarget(self, action: #selector(didClickButtonSave), for: .touchUpInside)
    }
    
    func configure() {
        let actions = generateMenus()
        let menu = UIMenu(title: "", options: .displayInline, children: actions)
        selectTypeBtn.menu = menu
    }
    
    func generateMenus() -> [UIAction] {
        var actions = [UIAction]()
        
        for area in areas {
            print(area.name)
            let action = UIAction(title: area.name) { (action) in
                self.areaLabel.text = area.name
                self.areaLabel.textColor = .label
                self.placeId = area.id
            }
            actions.append(action)
        }
        return actions
    }
    
    @objc func didClickButtonSave() {
        viewModel.addArea(
            placeId: placeId,
            description: descriptionArea
        )
        didAddArea?()
        dismiss(animated: true)
    }
}

extension AddAreaVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        descriptionArea = descAreaLabel.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        descAreaLabel.endEditing(true)
        return true
    }
}
