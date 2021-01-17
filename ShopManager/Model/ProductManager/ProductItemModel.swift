//
//  ProductItemModel.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import Foundation
import RealmSwift

class ProductItemModel: Identifiable, ObservableObject {
    var productName: String = ""
    var id: String = UUID().uuidString
    var count: Int = 0
    var productDescription: String = ""
    var originalPrice: Double = 0.0
    
    convenience init(productName: String, id: String, count: Int, description: String, originalPrice: Double) {
        self.init()
        self.productName = productName
        self.id = id
        self.count = count
        self.productDescription = description
        self.originalPrice = originalPrice
    }
    
    convenience init(productName: String, count: Int, description: String, originalPrice: Double) {
        self.init()
        self.productName = productName
        self.id = UUID().uuidString
        self.count = count
        self.productDescription = description
        self.originalPrice = originalPrice
    }
    
    init() {
        self.id = UUID().uuidString
    }
    
    init(model: ProductItemRealmModel) {
        self.productName = model.productName
        self.id = model.id
        self.count = model.count
        self.productDescription = model.productDescription
        self.originalPrice = model.originalPrice
    }
    func setCount(count: String) {
        if (!count.isEmpty) {
            self.count = Int.init(count) ?? 0
        }
    }
    
    func getCount() -> String {
        if (self.count == 0) {return ""}
        return String.init(self.count )
    }
    
    func setOriginalPrice(price: String) {
        if (!price.isEmpty) {
            self.originalPrice = Double.init(price) ?? 0.0
        }
    }
    
    func getOriginalPrice() -> String {
        if (self.originalPrice == 0.0) {
            return ""
        }
        return String.init(self.originalPrice )
    }
}

class ProductItemRealmModel: Object {
    @objc dynamic var productName: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var count: Int = 0
    @objc dynamic var productDescription: String = ""
    @objc dynamic var originalPrice: Double = 0.0
    override static func primaryKey() -> String? {
        "id"
    }
}

extension ProductItemRealmModel {
    convenience init(model: ProductItemModel) {
        self.init()
        self.productName = model.productName
        self.id = model.id
        self.count = model.count
        self.productDescription = model.productDescription
        self.originalPrice = model.originalPrice
    }
}
