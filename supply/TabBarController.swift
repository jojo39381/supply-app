//
//  TabBarController.swift
//  supply
//
//  Created by Joseph Yeh on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser == nil {
            //show if not logged in
            print("lol")
            DispatchQueue.main.async {
                let loginController = LoginViewController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            
            return
        }
        setupViewControllers()
        
        // Do any additional setup after loading the view.
    }
        
    func setupViewControllers() {
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let first = HomeViewController();
        let navigation = UINavigationController(rootViewController:first);
        
        
        let second = PostingViewController();
        let secondNav = UINavigationController(rootViewController:second);
        
        let thirdNav = UINavigationController(rootViewController:userProfileController)
        
        
        
        
        self.viewControllers = [navigation, secondNav, thirdNav]
        self.tabBar.items![0].image = UIImage(named:"heart")
        self.tabBar.items![1].image = UIImage(named:"tag")
        self.tabBar.items![2].image = UIImage(named:"profile-heart")
         self.tabBar.items![0].title = "Supply"
         self.tabBar.items![1].title = "Listing"
         self.tabBar.items![2].title = "Profile"
        
        
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.barTintColor = .white
        
        
        
        
        
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        

    }
}
