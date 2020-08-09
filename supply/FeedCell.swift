//
//  FeedCell.swift
//  youtube
//
//  Created by Brian Voong on 10/15/18.
//  Copyright © 2018 letsbuildthatapp. All rights reserved.
//

import UIKit
protocol FeedDelegate {
    func presentView(donation:Donation)
    func presentRequestView(request: Request)
}
class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var type = "Donation"
    
    var delegate: FeedDelegate?
    let cellId = "cellId"
    let donationID = "donationID"
    
    override func setupViews() {
        super.setupViews()
        
       
        
        
        
        
        
        collectionView.contentInset = .init(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = .init(top: 50, left: 0, bottom: 0, right: 0)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(DonationCell.self, forCellWithReuseIdentifier: donationID)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if type == "donation" {
            return requestData.count
        }
        else {
            return donationData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type == "Donation" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemCell
            cell.backgroundColor = .white
            let item = requestData[indexPath.item]
            cell.itemLabel.text = item.item
            cell.locationLabel.text = item.city + ", " + item.state
            cell.nameDes.text = item.nameDes
            cell.name.text = item.name
            cell.itemDescription.text = item.itemDes
            return cell
        }
        
        
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: donationID, for: indexPath) as! DonationCell
            cell.backgroundColor = .white
            let item = donationData[indexPath.item]
            cell.itemLabel.text = item.item
            cell.locationLabel.text = item.city + ", " + item.state
            cell.nameDes.text = item.nameDes
            cell.name.text = item.name
            cell.itemDescription.text = item.itemDes
            if item.imageName != "" {
                print(item.imageName)
                let image1 = UIImage(named: item.imageName + ".jpg")
                cell.imageView.image = image1
            }
            else {
                let url = URL(string:item.url)!
                if let data = try? Data(contentsOf: url)
                {
                    let image: UIImage = UIImage(data: data)!
                    cell.imageView.image = image
                }
            }
            return cell
           

        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = frame.width/2.5
        if type != "Donation" {
            height = frame.width/1
        }
       
        return .init(width: frame.width - 50, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if type != "Donation" {
            delegate?.presentView(donation: donationData[indexPath.item])
        }
        else {
            delegate?.presentRequestView(request: requestData[indexPath.item])
            
        }
        
    }
    
    
}
