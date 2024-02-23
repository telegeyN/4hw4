//
//  CustomTableViewCell.swift
//  4hw4
//
//  Created by Telegey Nurbekova on 22/02/24.
//

import UIKit

class CustomtTableViewCell: UITableViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.bold.size(20)
        label.textColor = .init(hex: "#000000")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regular.size(15)
        label.textColor = .init(hex: "#7F7F7F")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bgView)
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        bgView.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: bgView.topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 166)
        ])
        
        bgView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor)
        ])
        
        bgView.addSubview(quantityLabel)
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            quantityLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            quantityLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor)
        ])
    }
    
    func setData(image: String, name: String, quantity: String){
        logoImage.image = UIImage(named: image)
        nameLabel.text = name
        quantityLabel.text = quantity
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


