//
//  ActivityDetails.swift
//  ReClean
//
//  Created by Nabila Syafrina on 03/12/22.
//

import UIKit

class ActivityDetails: UIViewController {
    
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var labelInterval: UILabel!
    @IBOutlet weak var labelDateTime: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelActivity: UILabel!
    
    var activity: ItemActivity?
    var viewModel = ActivityDetailsViewModel()
    var didDeleteActivity: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Activity Details"
        self.labelActivity.text = activity?.getActivity()?.name
        self.labelDescription.text = activity?.description
        self.labelDateTime.text = activity?.date.getFormattedDate(format: "MMM d, yyyy")
        self.labelInterval.text = activity?.getInterval()?.name
        
        self.btnDelete.addTarget(self, action: #selector(didClickBtnDelete), for: .touchUpInside)
    }
    
    func setActivity(activity: ItemActivity) {
        self.activity = activity
    }
    
    @objc func didClickBtnDelete() {
        viewModel.deleteActivity(id: activity?.id ?? "")
        didDeleteActivity?()
        dismiss(animated: true)
    }
}
