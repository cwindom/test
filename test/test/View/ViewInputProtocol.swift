//
//  ViewInputProtocol.swift
//  test
//
//  Created by OUT-Korogodova-MM on 22.09.2021.
//

import Foundation

struct ListItemModel {
    
    let title: String
    let explanation: String
    let imageUrl: URL?
    
}

protocol ViewInputProtocol: AnyObject {
    
    func showList(with items: [ListItemModel])
    
    func showError(message: String)
}

