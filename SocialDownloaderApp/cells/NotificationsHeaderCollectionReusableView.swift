//
//  NotificationsHeaderCollectionReusableView.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

import UIKit

class NotificationsHeaderCollectionReusableView: UICollectionReusableView {
    var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "New"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(title)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    func renderViews(_ category: NotificationCategoryEnum) {
        title.text = "category"
    }
}
