//
//  DemoData.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import Foundation

//https://app.quicktype.io/


struct DemoData: Codable{
    let date, explanation: String
    let hdurl: String?
    let mediaType, serviceVersion, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
