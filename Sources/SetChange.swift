//
//  SetChange.swift
//  GlueKit
//
//  Created by Károly Lőrentey on 2016-08-12.
//  Copyright © 2016. Károly Lőrentey. All rights reserved.
//

import Foundation

public struct SetChange<Element: Hashable>: ChangeType {
    public typealias Value = Set<Element>

    public private(set) var removed: Set<Element>
    public private(set) var inserted: Set<Element>

    public init(removed: Set<Element> = [], inserted: Set<Element> = []) {
        self.inserted = inserted
        self.removed = removed
    }

    public init(from oldValue: Value, to newValue: Value) {
        self.removed = oldValue.subtracting(newValue)
        self.inserted = newValue.subtracting(oldValue)
    }

    public var isEmpty: Bool {
        return inserted.isEmpty && removed.isEmpty
    }

    public func apply(on value: Value) -> Value {
        return inserted.union(value.subtracting(removed))
    }

    public mutating func merge(with next: SetChange) {
        removed = next.removed.union(removed)
        inserted = next.inserted.union(inserted.subtracting(next.removed))
    }

    public func merged(with next: SetChange) -> SetChange {
        return SetChange(removed: next.removed.union(removed),
                         inserted: next.inserted.union(inserted.subtracting(next.removed)))
    }
}

extension Set {
    public mutating func apply(_ change: SetChange<Element>) {
        self.subtract(change.removed)
        for e in change.inserted {
            self.update(with: e)
        }
    }
}
