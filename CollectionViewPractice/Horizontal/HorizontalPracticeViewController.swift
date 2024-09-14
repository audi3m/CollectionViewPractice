//
//  HorizontalPracticeViewController.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import UIKit
import SnapKit

final class HorizontalPracticeViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<AppStoreSection, SectionItem>! = nil
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

extension HorizontalPracticeViewController {
    
    private func configureDataSource() {
        
        let filterCellRegistration = UICollectionView.CellRegistration<FilterCell, SectionItem> { (cell, indexPath, item) in
            if case let .filter(filterItem) = item {
                cell.configureData(with: filterItem)
            }
        }
        
        let popularCellRegistration = UICollectionView.CellRegistration<EventCell, SectionItem> { (cell, indexPath, item) in
            if case let .popular(appsItem) = item {
                cell.configureData(with: appsItem)
            }
        }
        
        let freeCellRegistration = UICollectionView.CellRegistration<AppCell, SectionItem> { (cell, indexPath, item) in
            if case let .free(appsItem) = item {
                cell.configureData(with: appsItem)
            }
        }
        
        let todoCellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, SectionItem> { (cell, indexPath, item) in
            if case let .todo(todoItem) = item {
                var content = UIListContentConfiguration.cell()
                content.text = todoItem.title
                content.secondaryText = todoItem.date.formatted()
                content.secondaryTextProperties.color = .secondaryLabel
                cell.contentConfiguration = content
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource<AppStoreSection, SectionItem>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: SectionItem) -> UICollectionViewCell? in
            switch identifier {
            case .filter:
                return collectionView.dequeueConfiguredReusableCell(using: filterCellRegistration, for: indexPath, item: identifier)
            case .popular:
                return collectionView.dequeueConfiguredReusableCell(using: popularCellRegistration, for: indexPath, item: identifier)
            case .free:
                return collectionView.dequeueConfiguredReusableCell(using: freeCellRegistration, for: indexPath, item: identifier)
            case .todo:
                return collectionView.dequeueConfiguredReusableCell(using: todoCellRegistration, for: indexPath, item: identifier)
            }
            
        }
        
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<AppStoreSection, SectionItem>()
        snapshot.appendSections(AppStoreSection.allCases)
        
        let filterItems = Dummy.filters.map { SectionItem.filter($0) }
        let popularItems = Dummy.apps.suffix(4).map { SectionItem.popular($0) }
        let freeItems = Dummy.apps.map { SectionItem.free($0) }
        let todoItems = Dummy.todos.map { SectionItem.todo($0) }
        
        snapshot.appendItems(filterItems, toSection: .filterSection)
        snapshot.appendItems(popularItems, toSection: .popularSection)
        snapshot.appendItems(freeItems, toSection: .freeSection)
        snapshot.appendItems(todoItems, toSection: .todoSection)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension HorizontalPracticeViewController {
    
    @objc private func plus1ButtonClicked() {
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.appendItems([.filter(.init(image: "car", title: "자동차"))], toSection: .filterSection)
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    @objc private func plus2ButtonClicked() {
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.appendItems([.popular(Dummy.apps[6])], toSection: .popularSection)
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    @objc private func plus3ButtonClicked() {
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.appendItems([.free(Dummy.apps[7])], toSection: .freeSection)
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    @objc private func plus4ButtonClicked() {
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.appendItems([.todo(.init(title: "추가하기", date: .now))], toSection: .todoSection)
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    private func deleteItem(_ item: SectionItem) {
        var currentSnapshot = dataSource.snapshot()
        currentSnapshot.deleteItems([item])
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
}

// Configure
extension HorizontalPracticeViewController {
    
    private func cofigureNavBar() {
        navigationItem.title = "App Store"
        let plus1 = UIBarButtonItem(image: UIImage(systemName: "1.circle"), style: .plain, target: self, action: #selector(plus1ButtonClicked))
        let plus2 = UIBarButtonItem(image: UIImage(systemName: "2.circle"), style: .plain, target: self, action: #selector(plus2ButtonClicked))
        let plus3 = UIBarButtonItem(image: UIImage(systemName: "3.circle"), style: .plain, target: self, action: #selector(plus3ButtonClicked))
        let plus4 = UIBarButtonItem(image: UIImage(systemName: "4.circle"), style: .plain, target: self, action: #selector(plus4ButtonClicked))
        navigationItem.rightBarButtonItems = [plus1, plus2]
        navigationItem.leftBarButtonItems = [plus3, plus4]
    }
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = AppStoreSection.allCases[sectionIndex]
            
            switch section {
            case .filterSection:
                return self.filterSection()
            case .popularSection:
                return self.popularSection()
            case .freeSection:
                return self.freeSection()
            case .todoSection:
                return self.todoSection(layoutEnvironment: layoutEnvironment)
            }
        }
    }
}

// Section Layout
extension HorizontalPracticeViewController {
    
    // 필터
    private func filterSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(36))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 10, leading: 20, bottom: 30, trailing: 20)
        section.interGroupSpacing = 10
        
        return section
    }
    
    // 큰 사이즈
    private func popularSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = .init(top: 0, leading: 20, bottom: 30, trailing: 20)
        section.interGroupSpacing = 10
        
        return section
    }
    
    // 작은 사이즈
    private func freeSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85),
                                                                                        heightDimension: .absolute(200)),
                                                     subitem: item, count: 3)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .init(top: 30, leading: 20, bottom: 30, trailing: 20)
        section.interGroupSpacing = 20
        
        return section
    }
    
    // 할 일
    private func todoSection(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let section = NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
        section.contentInsets = .init(top: 30, leading: 20, bottom: 30, trailing: 20)
        return section
    }
}

extension HorizontalPracticeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = dataSource.itemIdentifier(for: indexPath) {
            deleteItem(item)
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
