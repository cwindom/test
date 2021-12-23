//
//  ViewProtocols.swift
//  test
//
//  Created by OUT-Korogodova-MM on 22.12.2021.
//

import Foundation

protocol ViewOutputProtocol {
    
    func viewDidLoad()
    func getPostsData() -> [DemoDataEntity]
}

protocol ViewInputProtocol: AnyObject {
    
    func reloadTableViewData()
}
