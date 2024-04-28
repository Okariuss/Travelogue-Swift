//
//  BaseViewModelDelegate.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 26.04.2024.
//

import Foundation

protocol BaseViewModelDelegate where T: BaseViewControllerDelegate {
    associatedtype T
    var view: T? { get set }
    func viewDidLoad()
}
