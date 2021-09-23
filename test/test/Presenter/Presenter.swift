//
//  PostsPresenter.swift
//  test
//
//  Created by OUT-Korogodova-MM on 20.09.2021.
//

import Foundation
import UIKit

final class Presenter {
    
    weak var view: ViewInputProtocol?
    
    var router: RouterInputProtocol?
    
    let postsService:PostServiceProtocol
    
    var imageService = ImageService()
    
    var posts = [DemoDataEntity]()
    
    
    
    init(view: ViewInputProtocol?, postsService: PostServiceProtocol) {
        
        self.view = view
        self.postsService = postsService
    }
    
    func loadPosts() {
        
        postsService.getPostsData { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                
                let items = posts.map { post in
                    ListItemModel(title: post.title, explanation: post.explanation, imageUrl: post.imageUrl)
                    
                }
                DispatchQueue.main.async {
                    self?.view?.showList(with: items)
                }
            case .failure:
                self?.view?.showError(message: "Что-то пошло не так")
            }
        }
    }
    
    
//    func getPosts(completion: @escaping () -> Void) {
//        postsService.getPostsData { [weak self] result in
//            switch result{
//            case .success(let posts):
//
//                self?.posts = posts
//
//                completion()
//
//                print("success")
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}

extension Presenter: ViewOutputProtocol {
    
    func viewDidLoad() {
        
        loadPosts()
    }
    
//    func didTapPostItem(at position: Int) {
//
//
//    }
}
