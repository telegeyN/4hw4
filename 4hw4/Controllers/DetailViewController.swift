//
//  DetailViewController.swift
//  4hw4
//
//  Created by Telegey Nurbekova on 22/02/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item: Item?
    
    private let logoImage = MakerView().makerImage()
    
    private let shareButton = MakerView().makerButton(backgroundColor: .white, image: UIImage(named: "share"))
    
    private let favoriteButton = MakerView().makerButton(backgroundColor: .white, image: UIImage(named: "heart"))
    
    private var isFavorite = false
    
    private let nameLabel = MakerView().makerLabel(font:Fonts.bold.size(22))
    
    private let ratingImage = MakerView().makerImage(imageName: "stars")
    
    private let priceLabel = MakerView().makerLabel(font:Fonts.bold.size(20), textColor: .init(hex: "#007AFF"))
    
    private let minusButton = MakerView().makerButton(title: "-")
    
    private let quantityLabel = MakerView().makerLabel(text: "0",font:Fonts.regular.size(20))
    
    private let plusButton = MakerView().makerButton(title: "+")
    
    private let detailsLabel = MakerView().makerLabel(text: "Product Details" ,font:Fonts.regular.size(20))
    
    private let settingsLabel = MakerView().makerLabel(text: "Room Type\nColor\nMaterial\nDimensions\nWeight", font: Fonts.light.size(15), textColor: .init(hex: "#333333", alpha: 0.5))
    
    private let getSettingLabel = MakerView().makerLabel(font: Fonts.light.size(15), textColor: .black)
    
    private let buyButton = MakerView().makerButton(backgroundColor: .init(hex: "#007AFF"), title: "Buy", titleColor: .white, titleFont: Fonts.bold.size(17))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDetails()
        setUpUI()
        
    }
    
    private func setUpDetails(){
        guard let item = item else { return }
        
        logoImage.image = UIImage(named: item.detailImage)
        nameLabel.text = item.detailName
        priceLabel.text = item.detailPrice
        getSettingLabel.text = item.detailSettings
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .white
        
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 375)
        ])
        
        view.addSubview(shareButton)
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 60),
            shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 272),
            shareButton.heightAnchor.constraint(equalToConstant: 36),
            shareButton.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        view.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: shareButton.centerYAnchor),
            favoriteButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 36),
            favoriteButton.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        favoriteButton.addTarget(self, action: #selector(favoritesTapped), for: .touchUpInside)
        favoriteButton.isUserInteractionEnabled = true
        
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(ratingImage)
        NSLayoutConstraint.activate([
            ratingImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            ratingImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ratingImage.heightAnchor.constraint(equalToConstant: 21),
            ratingImage.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        view.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: ratingImage.bottomAnchor,constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        view.addSubview(plusButton)
        NSLayoutConstraint.activate([
            plusButton.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            plusButton.heightAnchor.constraint(equalToConstant: 32),
            plusButton.widthAnchor.constraint(equalToConstant: 32)
        ])
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        view.addSubview(quantityLabel)
        NSLayoutConstraint.activate([
            quantityLabel.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            quantityLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10)
        ])
        
        view.addSubview(minusButton)
        NSLayoutConstraint.activate([
            minusButton.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
            minusButton.trailingAnchor.constraint(equalTo: quantityLabel.leadingAnchor, constant: -10),
            minusButton.heightAnchor.constraint(equalToConstant: 32),
            minusButton.widthAnchor.constraint(equalToConstant: 32)
        ])
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
        
        view.addSubview(detailsLabel)
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16)
            
        ])
        
        view.addSubview(settingsLabel)
        NSLayoutConstraint.activate([
            settingsLabel.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 10),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16)
        ])
        
        view.addSubview(getSettingLabel)
        NSLayoutConstraint.activate([
            getSettingLabel.centerYAnchor.constraint(equalTo: settingsLabel.centerYAnchor),
            getSettingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -26)
        ])
        
        
        
        view.addSubview(buyButton)
        NSLayoutConstraint.activate([
            buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            buyButton.widthAnchor.constraint(equalToConstant: 344)
            
        ])
    }
    
    
    @objc private func favoritesTapped(_ sender: UIButton) {
        print("tapped")
        isFavorite.toggle()
        let imageName = isFavorite ? "filledHeart" : "heart"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc private func plusButtonTapped(_ sender: UIButton) {
        if let quantity = Int(quantityLabel.text ?? "0") {
            quantityLabel.text = "\(quantity + 1)"
        }
    }
    
    @objc private func minusButtonTapped(_ sender: UIButton) {
        if let quantity = Int(quantityLabel.text ?? "0"), quantity > 0 {
            quantityLabel.text = "\(quantity - 1)"
        }
    }
    
    
}
