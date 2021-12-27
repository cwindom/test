//
//  TestService.swift
//  test
//
//  Created by OUT-Korogodova-MM on 27.12.2021.
//

import UIKit

protocol ProductServiceProtocol {
    
    func apply(clientCardDiscont: ClientCardDiscont, coupon: Int) -> Double
}

class ClientCardDiscont {
    
    var discountInPercent: Int
    let discountRange = 1...20
    private let defaultDiscont = 1
    
    init(discountInPercent: Int) {
        self.discountInPercent = (discountRange ~= discountInPercent) ? discountInPercent : defaultDiscont
    }
}

class ProductService: ProductServiceProtocol {
    
    var price: Double
    
    init(price: Double) {
        self.price = price
    }
    
    func applyCoupon(coupon: Int) -> Double {
        
        price -= Double(coupon)
        guard price > 0 else {
            price = 1
            return price
        }
        
        return price
    }
    
    func applyClientCardDiscont(discount: Int) {
        
        let multiplier = Double(100 - discount) / Double(100)
        price = price * multiplier
    }
    
    func apply(clientCardDiscont: ClientCardDiscont, coupon: Int) -> Double {
        
        applyClientCardDiscont(discount: clientCardDiscont.discountInPercent)
        guard coupon > 0 && coupon < Int(price) else {
            return price
        }
        
        return applyCoupon(coupon: coupon)
    }
}
