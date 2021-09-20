//
//  LoadImageProtocol.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation
import UIKit


/// Это сервис для работы с изображениями из постов.
//protocol PostsImagesServiceProtocol {
//
//    /// Загрузить изображение из поста.
//    /// - Parameters:
//    ///   - data: Структура, в которой хранятся посты.
//    ///   - completion: Замыкание.
//    ///
//    ///  Успех: Возвращает картинку.
//    /// Ошибка: LoadImageServiceEror.
//    func loadImage(data: DemoData, completion: @escaping (Result<UIImage, Error>) -> Void)
//}

/// Это сервис для работы с изображениями.
protocol ImagesServiceProtocol {
    
    /// Загрузить изображение.
    /// - Parameters:
    ///   - url: URL картинки.
    ///   - completion: Замыкание с картинкой.
    ///
    ///  Успех: Возвращает картинку.
    /// Ошибка: LoadImageServiceEror.
    func loadImage(url: URL, completion: @escaping (Result<UIImage, Error>) -> Void)
}

extension ImagesServiceProtocol {
    
    func loadImage(data: DemoData, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url =  data.imageUrl else {

            completion(.failure(ImageServiceEror.invalidURL))
            return
        }
        loadImage(url: url, completion: completion)
    }
}

protocol UserImageServiceProtocol: ImagesServiceProtocol {
    
    func loadIcon()
}

