//
//  ResultCell.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import SDWebImage

class ResultCell: UITableViewCell {

    /// UI elements
    private let placeImageView = UIImageView(cornerRadius: 10).enableConstraints()
    private let placeTitle = UILabel(fontSize: 18, textColor: .black).enableConstraints()
    private let ratingTitle = UILabel(fontSize: 14, textColor: .gray).enableConstraints()
    
    /// Constants for size & interval
    private let placeImageViewSize = CGSize(width: 100, height: 100)
    private let interval: CGFloat = 20
    private let labelHeight: CGFloat = 30
    private let cellHeight: CGFloat = 120
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(placeImageView)
        addSubview(placeTitle)
        addSubview(ratingTitle)
        
        initConstraints()
    }
    
    /// Method which initialize constraints
    private func initConstraints() {
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: cellHeight),
            
            placeImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            placeImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: interval),
            placeImageView.widthAnchor.constraint(equalToConstant: placeImageViewSize.width),
            placeImageView.heightAnchor.constraint(equalToConstant: placeImageViewSize.height),
            
            placeTitle.topAnchor.constraint(equalTo: topAnchor, constant: interval),
            placeTitle.leftAnchor.constraint(equalTo: placeImageView.rightAnchor, constant: interval),
            placeTitle.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
    }
    
    /// Method which configure cell with data
    /// - Parameter place: model to configure 
    func configure(with place: Place) {
        
        placeImageView.sd_setImage(with: URL(string: place.photoUrl), placeholderImage: #imageLiteral(resourceName: "place"))
        placeTitle.text = place.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
