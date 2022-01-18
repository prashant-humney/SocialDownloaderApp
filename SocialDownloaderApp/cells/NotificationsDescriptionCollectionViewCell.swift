//
//  NotificationsDescriptionCollectionViewCell.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

import UIKit

class NotificationsDescriptionCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var durationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "American Typewriter", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var heightConstraintOfTitleLabel: NSLayoutConstraint = {
        let constraint = NSLayoutConstraint()
        return constraint
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(durationLabel)
        setUpConstraints()
    }
    
    //TODO: Calculate dynamic height of the Title Label
    private func setUpConstraints() {
        //if titleLabel
        heightConstraintOfTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            durationLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            durationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            durationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func renderCollectionViewCell(_ model: NotificationDescriptionModel) {
        imageView.image = UIImage(named: model.imageName)
        titleLabel.attributedText = getAttributedString(model)
        durationLabel.text = model.timeElapsed
    }
    
    private func getAttributedString(_ model: NotificationDescriptionModel) -> NSMutableAttributedString {
        let boldFontAttribute: [NSAttributedString.Key : UIFont] = [NSAttributedString.Key.font: UIFont(name: "American Typewriter Bold", size: 16)!]
        let regularFontAttribute: [NSAttributedString.Key : UIFont] = [NSAttributedString.Key.font: UIFont(name: "American Typewriter", size: 14)!]
        let boldText = NSAttributedString(string: model.friendName, attributes: boldFontAttribute)
        let regularStr = " " + model.notificationDescription
        let regularText = NSAttributedString(string: regularStr, attributes: regularFontAttribute)
        let str = NSMutableAttributedString()
        str.append(boldText)
        str.append(regularText)
        
        return str
        
    }
}
