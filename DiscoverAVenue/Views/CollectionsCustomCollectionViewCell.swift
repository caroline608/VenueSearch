//
//  CollectionsCustomCollectionViewCell.swift
//  DiscoverAVenue
//
//  Created by Richard Crichlow on 1/19/18.
//  Copyright © 2018 Caroline Cruz. All rights reserved.
//

import UIKit
import SnapKit

class CollectionsCustomCollectionViewCell: UICollectionViewCell {
    
    lazy var collectionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "placeholder")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var collectionNameLabel: UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        return label
    }()
    
    //lazy var spinner:
    
    //lazy var a round imageview that has a plus button in it.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        addSubview(collectionImageView)
        addSubview(collectionNameLabel)
        setupVenueImageView()
    }
    
    private func setupVenueImageView() {
        
        collectionImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(self.snp.height).multipliedBy(0.85)
        }
        
        collectionNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(collectionImageView.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(self.snp.height).multipliedBy(0.15)
        }
        
    }
    
    
    
}
