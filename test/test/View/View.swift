//
//  ViewController.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import UIKit

class View: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: ViewOutputProtocol?
    
    lazy var tableView: UITableView = {
        
        let table = UITableView()
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupView() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(self.tableView)
        setupConstraints()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupView()
        
        self.presenter = Presenter(view: self)
        presenter?.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        guard let data = presenter?.getPosts() else { return cell }
    
        cell.data = data[indexPath.row]
        cell.nameLabel.text = data[indexPath.row].title
        cell.explanLabel.text = data[indexPath.row].explanation

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let data = presenter?.getPosts() else { return 0 }
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
}

extension View: ViewInputProtocol {
    
    func reloadTableViewData() {
        
        tableView.reloadData()
    }
}
