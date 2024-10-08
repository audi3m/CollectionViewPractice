//
//  PracticeItem.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import Foundation

enum Section: CaseIterable {
    case main
    case sub
}

enum PracticeItem: Hashable {
    case typeA(ItemA)
    case typeB(ItemB)
}

struct ItemA: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct ItemB: Identifiable, Hashable {
    let id = UUID()
    let name: String
}
