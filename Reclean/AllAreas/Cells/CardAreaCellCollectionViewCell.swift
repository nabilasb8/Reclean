//
//  CardAreaCellCollectionViewCell.swift
//  Reclean
//
//  Created by Nabila on 28/11/22.
//

import UIKit

class CardAreaCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconArea: UIImageView!
    @IBOutlet weak var titleArea: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(title: String?, iconName: String?) {
        titleArea.text = title
        iconArea.image = UIImage(named: iconName ?? "")
    }
}
