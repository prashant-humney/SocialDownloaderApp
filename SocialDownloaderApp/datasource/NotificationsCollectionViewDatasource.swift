//
//  NotificationsCollectionViewDatasource.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

import UIKit

class NotificationsCollectionViewDatasource: NSObject {

    var items: [NotificationModel] = []
    
    init(_ items: [NotificationModel]) {
        self.items = items
    }
}

extension NotificationsCollectionViewDatasource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].descriptionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotificationsDescriptionCollectionViewCell", for: indexPath) as? NotificationsDescriptionCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        collectionViewCell.layer.cornerRadius = 20.0
        collectionViewCell.layer.borderWidth = 0.25
        collectionViewCell.layer.borderColor = UIColor.lightGray.cgColor
        collectionViewCell.renderCollectionViewCell(items[indexPath.section].descriptionItems[indexPath.row])
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "NotificationsHeaderCollectionReusableView", for: indexPath) as? NotificationsHeaderCollectionReusableView else {
                return UICollectionReusableView()
            }
            
            headerView.title.text = "New"
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
}

extension NotificationsCollectionViewDatasource: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 32.0
        let height: CGFloat = 65
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50.0)
    }
}
