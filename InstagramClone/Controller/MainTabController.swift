//
//  MainTabController.swift
//  InstagramClone
//
//  Created by Yaser on 3/30/21.
//

import UIKit

class MainTabController: UITabBarController {

    //MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewControllers()
        
    }
    
    //MARK: -  Helpers
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func configureViewControllers() {
        let layout = UICollectionViewFlowLayout()
        let feed = setVCForTabItems(vc: FeedViewController(collectionViewLayout: layout), selectedImage: UIImage(systemName: "house.fill"), unselectedImage: UIImage(systemName: "house"))
        let search = setVCForTabItems(vc: SearchViewController(), selectedImage: UIImage(systemName: "magnifyingglass"), unselectedImage: UIImage(systemName: "magnifyingglass"))
        let imageSelector = setVCForTabItems(vc: ImageSelectorViewController(), selectedImage: UIImage(systemName: "plus.circle.fill"), unselectedImage: UIImage(systemName: "plus.circle"))
        let notification = setVCForTabItems(vc: NotificationViewController(), selectedImage: UIImage(systemName: "suit.heart.fill"), unselectedImage: UIImage(systemName: "suit.heart"))
        let profile = setVCForTabItems(vc: ProfileViewController(), selectedImage: UIImage(systemName: "person.fill"), unselectedImage: UIImage(systemName: "person"))
        
        viewControllers = [feed, search, imageSelector, notification, profile]
        
        tabBar.tintColor = .black
    }
    
    func setVCForTabItems(vc: UIViewController, selectedImage: UIImage?, unselectedImage: UIImage?) -> UIViewController {
        vc.tabBarItem.selectedImage = selectedImage
        vc.tabBarItem.image = unselectedImage
        
        return vc
    }
}
