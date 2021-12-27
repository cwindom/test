//
//  PostServiceProtocol.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation

/// Это сервис для работы с постами.
//sourcery: AutoMockable
protocol PostServiceProtocol {
    
    /// Получить массив постов.
    /// - Parameter completion: Замыкание с массивом постов.
    func getPostsData(completion: @escaping (Result<[DemoDataEntity], Error>) -> Void)
}

