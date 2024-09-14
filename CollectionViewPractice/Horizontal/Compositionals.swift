//
//  Compositionals.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import Foundation

enum AppStoreSection: CaseIterable {
    case filterSection
    case popularSection
    case freeSection
    case todoSection
}

enum SectionItem: Hashable {
    case filter(FilterItem)
    case popular(Apps)
    case free(Apps)
    case todo(Todo)
}

struct FilterItem: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
}

struct Todo: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let date: Date
}


