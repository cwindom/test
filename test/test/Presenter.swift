//
//  Presenter.swift
//  test
//
//  Created by OUT-Korogodova-MM on 22.12.2021.
//

import Foundation

final class Presenter: ViewOutputProtocol {
    
    public weak var view: ViewInputProtocol!
    let requestService = PostsService()
    
    init(view: ViewInputProtocol?) {
        
        self.view = view
    }
    
    func loadPosts() {
        
        requestService.getPostsData { [weak self] result in
            switch result {
            case .success(let posts):
                self?.requestService.posts = posts
                
                DispatchQueue.main.async {
                    self?.view?.reloadTableViewData()
                }
                print("success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func viewDidLoad() {
        
        loadPosts()
    }
    
    func getPostsData() -> [DemoDataEntity] {
        
        requestService.posts
    }
    
}
