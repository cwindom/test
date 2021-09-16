//
//  LoadImageService.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation
import UIKit

final class LoadImageService {
    
}

extension LoadImageService: LoadImageProtocol {
    
    enum LoadImageServiceEror: Error {
        
        case imageServiceError
        
        var description: String {
            switch self {
            case .imageServiceError:
                return "Cant load image."
            }
        }
    }
    
    func loadImage(data: DemoData?, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let hdurl =  data?.hdurl, let myURL = URL(string: hdurl) {
            URLSession.shared.dataTask(with: myURL) { data, response, error in
                   guard
                       let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                       let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                       let data = data, error == nil,
                       let image = UIImage(data: data)
                       else {
                        completion(.failure(LoadImageServiceEror.imageServiceError))
                        return
                        }
                completion(.success(image))
        }.resume()
    }
}
}

