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
        label.font = UIFont(name: "American Typewriter", size: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var arrowButton: UIButton  = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.down")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(arrowButton)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            arrowButton.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 10),
            arrowButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func renderViews(_ category: NotificationCategoryEnum) {
        title.text = "category"
    }
}
