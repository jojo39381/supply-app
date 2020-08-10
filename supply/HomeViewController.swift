//
//  FirstViewController.swift
//  supply
//
//  Created by Michael Zhu on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import UIKit
import SwiftUI
class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, FeedDelegate{
    func presentView(donation: Donation) {
        print("haha")
        let hostingController = UIHostingController(rootView: DonationDetail(donation:donation))
        self.navigationController?.present(hostingController, animated: true, completion: nil)
    }
    
    func presentRequestView(request: Request) {
        print("haha")
        let hostingController = UIHostingController(rootView: RequestDetail(request:request))
        self.navigationController?.present(hostingController, animated: true, completion: nil)
    }
    
    var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    var categoryView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        
        stackView.distribution = .fillEqually

        
        return stackView
    }()
    
    func makeButton(backgroundColor: UIColor, name:String) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = backgroundColor
        button.tintColor = .black
        
        button.setImage(UIImage(named:name)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 2
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 15
        button.clipsToBounds = false
        
        return button
    }
    
    var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.searchBarStyle = .minimal
    
        
        
        
        return sb
    }()
    
    
    
    
    var toggleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.backgroundColor = .white
        return cv
    }()
   
    let sub: UIView = {
        let view = UIView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.backgroundColor = UIColor.rgb(red: 85, green: 72, blue: 135)
        self.title = "Supply"
    
       let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = .white
        sub.backgroundColor = UIColor.rgb(red: 85, green: 72, blue: 135)
        sub.layer.cornerRadius = 15
        sub.addSubview(categoryView)
        sub.addSubview(searchBar)
        sub.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: categoryView)
        sub.addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: searchBar)
        sub.addConstraintsWithFormat(format: "V:|-10-[v0]-20-[v1]-|", views: categoryView, searchBar)
        self.view.addSubview(sub)
        sub.anchor(top: self.topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 140)
          setupMenuBar()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 85, green: 72, blue: 135)
        self.navigationController?.navigationBar.isTranslucent = false
        setupCollection()
        setupStack()

    }
    func setupStack() {
        let button1 = makeButton(backgroundColor: UIColor.rgb(red: 255, green: 99, blue: 99), name: "medical")
        let button2 = makeButton(backgroundColor: UIColor.rgb(red: 203, green: 255, blue: 194), name: "hands")
        let button3 = makeButton(backgroundColor: UIColor.rgb(red: 165, green: 239, blue: 255), name: "water")
        let button4 = makeButton(backgroundColor: UIColor.rgb(red: 255, green: 205, blue: 241), name: "food")
        let button5 = makeButton(backgroundColor: UIColor.rgb(red: 253, green: 255, blue: 140), name: "shirt")
        categoryView.addArrangedSubview(button1)
        categoryView.addArrangedSubview(button2)
        
        categoryView.addArrangedSubview(button3)
        categoryView.addArrangedSubview(button4)
        categoryView.addArrangedSubview(button5)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ajsdlasd")
        super.viewWillAppear(true)
       self.toggleCollectionView.reloadData()
      

    }

    
    
    func setupCollection() {
        self.view.addSubview(toggleCollectionView)
        toggleCollectionView.anchor(top: menuBar.bottomAnchor , left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        toggleCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: "myCell")
        toggleCollectionView.delegate = self
        toggleCollectionView.dataSource = self
    }
    
    
    
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        
        
        view.addSubview(menuBar)
        menuBar.anchor(top: sub.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft:50, paddingBottom: 0, paddingRight:-50, width: 0, height: 50)
        
       
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        menuBar.horizontalBarLeftAnchorConstraint?.constant = abs(scrollView.contentOffset.x) / 2.7
        
        
    
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
       
    }
    
    
    func setupSegment() {
        
       
        
    }
    var colorArray = [UIColor.rgb(red:85, green:72, blue:135), UIColor.rgb(red: 220, green: 203, blue: 216)]
    var textColors = [UIColor.white, UIColor.black]
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        toggleCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        self.view.backgroundColor = colorArray[menuIndex]
        self.sub.backgroundColor = colorArray[menuIndex]
       
        self.navigationController?.navigationBar.barTintColor = colorArray[menuIndex]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: textColors[indexPath.item]]
    }
    

}



extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! FeedCell
        cell.delegate = self
        cell.backgroundColor = .white
        cell.collectionView.reloadData()
        if (indexPath.item == 0) {
            cell.type = "Donation"
        }
        else {
            cell.type = "Request"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height:collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}
