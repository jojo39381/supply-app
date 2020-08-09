//
//  FormCell.swift
//  supply
//
//  Created by Joseph Yeh on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import UIKit

protocol FormDelegate {
    func addToDonation(key: String, description: String)
}
class FormCell: UITableViewCell, UITextFieldDelegate{

    
  
    
    var delegate: FormDelegate?
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Form"
        label.textColor = .black
        return label
    }()
    var input: UITextField = {
        let tf = UITextField()
        
        return tf
        
    }()
    
    @objc func textFieldEditing() {
        delegate?.addToDonation(key:titleLabel.text!.lowercased(), description: input.text!)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        input.delegate = self
        input.addTarget(self, action: #selector(textFieldEditing), for: .editingChanged)
        self.addSubview(titleLabel)
        self.addSubview(input)
        titleLabel.anchor(top: self.topAnchor, left: self.leftAnchor, bottom:self.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 120, height: 0)
        input.anchor(top: self.topAnchor, left: titleLabel.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}
