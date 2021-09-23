//
//  LoadImageService.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation
import UIKit

enum ImageServiceEror: Error {
    
    case imageServiceError
    case invalidURL
    
    var description: String {
        switch self {
        case .imageServiceError:
            return "Cant load image."
        case .invalidURL:
            return "Invalid URL."
        }
    }
}

final class ImageService {
    
}

extension ImageService: ImagesServiceProtocol {
    
    func loadImage(url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data,
                  let image = UIImage(data: data) else {
                completion(.failure(ImageServiceEror.imageServiceError))
                return
            }
            completion(.success(image))
        }.resume()
    }
}
