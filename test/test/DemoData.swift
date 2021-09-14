//
//  DemoData.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import Foundation

//https://app.quicktype.io/


/// структура для хранения данных из поста
struct DemoData: Codable{
    /// дата поста, его описание
    let date, explanation: String
    /// hdurl
    let hdurl: String?
    /// тип данных, версия сервиса, заголовок поста
    let mediaType, serviceVersion, title: String
    /// url
    let url: String

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
