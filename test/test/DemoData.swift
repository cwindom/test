//
//  DemoData.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import Foundation

//https://app.quicktype.io/

/// Эта структура хранит данные из поста.
struct DemoData: Codable{
    
    let date: String
    
    /// Описание поста.
    let explanation: String
    
    /// URL для изобрвжения.
    let hdurl: String?
    let mediaType: String
    let serviceVersion: String
    
    /// Заголовок поста.
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
