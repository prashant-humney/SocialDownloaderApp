//
//  CategoryDownloadCollectionViewDatasource.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

import Foundation
import UIKit

class CategoryDownloadCollectionViewDatasource: NSObject, UICollectionViewDataSource {
    
    var items: [CategoryDownloadModel] = []
    
    init(_ items: [CategoryDownloadModel]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryDownloadUICollectionViewCell", for: indexPath) as? CategoryDownloadUICollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.renderCollectionViewCell(items[indexPath.row])
        cell.layer.cornerRadius = 20
        return cell
    }
}

extension CategoryDownloadCollectionViewDatasource: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.size.width/2 - 13
        let height: CGFloat = collectionView.frame.size.height/3

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}
