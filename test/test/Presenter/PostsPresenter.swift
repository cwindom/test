//
//  PostsPresenter.swift
//  test
//
//  Created by OUT-Korogodova-MM on 20.09.2021.
//

import Foundation

/// Протокол делегата. Мы будем использовать его, когда захотим передать информацию от presenter в view. Здесь это позволит отправить информацию обратно VC.
protocol PostsViewDelegate: NSObjectProtocol {
    func getPosts(completion: @escaping () -> Void)
}

class PostsPresenter {
    
    // Он принадлежит презентеру
    //private
    let postsService: PostsService
    
    // weak ссылка на делегат, поскольку сам презентер будет принадлежать VC
    weak private var delegate: PostsViewDelegate?
    
    init(postsService: PostsService) {
        self.postsService = postsService
    }
    
    func setViewDelegate(postServiceDelegate: PostsViewDelegate?) {
        self.delegate = postServiceDelegate
    }
    
//    func postsArrayCount() -> Int {
//        postsService.posts.count
//    }
    
    
    func getPosts(completion: @escaping () -> Void) {
        postsService.getPostsData { [weak self] result in
            switch result{
            case .success(let posts):
//                self?.postsService.posts = posts

                completion()

                print("success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
