//
//  ViewController.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray = [DemoData]()
    
//    weak var testView: UIView!
//
//    override func loadView() {
//        super.loadView()
//
//        let testView = UIView(frame: .zero)
//        testView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(testView)
//        NSLayoutConstraint.activate([
//            testView.widthAnchor.constraint(equalToConstant: 64),
//            testView.widthAnchor.constraint(equalTo: testView.heightAnchor),
//            testView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            testView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//        ])
//        self.testView = testView
//    }
    
    //@IBOutlet var tableView: UITableView!
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
        
        title = "Galaxy"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    

    
    func getData() {
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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let data = dataArray[indexPath.row]
        
        //debugPrint(indexPath.row, data.hdurl)
        
    
        cell.data = data
        cell.nameLabel.text = data.title
        cell.explanLabel.text = data.explanation
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Мы говорим таблице что в 0-ой секции будет ячеек столько, сколько элементов в структуре data.
        switch tableView {
           case self.tableView:
              return self.dataArray.count
            default:
              return 0
           }
        //return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

