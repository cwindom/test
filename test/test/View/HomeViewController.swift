//
//  ViewController.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let postPresenter = PostsPresenter(postsService: PostsService())
    
    let requestService = PostsService()
    
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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        postPresenter.getPosts {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
//        requestService.getPostsData { [weak self] result in
//            switch result{
//            case .success(let posts):
//                self?.requestService.posts = posts
//
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//                print("success")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        
        let data = postPresenter.postsService.posts[indexPath.row]
//        let data = requestService.posts[indexPath.row]
    
        cell.data = data
        cell.nameLabel.text = data.title
        cell.explanLabel.text = data.explanation

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
           case self.tableView:
            return postPresenter.postsArrayCount()
//              return requestService.posts.count
            default:
              return 0
           }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
}

