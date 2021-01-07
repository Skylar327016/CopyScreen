//
//  FoodInfoView.swift
//  CopyScreen
//
//  Created by 陳家豪 on 2021/1/7.
//

import UIKit

class FoodInfoView: UIView {
    
    let restaurantLabel = UILabel()
    let foodTagLabel = UILabel()
    let typeTagLabel = UILabel()
    let currencyLabel = UILabel()
    let timeLabel = UILabel()
    let rateLabel = UILabel()
    let rateImageView = UIImageView()
    let rateNumbers = UILabel()
    
    let padding: CGFloat = 20

    override init(frame: CGRect) {
        super.init(frame: frame)
        cofigureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createRoundedLabel(label: foodTagLabel)
        createRoundedLabel(label: typeTagLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createRoundedLabel(label: UILabel) {
        label.clipsToBounds = true
        label.layer.cornerRadius = foodTagLabel.bounds.height / 2
        label.layer.masksToBounds = true
    }
    
    private func cofigureUI(){
        addSubViews(views: restaurantLabel, foodTagLabel, typeTagLabel, currencyLabel, timeLabel, rateLabel, rateImageView, rateNumbers)
        
        NSLayoutConstraint.activate([
            restaurantLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            restaurantLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            restaurantLabel.heightAnchor.constraint(equalToConstant: 70),
            restaurantLabel.widthAnchor.constraint(equalToConstant: 227),
            
            foodTagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            foodTagLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 16),
            foodTagLabel.heightAnchor.constraint(equalToConstant: 16),
            foodTagLabel.widthAnchor.constraint(equalToConstant: 50),
            
            typeTagLabel.leadingAnchor.constraint(equalTo: foodTagLabel.trailingAnchor, constant: 4),
            typeTagLabel.topAnchor.constraint(equalTo: foodTagLabel.topAnchor),
            typeTagLabel.heightAnchor.constraint(equalToConstant: 16),
            typeTagLabel.widthAnchor.constraint(equalToConstant: 62),
            
            currencyLabel.leadingAnchor.constraint(equalTo: typeTagLabel.trailingAnchor, constant: 8),
            currencyLabel.centerYAnchor.constraint(equalTo: typeTagLabel.centerYAnchor),
            currencyLabel.heightAnchor.constraint(equalToConstant: 18),
            
            timeLabel.topAnchor.constraint(equalTo: foodTagLabel.bottomAnchor, constant: 23),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            timeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            rateLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 8),
            rateLabel.topAnchor.constraint(equalTo: timeLabel.topAnchor),
            rateLabel.heightAnchor.constraint(equalToConstant: 16),
            
            rateImageView.leadingAnchor.constraint(equalTo: rateLabel.trailingAnchor, constant: 2),
            rateImageView.centerYAnchor.constraint(equalTo: rateLabel.centerYAnchor),
            rateImageView.widthAnchor.constraint(equalToConstant: 13),
            rateImageView.widthAnchor.constraint(equalTo: rateImageView.heightAnchor),
            
            rateNumbers.leadingAnchor.constraint(equalTo: rateImageView.trailingAnchor, constant: 2),
            rateNumbers.topAnchor.constraint(equalTo: timeLabel.topAnchor),
            rateNumbers.heightAnchor.constraint(equalToConstant: 20),
            rateNumbers.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
        
        restaurantLabel.text = "Burger Singh Club - Sector 50"
        restaurantLabel.numberOfLines = 2
        restaurantLabel.font = UIFont.systemFont(ofSize: 24)
        
        foodTagLabel.clipsToBounds = true
        foodTagLabel.layer.cornerRadius = foodTagLabel.bounds.height / 2
        foodTagLabel.layer.masksToBounds = true
        foodTagLabel.backgroundColor = UIColor(red: 247/255, green: 205/255, blue: 207/255, alpha: 1)
        foodTagLabel.textColor = UIColor(red: 255/255, green: 53/255, blue: 65/255, alpha: 1)
        foodTagLabel.text = "Burger"
        foodTagLabel.font = UIFont.systemFont(ofSize: 10)
        foodTagLabel.textAlignment = .center
        
        typeTagLabel.clipsToBounds = true
        typeTagLabel.layer.cornerRadius = typeTagLabel.bounds.height / 2
        typeTagLabel.layer.masksToBounds = true
        typeTagLabel.backgroundColor = UIColor(red: 247/255, green: 205/255, blue: 207/255, alpha: 1)
        typeTagLabel.textColor = UIColor(red: 255/255, green: 53/255, blue: 65/255, alpha: 1)
        typeTagLabel.text = "American"
        typeTagLabel.font = UIFont.systemFont(ofSize: 10)
        typeTagLabel.textAlignment = .center
        
        currencyLabel.text = "₹₹"
        currencyLabel.font = UIFont.systemFont(ofSize: 12)
        
        timeLabel.text = "30-40 min"
        timeLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        rateLabel.text = "4.3"
        rateLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        rateImageView.image = Images.star
        
        rateNumbers.text = "(500+)"
        rateNumbers.textColor = .secondaryLabel
        rateNumbers.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
    }
}

extension FoodInfoView {
    func addSubViews(views: UIView...) {
        for view in views {
            self.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
