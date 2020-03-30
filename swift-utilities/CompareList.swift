//
//  CompareList.swift
//  swift-utilities
//
//  Created by Levy on 30/03/2020.
//  Copyright © 2020 Netzon. All rights reserved.
//

import Foundation

func compare<T: Equatable>(oldList: [T], newList: [T]) -> ([T], [T]) {
    return (added  (oldList: oldList, newList: newList),
            removed(oldList: oldList, newList: newList))
}

func added<T: Equatable>(oldList: [T], newList: [T]) -> [T] {
    var added: [T] = []
    for item in newList {
        if oldList.contains(item) {
            continue
        }
        added.append(item)
    }
    return added
}

func removed<T: Equatable>(oldList: [T], newList: [T]) -> [T] {
    var removed: [T] = []
    for item in oldList {
        if newList.contains(item) {
            continue
        }
        removed.append(item)
    }
    return removed
}

