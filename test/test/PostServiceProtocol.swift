//
//  PostServiceProtocol.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation

protocol PostServiceProtocol{
    /// метод делает запрос и сохраняет данные в стуктуру
    func getPostsData(completion: @escaping () -> Void) -> ()
}
