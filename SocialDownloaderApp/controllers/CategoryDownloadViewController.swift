//
//  CategoryDownloadViewController.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

import UIKit

class CategoryDownloadViewController: UIViewController {

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var datasource: CategoryDownloadCollectionViewDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Category Download"
        setUpRightBarButtonItem()
        setUpLeftBarButtonItem()
        setUpCollectionView()
        
        datasource = CategoryDownloadCollectionViewDatasource(setUpModel())
        collectionView.dataSource = datasource
        collectionView.delegate = datasource
        collectionView.register(CategoryDownloadUICollectionViewCell.self, forCellWithReuseIdentifier: "CategoryDownloadUICollectionViewCell")
    }
    
    func setUpModel() -> [CategoryDownloadModel] {
        let item1 = CategoryDownloadModel(imageName: "instagram", socialMediaName: "Instagram", totalDownloadCount: "120")
        
        let item2 = CategoryDownloadModel(imageName: "tiktok", socialMediaName: "TikTok", totalDownloadCount: "36")
        
        let item3 = CategoryDownloadModel(imageName: "twitter", socialMediaName: "Twitter", totalDownloadCount: "12")
        let item4 = CategoryDownloadModel(imageName: "facebook", socialMediaName: "Facebook", totalDownloadCount: "331")
        
        let item5 = CategoryDownloadModel(imageName: "twitter", socialMediaName: "Twitter", totalDownloadCount: "12")
        let item6 = CategoryDownloadModel(imageName: "facebook", socialMediaName: "Facebook", totalDownloadCount: "331")
        
        return [item1, item2, item3, item4, item5, item6]
    }

    //TODO: This doesn't work. Status bar is not changing color. Need to figure out why..!!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setUpCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24.0),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24.0)
        ])
    }
    
    func setUpRightBarButtonItem() {
        let image = UIImage(systemName: "bell.badge")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(navigateToNotifications))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func navigateToNotifications() {
        print("Navigate to Notifications..!!!")
        let vc = NotificationsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //TODO: Change the height and width of the bar button
    func setUpLeftBarButtonItem() {
        let image = UIImage(systemName: "command.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(navigateToMenu))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc func navigateToMenu() {
        print("Navigate to Menu..!!!")
    }
}

