//
//  ProductItemModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import Foundation

class ProductItemModel: Identifiable, ObservableObject {
    @Published var productName: String?
    @Published var productId: String!
    @Published var count: Int?
    @Published var description: String?
    @Published var originalPrice: Double?
    
    convenience init(productName: String, productId: String, count: Int, description: String, originalPrice: Double) {
        self.init()
        self.productName = productName
        self.productId = productId
        self.count = count
        self.description = description
        self.originalPrice = originalPrice
    }
    
    convenience init(productName: String, count: Int, description: String, originalPrice: Double) {
        self.init()
        self.productName = productName
        self.productId = UUID().uuidString
        self.count = count
        self.description = description
        self.originalPrice = originalPrice
    }
    
    init() {
        self.productId = UUID().uuidString
    }
    
    func setCount(count: String) {
        if (!count.isEmpty) {
            self.count = Int.init(count)
        }
    }
    
    func getCount() -> String {
        if (self.count == nil || self.count == 0) {
            return ""
        }
        
        return String.init(self.count ?? 0)
    }
    
    func setOriginalPrice(price: String) {
        if (!price.isEmpty) {
            self.originalPrice = Double.init(price)
        }
    }
    
    func getOriginalPrice() -> String {
        if (self.originalPrice == nil || self.originalPrice == 0.0) {
            return ""
        }
        
        return String.init(self.originalPrice ?? 0.0)
    }
}
