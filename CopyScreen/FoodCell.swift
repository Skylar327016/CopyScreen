//
//  FoodCell.swift
//  CopyScreen
//
//  Created by 陳家豪 on 2021/1/7.
//

import UIKit

class FoodCell: UITableViewCell {
    
    static let reuseId = "FoodCell"
    
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let foodImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        selectionStyle = .none
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(foodImageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -padding),
            foodImageView.widthAnchor.constraint(equalToConstant: 90),
            foodImageView.heightAnchor.constraint(equalTo: foodImageView.widthAnchor),
            foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: foodImageView.topAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: foodImageView.leadingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 24),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15)
        ])
        
        foodImageView.layer.cornerRadius = 10
        foodImageView.contentMode = .scaleAspectFill
        foodImageView.clipsToBounds = true
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    func set(food: Food) {
        nameLabel.text = food.foodName
        priceLabel.text = "₹\(food.foodPrice)"
        foodImageView.image = food.foodImage
    }
    
}
