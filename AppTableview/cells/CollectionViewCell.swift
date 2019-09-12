//
//  CollectionViewCell.swift
//  AppTableview
//
//  Created by Denilson Monteiro on 30/08/19.
//  Copyright © 2019 Denilson Monteiro. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var circularBGLayer: CALayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
        backgroundColor = UIColor.clear
        circularBGLayer = CALayer()
        circularBGLayer.backgroundColor = UIColor.lightGray.cgColor
        layer.addSublayer(circularBGLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override var isSelected: Bool {
        didSet {
            labelTitre.textColor = isSelected ? UIColor.white : .gray
            backgroundColor = isSelected ? UIColor.gray : .white
            if isSelected {
                configureBorderSelected()
            } else {
                configureBorderNoSelected()
            }
            
        }
    }
    
    let labelTitre : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "Futura", size: 10.0)
        return label
    }()
    
    func configureBorderSelected() {
        layer.borderWidth = 1
        layer.cornerRadius = 18
        layer.borderColor = UIColor.gray.cgColor
    }
    
    func configureBorderNoSelected() {
        layer.borderWidth = 1
        layer.cornerRadius = 18
        layer.borderColor = UIColor.gray.cgColor
    }
    
    func configureRound() {
        layer.cornerRadius = 18
        layer.masksToBounds = true
    }
    
    func setupViews() {
        configureBorderNoSelected()
        addSubview(labelTitre)
        
        labelTitre.translatesAutoresizingMaskIntoConstraints = false
        
        // set constraints to use the label's intrinsic size for auto-sizing
        // we'll use 10 pts for left and right padding
        labelTitre.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        labelTitre.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        
        // center the label vertically (padding controlled by collectionView's layout estimated size
        labelTitre.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
