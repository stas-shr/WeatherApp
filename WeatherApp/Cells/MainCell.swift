//
//  MainCell.swift
//  WeatherApp
//
//  Created by Стас on 22.02.2024.
//

import UIKit

class MainCell: UITableViewCell {

    var mainImageView = UIImageView()
    var mainTitleLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainImageView)
        addSubview(mainTitleLabel)
        self.backgroundColor = .red
        
        
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
    
    func setupConstraints() {
        // картинка
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor),
            mainImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 140),
            mainImageView.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        // текст
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTitleLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10),
            mainTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            mainTitleLabel.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
}
