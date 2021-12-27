//
//  ViewProtocols.swift
//  test
//
//  Created by OUT-Korogodova-MM on 22.12.2021.
//

import Foundation

protocol ViewOutputProtocol {
    
    func viewDidLoad()
    func getPosts() -> [DemoDataEntity]
}

protocol ViewInputProtocol: AnyObject {
    
    func reloadTableViewData()
}
