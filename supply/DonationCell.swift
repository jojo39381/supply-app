//
//  ItemCell.swift
//  supply
//
//  Created by Joseph Yeh on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import UIKit




class DonationCell: BaseCell {
    
    var itemLabel : UILabel = {
        let label = UILabel()
        label.text = "Masks"
        label.textColor = .black
    
        return label
    }()
    
    var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Chico, Ca"
        label.textColor = .gray
        return label
    }()
    
    var profile : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named:"profile"), for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.text = "Joseph Yeh"
        return label
    }()
    
    var nameDes : UILabel = {
        let label = UILabel()
        label.text = "Healthcare Partner"
        label.font = label.font.withSize(12)
        return label
    }()
    
    var itemDescription: UILabel = {
        let label = UILabel()
        label.text = "aksjdbalskdbkhajsndabkjsdlnabksdnljkakbsjdlnkakbsdnksjdbakjdbkjabsdjabsdlabsdlbasldjbalsdbaksjdbalkdblakbsdnlaknsdlakhsbd"
        label.numberOfLines = 2
        label.font = label.font.withSize(12)
        label.textColor = .gray
        return label
    }()
    
    
    let stack : UIStackView = {
        let sv = UIStackView()
        sv.alignment = .center
        sv.distribution = .fill
        return sv
    }()
    
    var imageView: UIImageView = {
        let imagev = UIImageView()
        
        imagev.image = UIImage(named:"silversalmoncreek.jpg")
        return imagev
    }()
    override func setupViews() {
        super.setupViews()
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        self.backgroundColor = .red
        self.addSubview(itemLabel)
        self.addSubview(locationLabel)
        self.addSubview(profile)
        self.addSubview(name)
        self.addSubview(nameDes)
        self.addSubview(stack)
        self.addSubview(itemDescription)
        self.addSubview(imageView)
        stack.addArrangedSubview(profile)
        let sv2 = UIStackView()
        profile.widthAnchor.constraint(equalToConstant:30).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        sv2.alignment = .fill
        sv2.distribution = .fill
        sv2.axis = .vertical
        sv2.addArrangedSubview(name)
        sv2.addArrangedSubview(nameDes)
        stack.addArrangedSubview(sv2)
        stack.spacing = 20
       
        
        
        itemLabel.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft:20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        locationLabel.anchor(top: itemLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        imageView.anchor(top: locationLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 200)
        
        stack.anchor(top: imageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 0)
        itemDescription.anchor(top: stack.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 0)
        
       
        
        
        
        
        
        
        
        
        
        self.layer.cornerRadius = 15
    }
    
    
    
    
    
    
    
    
    
    
}


