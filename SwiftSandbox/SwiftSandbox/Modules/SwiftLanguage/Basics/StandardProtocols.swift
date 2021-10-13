//
//  StandardProtocols.swift
//  SwiftSandbox
//
//  Created by r.r.amirova on 13.10.2021.
//

import Foundation

class StandardProtocols: Provable {

    func demonstrate() {

    }
}

// Hashable

extension Dog: Equatable {

    static func == (lhs: Dog, rhs: Dog) -> Bool {
        lhs.name == rhs.name
    }
}

extension Dog: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension Dog: Comparable {

    static func < (lhs: Dog, rhs: Dog) -> Bool {
        lhs.name < rhs.name
    }
}
