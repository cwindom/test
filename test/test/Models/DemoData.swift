//
//  DemoData.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import Foundation

//https://app.quicktype.io/

/// Эта структура хранит данные из поста.
struct DemoData: Codable {
    
    let date: String
    
    /// Описание поста.
    var explanation: String
    
    /// URL для изображения.
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

extension DemoData {
    
    var imageUrl: URL? {
        guard let hdurl = hdurl else {
            return nil
        }
        return URL(string: hdurl)
    }
}

struct DemoDataEntity: Equatable {
    
    let date: String
    let title: String
    let explanation: String
    let imageUrl: URL?
    
    init(data: DemoData) {
        self.date = data.date
        self.title = data.title
        self.explanation = data.explanation
        self.imageUrl = data.imageUrl
    }
}

protocol DemoDataProtocol {
    
    var title: String { get }
    var explanation: String { get set }
}

extension DemoData: DemoDataProtocol {

}

