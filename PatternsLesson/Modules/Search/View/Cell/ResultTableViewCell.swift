//
//  ResultTableViewCell.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class ResultTableViewCell: UITableViewCell {
    
    /// appearance-related constants
    private class Appearance {
        
        static let nameLabelNumberOfLines = 0
        static let imageViewWidth = 150
        static let imageViewHeight = 150
        
        static let placeholderImage = "googlemaps"
        
        static let resultImageViewLeftOffset = 16
        static let resultImageViewTopOffset = 16
        static let resultImageViewBottomOffset = -16
        
        static let nameLabelLeftOffset = 8
        static let nameLabelRightOffset = -8
        static let nameLabelTopOffset = 16
        
        static let ratingLabelLeftOffset = 8
        static let ratingLabelRightOffset = -8
        static let ratingLabelBottomOffset = -16
        
        static let imageCornerRadius: CGFloat = 10
    }
    
    lazy var resultImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Appearance.imageCornerRadius
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = Appearance.nameLabelNumberOfLines
        
        return label
    }()
    
    lazy var ratingLabel: UILabel = {
        
        let label = UILabel()
        
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(resultImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(ratingLabel)
        
        resultImageView.snp.makeConstraints { make in
            
            make.left.equalTo(contentView).offset(Appearance.resultImageViewLeftOffset)
            make.top.equalTo(contentView).offset(Appearance.resultImageViewTopOffset)
            make.bottom.equalTo(contentView).offset(Appearance.resultImageViewBottomOffset)
            make.width.equalTo(Appearance.imageViewWidth)
            make.height.equalTo(Appearance.imageViewHeight)
        }
        
        nameLabel.snp.makeConstraints { make in
            
            make.left.equalTo(resultImageView.snp.right).offset(Appearance.nameLabelLeftOffset)
            make.right.equalTo(contentView).offset(Appearance.nameLabelRightOffset)
            make.top.equalTo(contentView).offset(Appearance.nameLabelTopOffset)
        }
        
        ratingLabel.snp.makeConstraints { make in
            
            make.left.equalTo(resultImageView.snp.right).offset(Appearance.ratingLabelLeftOffset)
            make.right.equalTo(contentView).offset(Appearance.ratingLabelRightOffset)
            make.bottom.equalTo(contentView).offset(Appearance.ratingLabelBottomOffset)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with place: PlaceModel) {
        
        nameLabel.text = place.name
        ratingLabel.text = place.rating
        resultImageView.sd_setImage(with: URL(string: place.photoUrl), placeholderImage: UIImage(named: Appearance.placeholderImage))
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        resultImageView.sd_cancelCurrentImageLoad()
        
        resultImageView.image = nil
    }
}
