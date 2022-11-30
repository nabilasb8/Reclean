//
//  AddAreaViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 10/11/22.
//

import UIKit
import CloudKit

protocol ScheduleDelegate {
    func didTapSave()
}

class AddAreaViewController: UIViewController {
    
    var scheduleDelegate: ScheduleDelegate!
    
    @IBOutlet weak var selectArea: UIButton!
    @IBOutlet weak var textFieldAreaName: UITextField!
    
    let areas = ["Living Room", "Bedroom", "Bathroom" ]
    var isianText: String = ""
    
    let publicDatabase = CKContainer(identifier: "iCloud.com.sw1ftly.Reclean").publicCloudDatabase
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setPopupButton()
        
        title = "Add Area"
        saveButton()
    }
    
    func insertAreaName() {
        let allArea = CKRecord(recordType: "AllArea")
        allArea["name"] = textFieldAreaName.text! as CKRecordValue
        
        publicDatabase.save(allArea) { record, error in
            print(error.debugDescription)
        }
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
        isianText = textFieldAreaName.text ?? ""
        print(isianText)
        dismiss(animated: true, completion: nil)
        scheduleDelegate.didTapSave()
        
    }
    
    @objc func moveToAnotherVC(){
        // kode pbuat pindah
    }
    
    func saveButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(moveToAnotherVC2))
    }
    
    @objc func moveToAnotherVC2(){
        insertAreaName()
        
        // kode pbuat pindah
        if let navigationController1 = navigationController {
            let viewController = ScheduleViewController()
            navigationController1.pushViewController(viewController,animated:true)
        }
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
