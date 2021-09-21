//
//  ViewController.swift
//  test
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var posts = [DemoDataEntity]()
    
//    private let postPresenter = PostsPresenter(postsService: PostsService())
    
    let requestService: PostServiceProtocol = PostsService()
    
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
        
        title = "Super"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        requestService.getPostsData { [weak self] result in
            switch result{
            case .success(let posts):
                self?.posts = posts

                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                print("success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    //это в роутер в вмс - относится к контроллеру
    //а из роутера одна функция типа postDetailController которая принимает dataEntity
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        viewController.title = "yep"
//        show(viewController, sender: nil)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true) {
        
            print("hey")
        }
        
        
        //!!!!
        //разобраться
//        navigationController
//        navigationItem. свойство контроллера
//        navigationController.navigationBar
        //конец
        
//        navigationController?.pushViewController(viewController, animated: false)

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        let data = posts[indexPath.row]
    
        cell.data = data
        cell.nameLabel.text = data.title
        cell.explanLabel.text = data.explanation

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
}
