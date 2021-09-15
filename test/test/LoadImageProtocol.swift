//
//  LoadImageProtocol.swift
//  test
//
//  Created by OUT-Korogodova-MM on 14.09.2021.
//

import Foundation
import UIKit

protocol LoadImageProtocol{
    /// загружает изображение в ячейку
    func loadImage(data: DemoData?, completion: @escaping (UIImage) -> Void) -> ()
}
