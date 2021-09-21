//
//  PostServiceProtocol.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation

/// Это сервис для работы с постами.
protocol PostServiceProtocol: PostsServiceStorageProtocol {
    
    /// Получить массив постов.
    /// - Parameter completion: Замыкание с массивом постов.
    func getPostsData(completion: @escaping (Result<[DemoDataEntity], Error>) -> Void)
}

protocol PostsServiceStorageProtocol {
    
    //массив постов, в каком случае обновляется/сохраняется
    //в случае неудачи вернуть закешированный массив постов
}

