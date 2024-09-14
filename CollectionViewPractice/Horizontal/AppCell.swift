//
//  AppCell.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/14/24.
//

import UIKit
import SnapKit
import Kingfisher

final class AppCell: UICollectionViewCell {
    let logoView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.addArrangedSubview(nameLabel)
        view.addArrangedSubview(corpLabel)
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 2
        return label
    }()
    let corpLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        return label
    }()
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 16
        return button
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
        contentView.addSubview(logoView)
        contentView.addSubview(downloadButton)
        contentView.addSubview(stackView)
        
        logoView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.size.equalTo(60)
        }
        downloadButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoView)
            make.trailing.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(32)
        }
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(logoView.snp.trailing).offset(10)
            make.centerY.equalTo(logoView)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-10)
        }
    }
    
    func configureData(with app: Apps) {
        logoView.kf.setImage(with: URL(string: app.icon60))
        nameLabel.text = app.appTitle
        corpLabel.text = app.corpName
    }
}

