//
//  HorizontalCell.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import UIKit
import SnapKit
import Kingfisher

final class HorizontalCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true 
        view.backgroundColor = .red
        return view
    }()
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.backgroundColor = .systemGray3
        label.layer.cornerRadius = 10
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red.withAlphaComponent(0.2)
        configureImageCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabelCell() {
        contentView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureImageCell() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureData(string: String) {
        let url = URL(string: string)
        imageView.kf.setImage(with: url)
    }
    
    func configureData(text: String) {
        numberLabel.text = text
    }
}
