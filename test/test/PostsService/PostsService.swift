//
//  Request.swift
//  test
//
//  Created by OUT-Korogodova-MM on 12.09.2021.
//

import Foundation

final class PostsService {
    
    /// Этот массив нужен для хранения всех данных.
    /// Виден и существует только в этом сервисе.
    var postsArray = [DemoData]()
    
    /// Этот массив хранит только нужные для view данные.
    /// Дополнительный слой - entity.
    var posts = [DemoDataEntity]()
}

extension PostsService: PostServiceProtocol {
    
    enum EndPoint {
        
        case getPostsData
        case getSomething
        
        var url: URL? {
            switch self {
            case .getPostsData:
                return URL(string: "https://api.nasa.gov/planetary/apod?api_key=3LomLzdjD0yDLoWaZq80ptocSS1VBHrhFb6jE261&count=6")
            case .getSomething:
                return URL(string: "random")
            }
        }
    }
    
    enum PostServiceError: Error {
        
        case urlError
        
        var description: String {
            switch self {
            case .urlError:
                return "Invalid url."
            }
        }
    }
    
    func getPostsData(completion: @escaping (Result<[DemoDataEntity], Error>) -> Void) {
        
        guard let url = EndPoint.getPostsData.url else {
            completion(.failure(PostServiceError.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                return
            }
        
            do {
                let dataArray = try JSONDecoder().decode([DemoData].self, from: data)
                self.posts = dataArray.map { post in DemoDataEntity(data: post) }
                completion(.success(self.posts))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
