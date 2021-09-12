//
//  Request.swift
//  test
//
//  Created by OUT-Korogodova-MM on 12.09.2021.
//

import Foundation

class RequestService{
    var dataArray = [DemoData]()
    func getData(completion: @escaping (() -> ())) {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=3LomLzdjD0yDLoWaZq80ptocSS1VBHrhFb6jE261&count=6")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
        
            for i in try! JSONDecoder().decode([DemoData].self, from: data) {
                self.dataArray.append(i)
            }
            completion()
        }.resume()
    }
}
