//
//  Code+.swift
//  GitHubRepos
//
//  Created by Isaac Iniongun on 25/11/2023.
//

import Foundation

typealias VoidAction = (() -> Void)
typealias ArgumentAction<T> = ((T) -> Void)

extension Collection {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

@discardableResult func with<T>(_ it: T, f:(T) -> ()) -> T {
    f(it)
    return it
}

func runAfter(_ delay: Double = 0.2, block: @escaping VoidAction) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        block()
    }
}

func runOnMainThread(action: @escaping () -> Void) {
    DispatchQueue.main.async {
        action()
    }
}

func runOnBackground(
    qos: DispatchQoS.QoSClass = .userInitiated,
    action: @escaping () -> Void
) {
    DispatchQueue.global(qos: qos).async {
        action()
    }
}
