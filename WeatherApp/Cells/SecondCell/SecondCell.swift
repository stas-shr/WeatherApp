//
//  SecondCell.swift
//  WeatherApp
//
//  Created by Стас on 22.02.2024.
//

import UIKit

class SecondCell: UITableViewCell {

    var mainImageView = UIImageView()
    var mainTitleLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainImageView)
        addSubview(mainTitleLabel)
        self.backgroundColor = .blue
        
        configureImageView()
        configureTitleLabel()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        mainImageView.layer.cornerRadius = 10
        mainImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        mainTitleLabel.numberOfLines = 0
        mainTitleLabel.adjustsFontSizeToFitWidth = true
        mainTitleLabel.textAlignment = .center
    }
    
    func set(model: Model) {
        mainImageView.image = model.image
        mainTitleLabel.text = model.title
    }
    
    
}

//MARK: - Constraints

extension SecondCell {
    func setupConstraints() {
        // картинка
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        // текст
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(10)
            make.centerX.bottom.equalToSuperview()
        }
        
    }
}
