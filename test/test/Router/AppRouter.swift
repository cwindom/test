//
//  AppRouter.swift
//  test
//
//  Created by OUT-Korogodova-MM on 22.09.2021.
//

import Foundation
import UIKit

final class AppRouter {
    
    static func buildMainModule() -> UIViewController {
        
        let postsService = PostsService()
        
        let view = View()
        view.navigationItem.title = "Super"
        let presenter = Presenter(view: view, postsService: postsService)
        view.output = presenter
        
        return view
    }
    
    static func presentMainModule(from viewController: UIViewController?) {
        
        let mainModule = buildMainModule()
        viewController?.present(mainModule, animated: true)
    }
    
    
}
