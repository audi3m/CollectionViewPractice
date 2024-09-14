//
//  FilterCell.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/14/24.
//

import UIKit
import SnapKit

final class FilterCell: UICollectionViewCell {
    let roundedBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        return view
    }()
    let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit 
        return view
    }()
    let titleLabel = UILabel()
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        let size = contentView.systemLayoutSizeFitting(CGSize(width: attributes.frame.width, height: attributes.frame.height),
                                                       withHorizontalFittingPriority: .fittingSizeLevel,
                                                       verticalFittingPriority: .required)
        
        attributes.frame.size = size
        return attributes
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        contentView.addSubview(roundedBackground)
        roundedBackground.addSubview(iconView)
        roundedBackground.addSubview(titleLabel)
        
        roundedBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        iconView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(8)
            make.leading.equalToSuperview().offset(12)
            make.size.equalTo(20)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(12)
            make.verticalEdges.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
    
    func configureData(with filter: FilterItem) {
        iconView.image = UIImage(systemName: filter.image)
        titleLabel.text = filter.title
    }
}

