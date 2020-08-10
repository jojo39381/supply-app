//
//  PostingViewController.swift
//  supply
//
//  Created by Joseph Yeh on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import UIKit

class PostingViewController: UIViewController {

    
    
    
    
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ready to create a listing?"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize:30)
        return label
    }()
    
    var choice: UILabel = {
        let label = UILabel()
        label.text = "I would like to"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    var donateButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"donate-big"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.tag = 0
        return button
    }()
    var requestButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"request-big"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.tag = 1
        
        return button
    }()
    
    var dLabel: UILabel = {
        let label = UILabel()
        label.text = "Donate"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var rLabel: UILabel = {
           let label = UILabel()
           label.text = "Request"
            label.textAlignment = .center
        label.textColor = .white
           return label
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Listing"
        let sub = HorizontalView(frame:self.view.safeAreaLayoutGuide.layoutFrame)
        sub.addSubview(donateButton)
        sub.addSubview(requestButton)
        sub.addSubview(titleLabel)
        sub.addSubview(choice)
        sub.addSubview(dLabel)
        sub.addSubview(rLabel)
        
        sub.addConstraintsWithFormat(format: "H:[v0(100)]", views: donateButton)
        sub.addConstraintsWithFormat(format: "V:[v0(100)]", views: donateButton)
        sub.addConstraintsWithFormat(format: "H:[v0(100)]", views: requestButton)
        sub.addConstraintsWithFormat(format: "V:[v0(100)]", views: requestButton)
        sub.addConstraintsWithFormat(format: "H:[v0(100)]", views: dLabel)
        sub.addConstraintsWithFormat(format: "V:[v0(100)]", views: dLabel)
        sub.addConstraintsWithFormat(format: "H:[v0(100)]", views: rLabel)
        sub.addConstraintsWithFormat(format: "V:[v0(100)]", views: rLabel)
        
        
        titleLabel.anchor(top: sub.topAnchor, left: sub.leftAnchor, bottom: nil, right: sub.rightAnchor, paddingTop: 200, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        choice.anchor(top: titleLabel.bottomAnchor, left: sub.leftAnchor, bottom: nil, right: sub.rightAnchor, paddingTop: 100  , paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        sub.addConstraint(NSLayoutConstraint(item: donateButton, attribute: .centerX, relatedBy: .equal, toItem: sub, attribute: .centerX, multiplier: 1, constant:-100))
        sub.addConstraint(NSLayoutConstraint(item: donateButton, attribute: .centerY, relatedBy: .equal, toItem: sub, attribute: .centerY, multiplier: 1, constant: 0))
        sub.addConstraint(NSLayoutConstraint(item: requestButton, attribute: .centerX, relatedBy: .equal, toItem: sub, attribute: .centerX, multiplier: 1, constant:100))
        sub.addConstraint(NSLayoutConstraint(item: requestButton, attribute: .centerY, relatedBy: .equal, toItem: sub, attribute: .centerY, multiplier: 1, constant: 0))
        sub.addConstraint(NSLayoutConstraint(item: dLabel, attribute: .centerX, relatedBy: .equal, toItem: sub, attribute: .centerX, multiplier: 1, constant:-100))
        sub.addConstraint(NSLayoutConstraint(item: dLabel, attribute: .centerY, relatedBy: .equal, toItem: sub, attribute: .centerY, multiplier: 1, constant: 100))
        sub.addConstraint(NSLayoutConstraint(item: rLabel, attribute: .centerX, relatedBy: .equal, toItem: sub, attribute: .centerX, multiplier: 1, constant:100))
        sub.addConstraint(NSLayoutConstraint(item: rLabel, attribute: .centerY, relatedBy: .equal, toItem: sub, attribute: .centerY, multiplier: 1, constant: 100))
        
       
        self.view.addSubview(sub)
        donateButton.addTarget(self, action: #selector(postItem(_:)), for: .touchUpInside)
        requestButton.addTarget(self, action: #selector(postItem(_:)), for: .touchUpInside)
        donateButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        donateButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        donateButton.layer.shadowOpacity = 1.0
        donateButton.layer.shadowRadius = 2
        donateButton.layer.masksToBounds = false
        donateButton.layer.cornerRadius = 15
        donateButton.clipsToBounds = false
        requestButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        requestButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        requestButton.layer.shadowOpacity = 1.0
        requestButton.layer.shadowRadius = 2
        requestButton.layer.masksToBounds = false
        requestButton.layer.cornerRadius = 15
        requestButton.clipsToBounds = false
    
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    
    @objc func postItem(_ sender: UIButton) {
        print(sender.tag)
        if sender.tag == 0 {
            let informationViewController = InformationViewController()
            self.navigationController?.present(informationViewController, animated: true, completion: nil)
        }
        else {
            let requestViewController = RequestViewController()
           
            self.navigationController?.present(requestViewController, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
    */

}







class HorizontalView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let topRect = CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height/2)
        UIColor.rgb(red: 220, green: 203, blue: 216).set()
        guard let topContext = UIGraphicsGetCurrentContext() else { return }
        topContext.fill(topRect)

        let bottomRect = CGRect(x: 0, y: rect.size.height/2, width: rect.size.width, height: rect.size.height/2)
        UIColor.rgb(red: 85, green: 72, blue: 135).set()
        guard let bottomContext = UIGraphicsGetCurrentContext() else { return }
        bottomContext.fill(bottomRect)
    }
}
