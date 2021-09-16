//
//  LoadImageProtocol.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation
import UIKit

/// Это сервис для работы с изображениями из постов.
protocol LoadImageProtocol{
    
    /// Загрузить изображение.
    /// - Parameters:
    ///   - data: Структура, в которой хранятся посты.
    ///   - completion: Замыкание.
    func loadImage(data: DemoData?, completion: @escaping (Result<UIImage, Error>) -> Void)
}
