//
//  ProductItemModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import Foundation
import RealmSwift

class ProductItemModel: Identifiable, ObservableObject {
    @objc dynamic var productName: String = ""
    @objc dynamic var productId: String = ""
    @objc dynamic var count: Int = 0
    @objc dynamic var productDescription: String = ""
    @objc dynamic var originalPrice: Double = 0.0
    
    convenience init(productName: String, productId: String, count: Int, description: String, originalPrice: Double) {
        self.init()
        self.productName = productName
        self.productId = productId
        self.count = count
        self.productDescription = description
        self.originalPrice = originalPrice
    }
    
    convenience init(productName: String, count: Int, description: String, originalPrice: Double) {
        self.init()
        self.productName = productName
        self.productId = UUID().uuidString
        self.count = count
        self.productDescription = description
        self.originalPrice = originalPrice
    }
    
    init() {
        self.productId = UUID().uuidString
    }
    
    func setCount(count: String) {
        if (!count.isEmpty) {
            self.count = Int.init(count) ?? 0
        }
    }
    
    func getCount() -> String {
        return String.init(self.count )
    }
    
    func setOriginalPrice(price: String) {
        if (!price.isEmpty) {
            self.originalPrice = Double.init(price) ?? 0.0
        }
    }
    
    func getOriginalPrice() -> String {
        return String.init(self.originalPrice )
    }
}
