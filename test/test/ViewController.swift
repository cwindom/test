//
//  ViewController.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var dataArray = [DemoData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=3LomLzdjD0yDLoWaZq80ptocSS1VBHrhFb6jE261&count=6")!

        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
        
            for apod in try! JSONDecoder().decode([DemoData].self, from: data) {
                self.dataArray.append(apod)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        
        let data = dataArray[indexPath.row]
        
        debugPrint(indexPath.row, data.hdurl)
        
        cell.data = data
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
}

