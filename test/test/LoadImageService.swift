//
//  LoadImageService.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation
import UIKit

/// сервис для загрузки изображения
class LoadImageService: LoadImageProtocol{
    /// загружает изображение в ячейку
    func loadImage(data: DemoData?, completion: @escaping (UIImage) -> Void) {
        if let hdurl =  data?.hdurl, let myURL = URL(string: hdurl)
        {
            URLSession.shared.dataTask(with: myURL) { data, response, error in
                   guard
                       let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                       let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                       let data = data, error == nil,
                       let image = UIImage(data: data)
                       else { return }
                    completion(image)
        }.resume()
    }
}
}

