//
//  SimpleListViewController.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import UIKit
import SnapKit

final class SimpleListViewController: UIViewController {
    
    enum Section: CaseIterable {
        case main
        case sub
    }

    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureNavBar()
        configureView()
        configureDataSource()
    }
}

extension SimpleListViewController {
    
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<AllTypeCell, Item> { (cell, indexPath, item) in
            cell.configureData(with: item)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Item) -> AllTypeCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
        
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(Dummy.items, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

extension SimpleListViewController {
    
    @objc private func plusButtonClicked() {
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.appendItems([Item.typeA(.init(name: "New A"))], toSection: .sub)
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    private func deleteItem(_ item: Item) {
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.deleteItems([item])
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
}

// Configure
extension SimpleListViewController {
    
    private func cofigureNavBar() {
        navigationItem.title = "Simple List"
        let plus = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
        navigationItem.rightBarButtonItems = [plus]
    }
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

extension SimpleListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = dataSource.itemIdentifier(for: indexPath) {
            deleteItem(item)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
