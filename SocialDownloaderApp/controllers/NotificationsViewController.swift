//
//  NotificationsViewController.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

import UIKit

class NotificationsViewController: UIViewController {

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var datasource: NotificationsCollectionViewDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = NotificationsCollectionViewDatasource(fetchDataModel())
        collectionView.dataSource = datasource
        collectionView.delegate = datasource
        collectionView.register(NotificationsDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: "NotificationsDescriptionCollectionViewCell")
        collectionView.register(NotificationsHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "NotificationsHeaderCollectionReusableView")
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchDataModel() -> [NotificationModel] {
        let descriptionModel1 = NotificationDescriptionModel(imageName: "instagram", friendName: "Shweta", notificationDescription: "mentioned you in a post", timeElapsed: "12 sec")
        let descriptionModel2 = NotificationDescriptionModel(imageName: "facebook", friendName: "Prashant", notificationDescription: "liked your status", timeElapsed: "5 mins")
        let notificationModel1 = NotificationModel(category: .new, descriptionItems: [descriptionModel1, descriptionModel2])
        
        let descriptionModel3 = NotificationDescriptionModel(imageName: "instagram", friendName: "Shweta", notificationDescription: "mentioned you in a post", timeElapsed: "12 sec")
        let descriptionModel4 = NotificationDescriptionModel(imageName: "facebook", friendName: "Prashant", notificationDescription: "liked your status", timeElapsed: "5 mins")
        let notificationModel2 = NotificationModel(category: .earlier, descriptionItems: [descriptionModel3, descriptionModel4])
        
        let descriptionModel5 = NotificationDescriptionModel(imageName: "instagram", friendName: "Shweta", notificationDescription: "tagged you in a video", timeElapsed: "yesterday at 12 AM")
        let descriptionModel6 = NotificationDescriptionModel(imageName: "facebook", friendName: "Prashant", notificationDescription: "accepted your friend request", timeElapsed: "4 day")
        let notificationModel3 = NotificationModel(category: .new, descriptionItems: [descriptionModel5, descriptionModel6])
        
        return [notificationModel1, notificationModel2, notificationModel3]
    }
    
}
