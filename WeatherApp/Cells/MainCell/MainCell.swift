//
//  MainCell.swift
//  WeatherApp
//
//  Created by Стас on 22.02.2024.
//
// изучить collectionView
// в collectionView добавить 2 секции
// в первой секции 1 ячейка (покрасить в зеленый)
// во второй секции сделать 10 ячееек горизонтально сделать spacing 5 и покрасить в серый


import UIKit
import SnapKit

class MainCell: UITableViewCell {
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var mainCollectionView: MainCollectionView = {
        let collectionView = MainCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainImageView)
        addSubview(mainTitleLabel)
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(mainCollectionView)
        self.backgroundColor = .red
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(model: Model) {
        mainImageView.image = model.image
        mainTitleLabel.text = model.title
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        // view для слайдера с картами
        let b = UIView()
        b.backgroundColor = .yellow
        mainStackView.addArrangedSubview(b)
        b.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        mainCollectionView.snp.makeConstraints { make in
            make.width.equalToSuperview() // or specific value
        }
    }
}

