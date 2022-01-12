//
//  CategoryDownloadUICollectionViewCell.swift
//  SocialDownloaderApp
//
//  Created by Humney, Prashant on 12/01/22.
//

import UIKit

class CategoryDownloadUICollectionViewCell: UICollectionViewCell {
    var imageCircularView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.2
        view.layer.cornerRadius = 40.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "American Typewriter Bold", size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var downloadLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Total Download"
        label.font = UIFont(name: "American Typewriter", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var downloadCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "American Typewriter Bold", size: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //TODO: Try to create a collection view cell using custom init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.lightGray.cgColor
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(imageCircularView)
        imageCircularView.addSubview(imageView)
        addSubview(nameLabel)
        addSubview(downloadLabel)
        addSubview(downloadCountLabel)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            imageCircularView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageCircularView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageCircularView.widthAnchor.constraint(equalToConstant: 80.0),
            imageCircularView.heightAnchor.constraint(equalToConstant: 80.0)
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: imageCircularView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: imageCircularView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50.0),
            imageView.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageCircularView.bottomAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            downloadLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            downloadLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50)
        ])

        NSLayoutConstraint.activate([
            downloadCountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            downloadCountLabel.topAnchor.constraint(equalTo: downloadLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func renderCollectionViewCell(_ model: CategoryDownloadModel) {
        imageView.image = UIImage(named: model.imageName)
        nameLabel.text = model.socialMediaName
        downloadCountLabel.text = model.totalDownloadCount
    }
}
