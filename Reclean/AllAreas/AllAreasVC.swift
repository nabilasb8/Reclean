//
//  AllAreasVC.swift
//  Reclean
//
//  Created by Nabila on 15/11/22.
//

import UIKit

class AllAreasVC: UIViewController {

    @IBOutlet weak var listAreaCollView: UICollectionView!
    var areas: [Area] = []
    let viewModel = AllAreasViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "All Areas"
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 40) / 3
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: itemWidth, height: 125)
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 20
        listAreaCollView.collectionViewLayout = collectionViewLayout
        listAreaCollView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        listAreaCollView.register(UINib(nibName: "CardAreaCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardAreaCellCollectionViewCell")
        listAreaCollView.dataSource = self
        listAreaCollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAreas()
    }
    
    func getAreas() {
        viewModel.getAreas { result in
            self.areas = result
            self.listAreaCollView.reloadData()
        }
    }
    
    func goToBranchAreaVC(area: Area) {
        let destination = BranchAreaViewController()
        destination.setArea(area: area)
        navigationController?.pushViewController(destination, animated: true)
    }
    
    func showAddAreaVC() {
        let destination = AddAreaVC()
        let nav = UINavigationController(rootViewController: destination)
        destination.didAddArea = {
            self.getAreas()
        }
        present(nav, animated: true)
    }
}

extension AllAreasVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return areas.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listAreaCollView.dequeueReusableCell(withReuseIdentifier: "CardAreaCellCollectionViewCell", for: indexPath) as! CardAreaCellCollectionViewCell
        
        if indexPath.item % 2 == 0 {
            cell.viewBackground.backgroundColor = .secondaryOrange.withAlphaComponent(0.2)
        } else {
            cell.viewBackground.backgroundColor = .primaryNavy.withAlphaComponent(0.2)
        }
        
        if indexPath.item < areas.count {
            let area = areas[indexPath.item]
            cell.configure(
                title: area.description,
                iconName: area.getPlace()?.iconName
            )
        } else {
            cell.configure(title: "Add Area", iconName: "btn_addarea")
        }
        
        return cell
    }
}

extension AllAreasVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < areas.count {
            let area = areas[indexPath.item]
            goToBranchAreaVC(area: area)
        } else {
            showAddAreaVC()
        }
    }
}
