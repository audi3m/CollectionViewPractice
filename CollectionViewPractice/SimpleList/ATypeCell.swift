//
//  ATypeCell.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import UIKit
import SnapKit

final class AllTypeCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
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
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func configureData(with item: PracticeItem) {
        switch item {
        case .typeA(let itemA):
            titleLabel.text = itemA.name
            titleLabel.textAlignment = .left
        case .typeB(let itemB):
            titleLabel.text = itemB.name
            titleLabel.textAlignment = .right
        }
    }
}
