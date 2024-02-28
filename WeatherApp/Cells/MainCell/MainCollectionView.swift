//
//  CollectionView.swift
//  WeatherApp
//
//  Created by Стас on 28.02.2024.
//

import UIKit

class MainCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    struct Cells {
        static let leftCell = "leftCell"
        static let rightCell = "rightCell"
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // or .vertical
        layout.minimumLineSpacing = 5
        super.init(frame: frame, collectionViewLayout: layout)
        dataSource = self
        delegate = self
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: Cells.leftCell)
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: Cells.rightCell)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 1 : 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            // отступы у секций
            if section == 0 {
                return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            } else {
                return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.leftCell, for: indexPath)
            cell.backgroundColor = .green
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.rightCell, for: indexPath)
            cell.backgroundColor = .gray
            return cell
        }
    }
}
