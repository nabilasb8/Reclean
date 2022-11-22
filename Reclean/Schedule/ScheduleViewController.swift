//
//  ScheduleViewController.swift
//  Reclean
//
//  Created by Hastomi Riduan Munthe on 08/11/22.
//

import UIKit

class ScheduleViewController: UIViewController {
    @IBOutlet weak var ScheduleTable: UITableView!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
