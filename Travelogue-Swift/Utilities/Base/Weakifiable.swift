//
//  Weakifiable.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import Foundation

protocol Weakifiable: AnyObject { }

extension NSObject: Weakifiable { }

private extension Weakifiable {
    func weakify<T>(_ code: @escaping (Self, T) -> Void) -> (T) -> Void {
        return { [weak self] (data) in
            guard let self = self else { return }
            code(self, data)
        }
    }
}
