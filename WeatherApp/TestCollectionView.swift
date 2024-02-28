//
//  File.swift
//  WeatherApp
//
//  Created by Стас on 28.02.2024.
//


import UIKit
import SnapKit


// Это если сделать просто CollectionView без таблицы

class ViewController2: UIViewController {
    

    let mainCollectionView = MainCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainCollectionView)
        
        setupConstraints()
    }
    
    
}

//MARK: - Constraints

extension ViewController2 {
    func setupConstraints() {
        
        mainCollectionView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(100)
            maker.left.right.equalToSuperview().inset(10)
            maker.height.equalTo(100)
        }
    }
}

